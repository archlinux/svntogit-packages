GLib = imports.gi.GLib;

(function() {

/* Variant Sugar 
 * Provide commodities methods to convert Variant from/to javascript object.
 * variant.toJS() : returns a javascript object representing the Variant 
 # @variant
 * Variant.new(signature, value): returns a GVariant structure representing
 * the javascript object @value
 *
 * This implementation uses json-glib's json <-> variant conversion facilities
 * if presents and fallback to a javascript implementation otherwise.
 * This javascript implementation is imported from gjs with modification for
 * JSCore compatibility (Copyright 2011 Giovanni Campagna,
 * see gjs/override/GLib.js for licence)
 */

    // Use json-glib's json <-> variant conversion if present.
    // Defaults to javascript code imported from gjs otherwise.
    GLib.Variant.prototype.to_js = function(signature) {
	return _toJS(signature, this);
    }
    var toVariant = _toVariant;
    
    try {
	JSONGLib = imports.gi.Json;
    }
    catch (e) {}

    if (JSONGLib && JSONGLib.gvariant_serialize_data)
    {
	GLib.Variant.prototype.to_js = function(signature) {
	    return _toJSNative(signature, this);
	}
	toVariant = _toVariantNative;
    }

    GLib.Variant.new = function (value, sig) {
	var signature = Array.prototype.slice.call(sig);

	if (signature.length != 0)
	    throw new TypeError('Invalid GVariant signature (more than one single complete type)');
	var variant = toVariant(signature, value);
	return variant;
    }

    GLib.Variant.prototype.toString = function() {
	return '[object variant of type "' + this.get_type_string() + '"]';
    };

/// End Variant Sugar ///
}).apply();

function _toVariantNative(signature, object)
{
    if (!object || object == '')
	return null;
    if (!signature || signature == '')
	signature = null;

    return JSONGLib.gvariant_deserialize_data (JSON.stringify (object),
						       -1, signature);
};

function _toJSNative(signature, variant)
{
    if (!variant)
	return;

    var jsonStr = JSONGLib.gvariant_serialize_data (variant, signature);
    if (!jsonStr)
	return;

    return JSON.parse (jsonStr);
};

// Code imported from gjs, modified for JSCore idoms.
// Copyright 2011 Giovanni Campagna (see gjs/override/GLib.js for licence)

const SIMPLE_TYPES = ['b', 'y', 'n', 'q', 'i', 'u', 'x', 't', 'h', 'd', 's', 'o', 'g'];

function _read_single_type(signature, forceSimple) {
    var char = signature.shift();
    var isSimple = false;

    if (SIMPLE_TYPES.indexOf(char) == -1) {
	if (forceSimple)
	    throw new TypeError('Invalid GVariant signature (a simple type was expected)');
    } else
	isSimple = true;

    if (char == 'm' || char == 'a')
	return [char].concat(_read_single_type(signature, false));
    if (char == '{') {
	var key = _read_single_type(signature, true);
	var val = _read_single_type(signature, false);
	var close = signature.shift();
	if (close != '}')
	    throw new TypeError('Invalid GVariant signature for type DICT_ENTRY (expected "}"');
	return [char].concat(key, val, close);
    }
    if (char == '(') {
	var res = [char];
	while (true) {
	    if (signature.length == 0)
		throw new TypeError('Invalid GVariant signature for type TUPLE (expected ")")');
	    var next = signature[0];
	    if (next == ')') {
		signature.shift();
		return res.concat(next);
	    }
	    var el = _read_single_type(signature);
	    res = res.concat(el);
	}
    }

    // Valid types are simple types, arrays, maybes, tuples, dictionary entries and variants
    if (!isSimple && char != 'v')
	throw new TypeError('Invalid GVariant signature (' + char + ' is not a valid type)');

    return [char];
}


