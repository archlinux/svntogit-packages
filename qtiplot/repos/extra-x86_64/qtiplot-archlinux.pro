#############################################################################
###################### USER-SERVICEABLE PART ################################
#############################################################################

# building without muParser doesn't work yet
SCRIPTING_LANGS += muParser
SCRIPTING_LANGS += Python

# a console displaying output of scripts; particularly useful on Windows
# where running QtiPlot from a terminal is inconvenient
DEFINES         += SCRIPTING_CONSOLE
# a dialog for selecting the scripting language on a per-project basis
DEFINES         += SCRIPTING_DIALOG

CONFIG          += release
#CONFIG          += debug

# what to install and where
INSTALLS        += target
INSTALLS        += documentation
unix: INSTALLBASE = /usr
win32: INSTALLBASE = c:/QtiPlot

unix: target.path = $$INSTALLBASE/bin
unix: documentation.path = $$INSTALLBASE/share/doc/qtiplot
win32: target.path = $$INSTALLBASE
win32: documentation.path = $$INSTALLBASE/doc

##################### 3rd PARTY HEADER FILES SECTION ########################
#!!! Warning: You must modify these paths according to your computer settings
#############################################################################

#INCLUDEPATH       += ../3rdparty/muparser/include
#INCLUDEPATH       += ../3rdparty/qwtplot3d/include
#INCLUDEPATH       += ../3rdparty/qwt/src
#INCLUDEPATH       += ../3rdparty/liborigin
#INCLUDEPATH       += ../3rdparty/gsl/include
#INCLUDEPATH       += ../3rdparty/zlib123/include

INCLUDEPATH       += /usr/include/
INCLUDEPATH       += /usr/include/qwtplot3d/
INCLUDEPATH       += /usr/include/qwt/
INCLUDEPATH       += ../3rdparty/liborigin
INCLUDEPATH       += /usr/include/gsl/
INCLUDEPATH       += ../3rdparty/zlib123/include

##################### 3rd PARTY LIBRARIES SECTION ###########################
#!!! Warning: You must modify these paths according to your computer settings
#############################################################################

##################### Linux (Mac OS X) ######################################

# statically link against libraries in 3rdparty
#unix:LIBS         += ../3rdparty/muparser/lib/libmuparser.a
#unix:LIBS         += ../3rdparty/qwtplot3d/lib/libqwtplot3d.a
#unix:LIBS         += ../3rdparty/qwt/lib/libqwt.a
#unix:LIBS         += ../3rdparty/gsl/lib/libgsl.a
#unix:LIBS         += ../3rdparty/gsl/lib/libgslcblas.a

# dynamically link against dependencies if they are installed system-wide
unix:LIBS         += -lmuparser
unix:LIBS         += -lqwtplot3d
unix:LIBS         += -lqwt
unix:LIBS         += -lgsl -lgslcblas

##################### Windows ###############################################

win32:LIBS        += ../3rdparty/muparser/lib/libmuparser.a
win32:LIBS        += ../3rdparty/qwtplot3d/lib/libqwtplot3d.a
win32:LIBS        += ../3rdparty/qwt/lib/libqwt.a
win32:LIBS        += ../3rdparty/gsl/lib/libgsl.a
win32:LIBS        += ../3rdparty/gsl/lib/libgslcblas.a
win32:LIBS        += ../3rdparty/zlib123/lib/zdll.lib

#############################################################################
###################### END OF USER-SERVICEABLE PART #########################
#############################################################################

#############################################################################
###################### BASIC PROJECT PROPERTIES #############################
#############################################################################

QMAKE_PROJECT_DEPTH = 0

TARGET         = qtiplot
TEMPLATE       = app
CONFIG        += qt warn_on exceptions opengl thread
CONFIG        += assistant

DEFINES       += QT_PLUGIN
win32:DEFINES += QT_DLL QT_THREAD_SUPPORT
QT            += opengl qt3support network svg

MOC_DIR        = ../tmp/qtiplot
OBJECTS_DIR    = ../tmp/qtiplot
SIP_DIR        = ../tmp/qtiplot
DESTDIR        = ./

#############################################################################
###################### PROJECT FILES SECTION ################################
#############################################################################

###################### ICONS ################################################

win32:RC_FILE = icons/qtiplot.rc
mac:RC_FILE   = icons/qtiplot.icns

###################### TRANSLATIONS #########################################

TRANSLATIONS    = translations/qtiplot_de.ts \
                  translations/qtiplot_es.ts \
                  translations/qtiplot_fr.ts \
                  translations/qtiplot_ru.ts \
                  translations/qtiplot_ja.ts \
                  translations/qtiplot_sv.ts

#system(lupdate -verbose qtiplot.pro)
#system(lrelease -verbose qtiplot.pro)

###################### DOCUMENTATION ########################################

documentation.files += ../manual/html \
                       ../README.html \
                       ../gpl_licence.txt \

###################### HEADERS ##############################################

HEADERS  += src/ApplicationWindow.h \
            src/globals.h\
            src/Graph.h \
            src/Graph3D.h \
            src/Table.h \
            src/CurvesDialog.h \
            src/SetColValuesDialog.h \
            src/PlotDialog.h \
            src/Plot3DDialog.h \
            src/PlotWizard.h \
            src/ExportDialog.h \
            src/AxesDialog.h \
            src/PolynomFitDialog.h \
            src/ExpDecayDialog.h \
            src/FunctionDialog.h \
            src/FitDialog.h \
            src/SurfaceDialog.h \
            src/TableDialog.h \
            src/TextDialog.h \
            src/LineDialog.h \
            src/ScalePicker.h \
            src/TitlePicker.h \
            src/CanvasPicker.h \
            src/PlotCurve.h \
            src/QwtErrorPlotCurve.h \
            src/QwtPieCurve.h \
            src/ErrDialog.h \
            src/Legend.h \
            src/ArrowMarker.h \
            src/ImageMarker.h \
            src/ImageDialog.h \
            src/fit_gsl.h \
            src/nrutil.h\
            src/pixmaps.h\
            src/MultiLayer.h\
            src/LayerDialog.h \
            src/IntDialog.h \
            src/SortDialog.h\
            src/Bar.h \
            src/Cone3D.h \
            src/ConfigDialog.h \
            src/QwtBarCurve.h \
            src/BoxCurve.h \
            src/QwtHistogram.h \
            src/VectorCurve.h \
            src/ScaleDraw.h \
            src/Matrix.h \
            src/MatrixDialog.h \
            src/MatrixSizeDialog.h \
            src/MatrixValuesDialog.h \
            src/DataSetDialog.h \
            src/MyParser.h \
            src/ColorBox.h \
            src/SymbolBox.h \
            src/PatternBox.h \
            src/importOPJ.h\
            src/SymbolDialog.h \
            src/Plot.h \
            src/ColorButton.h \
            src/AssociationsDialog.h \
            src/RenameWindowDialog.h \
            src/MyWidget.h \
            src/InterpolationDialog.h\
            src/ImportASCIIDialog.h \
            src/ImageExportDialog.h\
            src/SmoothCurveDialog.h\
            src/FilterDialog.h\
            src/FFTDialog.h\
            src/Note.h\
            src/Folder.h\
            src/FindDialog.h\
            src/ScriptingEnv.h\
            src/Script.h\
            src/ScriptEdit.h\
            src/FunctionCurve.h\
            src/Fit.h\
            src/MultiPeakFit.h\
            src/ExponentialFit.h\
            src/PolynomialFit.h\
            src/NonLinearFit.h\
            src/PluginFit.h\
            src/SigmoidalFit.h\
			src/LogisticFit.h\
            src/customevents.h\
            src/ScriptingLangDialog.h\
            src/ScriptWindow.h\
            src/TextFormatButtons.h\
            src/TableStatistics.h\
            src/Spectrogram.h\
            src/ColorMapEditor.h\
            src/SelectionMoveResizer.h\
            src/Filter.h\
            src/Differentiation.h\
            src/Integration.h\
            src/Interpolation.h\
            src/SmoothFilter.h\
            src/FFTFilter.h\
            src/FFT.h\
            src/Convolution.h\
            src/Correlation.h\
            src/PlotToolInterface.h\
            src/ScreenPickerTool.h\
            src/DataPickerTool.h\
            src/RangeSelectorTool.h\
            src/TranslateCurveTool.h\
            src/MultiPeakFitTool.h\
            src/CurveRangeDialog.h\
            src/LineProfileTool.h\
            src/PlotEnrichement.h\
            src/ExtensibleFileDialog.h\
            src/OpenProjectDialog.h\
            src/Grid.h