function _toVariant(signature, value) {
    if (signature.length == 0)
	    throw new TypeError('GVariant signature cannot be empty');

    var char = signature.shift();
    switch (char) {
    case 'b':
	return GLib.Variant.new_boolean(value);
    case 'y':
	return GLib.Variant.new_byte(value);
    case 'n':
	return GLib.Variant.new_int16(value);
    case 'q':
	return GLib.Variant.new_uint16(value);
    case 'i':
	return GLib.Variant.new_int32(value);
    case 'u':
	return GLib.Variant.new_uint32(value);
    case 'x':
	return GLib.Variant.new_int64(value);
    case 't':
	return GLib.Variant.new_uint64(value);
    case 'h':
	return GLib.Variant.new_handle(value);
    case 'd':
	return GLib.Variant.new_double(value);
    case 's':
	return GLib.Variant.new_string(value);
    case 'o':
	return GLib.Variant.new_object_path(value);
    case 'g':
	return GLib.Variant.new_signature(value);
    case 'v':
	return GLib.Variant.new_variant(value);
    case 'm':
	if (value != null)
	    return GLib.Variant.new_maybe(null, _pack_variant(signature, value))
	else
	    return GLib.Variant.new_maybe(GLib.VariantType.new(_read_single_type(signature, false).join('')), null);
    case 'a':
	var arrayType = _read_single_type(signature, false);
	if (arrayType[0] == 's') {
	    // special case for array of strings
	    return GLib.Variant.new_strv(value, value.length);
	}
	if (arrayType[0] == 'y') {
	    // special case for array of bytes
	    return GLib.Variant.new_bytestring(value);
	}
	if (arrayType[0] == 'a' && arrayType[1] == 'y') {
	    // special case for array of array of bytes
	    return GLib.Variant.new_bytestring_array(value, value.length);
	}

	var arrayValue = [];
	if (arrayType[0] == '{') {
	    // special case for dictionaries
	    for (var key in value) {
		var copy = [].concat(arrayType);
		var child = _pack_variant(copy, [key, value[key]]);
		arrayValue.push(child);
	    }
	} else {
	    for (var i = 0; i < value.length; i++) {
		var copy = [].concat(arrayType);
		var child = _pack_variant(copy, value[i]);
		arrayValue.push(child);
	    }
	}
	return GLib.Variant.new_array(GLib.VariantType.new(arrayType.join('')), arrayValue, arrayValue.length);
    case '(':
	var children = [ ];
	for (var i = 0; i < value.length; i++) {
	    var next = signature[0];
	    if (next == ')')
		break;
	    children.push(_pack_variant(signature, value[i]));
	}

	if (signature[0] != ')')
	    throw new TypeError('Invalid GVariant signature for type TUPLE (expected ")")');
	signature.shift();
	return GLib.Variant.new_tuple(children, children.length);
    case '{':
	var key = _pack_variant(signature, value[0]);
	var child = _pack_variant(signature, value[1]);

	if (signature[0] != '}')
	    throw new TypeError('Invalid GVariant signature for type DICT_ENTRY (expected "}")');
	signature.shift();

	return GLib.Variant.new_dict_entry(key, child);
    default:
	throw new TypeError('Invalid GVariant signature (unexpected character ' + char + ')');
    }
}

function _toJS(signature, variant) {
    switch (String.fromCharCode(variant.classify())) {
    case 'b':
	return variant.get_boolean();
    case 'y':
	return variant.get_byte();
    case 'n':
	return variant.get_int16();
    case 'q':
	return variant.get_uint16();
    case 'i':
	return variant.get_int32();
    case 'u':
	return variant.get_uint32();
    case 'x':
	return variant.get_int64();
    case 't':
	return variant.get_uint64();
    case 'h':
	return variant.get_handle();
    case 'd':
	return variant.get_double();
    case 'o':
    case 'g':
    case 's':
	// g_variant_get_string has length as out argument
	return variant.get_string();
    case 'v':
	return variant.get_variant();
    case 'm':
	var val = variant.get_maybe();
	return _toJS(val);
    case 'a':
	if (variant.is_container()) {
	    // special case containers
	    var ret = { };
	    var nElements = variant.n_children();
	    for (var i = 0; i < nElements; i++) {
		// always unpack the dictionary entry, and always unpack
		// the key (or it cannot be added as a key)
		var val = _toJS(variant.get_child_value(i));
		var key = val[0].classify ? _toJS(val[0]) : val[0];
		ret[key] = val[1] && val[1].classify ? _toJS(val[1]) : val[1]
	    }
	    return ret;
	}
	// fall through
    case '(':
    case '{':
	var ret = [ ];
	var nElements = variant.n_children();
	for (var i = 0; i < nElements; i++) {
	    var val = variant.get_child_value(i);
	    ret.push(_toJS(val));
	}
	return ret;
    }

    throw new Error('Assertion failure: this code should not be reached');
}