###################### SOURCES ##############################################

SOURCES  += src/ApplicationWindow.cpp \
            src/Graph.cpp \
            src/Graph3D.cpp \
            src/Table.cpp \
            src/SetColValuesDialog.cpp \
            src/CurvesDialog.cpp \
            src/PlotDialog.cpp \
            src/Plot3DDialog.cpp \
            src/PlotWizard.cpp \
            src/ExportDialog.cpp \
            src/AxesDialog.cpp \
            src/PolynomFitDialog.cpp \
            src/TableDialog.cpp \
            src/TextDialog.cpp \
            src/ScalePicker.cpp\
            src/TitlePicker.cpp \
            src/CanvasPicker.cpp \
            src/ExpDecayDialog.cpp \
            src/FunctionDialog.cpp \
            src/FitDialog.cpp \
            src/SurfaceDialog.cpp \
            src/LineDialog.cpp \
            src/PlotCurve.cpp \
            src/QwtErrorPlotCurve.cpp \
            src/QwtPieCurve.cpp \
            src/ErrDialog.cpp \
            src/Legend.cpp \
            src/ArrowMarker.cpp \
            src/ImageMarker.cpp \
            src/ImageDialog.cpp \
            src/MultiLayer.cpp\
            src/LayerDialog.cpp \
            src/IntDialog.cpp \
            src/SortDialog.cpp\
            src/Bar.cpp \
            src/Cone3D.cpp \
            src/DataSetDialog.cpp \
            src/ConfigDialog.cpp \
            src/QwtBarCurve.cpp \
            src/BoxCurve.cpp \
            src/QwtHistogram.cpp \
            src/VectorCurve.cpp \
            src/Matrix.cpp \
            src/MatrixDialog.cpp \
            src/MatrixSizeDialog.cpp \
            src/MatrixValuesDialog.cpp \
            src/MyParser.cpp\
            src/ColorBox.cpp \
            src/SymbolBox.cpp \
            src/PatternBox.cpp \
            src/importOPJ.cpp\
            src/main.cpp \
            src/SymbolDialog.cpp \
            src/Plot.cpp \
            src/ColorButton.cpp \
            src/AssociationsDialog.cpp \
            src/RenameWindowDialog.cpp \
            src/MyWidget.cpp\
            src/InterpolationDialog.cpp\
            src/nrutil.cpp\
            src/fit_gsl.cpp\
            src/SmoothCurveDialog.cpp\
            src/FilterDialog.cpp\
            src/FFTDialog.cpp\
            src/Note.cpp\
            src/Folder.cpp\
            src/FindDialog.cpp\
            src/TextFormatButtons.cpp\
            src/ScriptEdit.cpp\
            src/ImportASCIIDialog.cpp\
            src/ImageExportDialog.cpp\
            src/ScaleDraw.cpp\
            src/FunctionCurve.cpp\
            src/Fit.cpp\
            src/MultiPeakFit.cpp\
            src/ExponentialFit.cpp\
            src/PolynomialFit.cpp\
            src/PluginFit.cpp\
            src/NonLinearFit.cpp\
            src/SigmoidalFit.cpp\
			src/LogisticFit.cpp\
            src/ScriptingEnv.cpp\
            src/Script.cpp\
            src/ScriptingLangDialog.cpp\
            src/ScriptWindow.cpp\
            src/TableStatistics.cpp\
            src/Spectrogram.cpp\
            src/ColorMapEditor.cpp\
            src/SelectionMoveResizer.cpp\
            src/Filter.cpp\
            src/Differentiation.cpp\
            src/Integration.cpp\
            src/Interpolation.cpp\
            src/SmoothFilter.cpp\
            src/FFTFilter.cpp\
            src/FFT.cpp\
            src/Convolution.cpp\
            src/Correlation.cpp\
            src/ScreenPickerTool.cpp\
            src/DataPickerTool.cpp\
            src/RangeSelectorTool.cpp\
            src/TranslateCurveTool.cpp\
            src/MultiPeakFitTool.cpp\
            src/CurveRangeDialog.cpp\
            src/LineProfileTool.cpp\
            src/PlotEnrichement.cpp\
            src/ExtensibleFileDialog.cpp\
            src/OpenProjectDialog.cpp\
            src/Grid.cpp

###############################################################
##################### Compression (zlib123) ###################
###############################################################

SOURCES += ../3rdparty/zlib123/minigzip.c

###############################################################
################# Origin Import (liborigin) ###################
###############################################################

HEADERS += ../3rdparty/liborigin/OPJFile.h
SOURCES += ../3rdparty/liborigin/OPJFile.cpp

###############################################################
##################### SCRIPTING LANGUAGES SECTION #############
###############################################################

##################### Default: muParser v1.28 #################

contains(SCRIPTING_LANGS, muParser) {
  DEFINES += SCRIPTING_MUPARSER

  HEADERS += src/muParserScript.h \
             src/muParserScripting.h \

  SOURCES += src/muParserScript.cpp \
             src/muParserScripting.cpp \
}

##################### PYTHON + SIP + PyQT #####################

contains(SCRIPTING_LANGS, Python) {
  DEFINES += SCRIPTING_PYTHON
  HEADERS += src/PythonScript.h src/PythonScripting.h
  SOURCES += src/PythonScript.cpp src/PythonScripting.cpp

  unix {
    INCLUDEPATH += $$system(python python-includepath.py)
    LIBS        += $$system(python -c "\"from distutils import sysconfig; print '-lpython'+sysconfig.get_config_var('VERSION')\"")
    LIBS        += -lm
    system(mkdir -p $${SIP_DIR})
    system($$system(python python-sipcmd.py) -c $${SIP_DIR} src/qti.sip)
  }

  win32 {
    INCLUDEPATH += $$system(call python-includepath.py)
    LIBS        += $$system(call python-libs-win.py)
    system($$system(call python-sipcmd.py) -c $${SIP_DIR} src/qti.sip)
  }

##################### SIP generated files #####################

  HEADERS += $${SIP_DIR}/sipqtiApplicationWindow.h\
             $${SIP_DIR}/sipqtiGraph.h\
             $${SIP_DIR}/sipqtiGraph3D.h\
             $${SIP_DIR}/sipqtiArrowMarker.h\
			 $${SIP_DIR}/sipqtiImageMarker.h\
			 $${SIP_DIR}/sipqtiLegend.h\
			 $${SIP_DIR}/sipqtiGrid.h\
             $${SIP_DIR}/sipqtiMultiLayer.h\
             $${SIP_DIR}/sipqtiTable.h\
             $${SIP_DIR}/sipqtiMatrix.h\
             $${SIP_DIR}/sipqtiMyWidget.h\
             $${SIP_DIR}/sipqtiScriptEdit.h\
             $${SIP_DIR}/sipqtiNote.h\
             $${SIP_DIR}/sipqtiPythonScript.h\
             $${SIP_DIR}/sipqtiPythonScripting.h\
             $${SIP_DIR}/sipqtiFolder.h\
             $${SIP_DIR}/sipqtiQList.h\
             $${SIP_DIR}/sipqtiFit.h \
             $${SIP_DIR}/sipqtiExponentialFit.h \
             $${SIP_DIR}/sipqtiTwoExpFit.h \
             $${SIP_DIR}/sipqtiThreeExpFit.h \
             $${SIP_DIR}/sipqtiSigmoidalFit.h \
			 $${SIP_DIR}/sipqtiLogisticFit.h \
             $${SIP_DIR}/sipqtiGaussAmpFit.h \
             $${SIP_DIR}/sipqtiLorentzFit.h \
             $${SIP_DIR}/sipqtiNonLinearFit.h \
             $${SIP_DIR}/sipqtiPluginFit.h \
             $${SIP_DIR}/sipqtiMultiPeakFit.h \
             $${SIP_DIR}/sipqtiPolynomialFit.h \
             $${SIP_DIR}/sipqtiLinearFit.h \
             $${SIP_DIR}/sipqtiGaussFit.h \
             $${SIP_DIR}/sipqtiFilter.h \
             $${SIP_DIR}/sipqtiDifferentiation.h \
             $${SIP_DIR}/sipqtiIntegration.h \
			 $${SIP_DIR}/sipqtiInterpolation.h \
			 $${SIP_DIR}/sipqtiSmoothFilter.h \
			 $${SIP_DIR}/sipqtiFFTFilter.h \
			 $${SIP_DIR}/sipqtiFFT.h \
			 $${SIP_DIR}/sipqtiCorrelation.h \
			 $${SIP_DIR}/sipqtiConvolution.h \
			 $${SIP_DIR}/sipqtiDeconvolution.h \

  SOURCES += $${SIP_DIR}/sipqticmodule.cpp\
             $${SIP_DIR}/sipqtiApplicationWindow.cpp\
             $${SIP_DIR}/sipqtiGraph.cpp\
             $${SIP_DIR}/sipqtiGraph3D.cpp\
             $${SIP_DIR}/sipqtiArrowMarker.cpp\
			 $${SIP_DIR}/sipqtiImageMarker.cpp\
			 $${SIP_DIR}/sipqtiLegend.cpp\
			 $${SIP_DIR}/sipqtiGrid.cpp\
             $${SIP_DIR}/sipqtiMultiLayer.cpp\
             $${SIP_DIR}/sipqtiTable.cpp\
             $${SIP_DIR}/sipqtiMatrix.cpp\
             $${SIP_DIR}/sipqtiMyWidget.cpp\
             $${SIP_DIR}/sipqtiScriptEdit.cpp\
             $${SIP_DIR}/sipqtiNote.cpp\
             $${SIP_DIR}/sipqtiPythonScript.cpp\
             $${SIP_DIR}/sipqtiPythonScripting.cpp\
             $${SIP_DIR}/sipqtiFolder.cpp\
             $${SIP_DIR}/sipqtiQList.cpp\
             $${SIP_DIR}/sipqtiFit.cpp \
             $${SIP_DIR}/sipqtiExponentialFit.cpp \
             $${SIP_DIR}/sipqtiTwoExpFit.cpp \
             $${SIP_DIR}/sipqtiThreeExpFit.cpp \
             $${SIP_DIR}/sipqtiSigmoidalFit.cpp \
			 $${SIP_DIR}/sipqtiLogisticFit.cpp \
             $${SIP_DIR}/sipqtiGaussAmpFit.cpp \
             $${SIP_DIR}/sipqtiLorentzFit.cpp \
             $${SIP_DIR}/sipqtiNonLinearFit.cpp \
             $${SIP_DIR}/sipqtiPluginFit.cpp \
             $${SIP_DIR}/sipqtiMultiPeakFit.cpp \
             $${SIP_DIR}/sipqtiPolynomialFit.cpp \
             $${SIP_DIR}/sipqtiLinearFit.cpp \
             $${SIP_DIR}/sipqtiGaussFit.cpp \
             $${SIP_DIR}/sipqtiFilter.cpp \
             $${SIP_DIR}/sipqtiDifferentiation.cpp \
             $${SIP_DIR}/sipqtiIntegration.cpp \
			 $${SIP_DIR}/sipqtiInterpolation.cpp \
			 $${SIP_DIR}/sipqtiSmoothFilter.cpp \
			 $${SIP_DIR}/sipqtiFFTFilter.cpp \
			 $${SIP_DIR}/sipqtiFFT.cpp \
			 $${SIP_DIR}/sipqtiCorrelation.cpp \
			 $${SIP_DIR}/sipqtiConvolution.cpp \
			 $${SIP_DIR}/sipqtiDeconvolution.cpp \
}
###############################################################
