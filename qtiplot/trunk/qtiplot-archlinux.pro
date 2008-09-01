# building without muParser doesn't work yet
SCRIPTING_LANGS += muParser
SCRIPTING_LANGS += Python

# a console displaying output of scripts; particularly useful on Windows
# where running QtiPlot from a terminal is inconvenient
DEFINES         += SCRIPTING_CONSOLE
# a dialog for selecting the scripting language on a per-project basis
DEFINES         += SCRIPTING_DIALOG
#DEFINES         += QTIPLOT_DEMO
# comment the following lines to disable donations start-up message
#DEFINES         += QTIPLOT_SUPPORT
# comment the following lines if you haven't subscribed for a QtiPlot binaries maintenance contract
#RESTRICTED_MODULES += EMF

######################################################################################
# Uncomment the following line if you want to perform a custom installation using
# the *.path variables defined bellow.
######################################################################################
#CONFIG          += CustomInstall

CONFIG          += release
#CONFIG          += debug
#win32: CONFIG   += console

##################### 3rd PARTY HEADER FILES SECTION ########################
#!!! Warning: You must modify these paths according to your computer settings
#############################################################################

INCLUDEPATH       += /usr/include/qwt
INCLUDEPATH       += /usr/include/qwtplot3d
INCLUDEPATH       += ../3rdparty/liborigin
INCLUDEPATH       += /usr/inlcude
INCLUDEPATH       += /usr/include
INCLUDEPATH       += /usr/include

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
###################### BASIC PROJECT PROPERTIES #############################
#############################################################################

QMAKE_PROJECT_DEPTH = 0

TARGET         = qtiplot
TEMPLATE       = app
CONFIG        += qt warn_on exceptions opengl thread
CONFIG        += assistant

DEFINES       += QT_PLUGIN
contains(CONFIG, CustomInstall){
	INSTALLS        += target
	INSTALLS        += translations
	INSTALLS        += manual
	INSTALLS        += documentation
	unix:INSTALLS        += man

	unix: INSTALLBASE = /usr
	win32: INSTALLBASE = C:/QtiPlot

	unix: target.path = $$INSTALLBASE/bin
	unix: translations.path = $$INSTALLBASE/share/qtiplot/translations
	unix: manual.path = $$INSTALLBASE/share/doc/qtiplot/manual
	unix: documentation.path = $$INSTALLBASE/share/doc/qtiplot
	unix: man.path = $$INSTALLBASE/share/man/man1/

	win32: target.path = $$INSTALLBASE
	win32: translations.path = $$INSTALLBASE/translations
	win32: manual.path = $$INSTALLBASE/manual
	win32: documentation.path = $$INSTALLBASE/doc

	DEFINES       += TRANSLATIONS_PATH="\\\"$$replace(translations.path," ","\ ")\\\"
	DEFINES       += MANUAL_PATH="\\\"$$replace(manual.path," ","\ ")\\\"
	}

win32:DEFINES += QT_DLL QT_THREAD_SUPPORT
QT            += opengl qt3support network svg xml

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

system(lupdate -verbose qtiplot.pro)
system(lrelease -verbose qtiplot.pro)

translations.files += translations/qtiplot_de.qm \
                  translations/qtiplot_es.qm \
                  translations/qtiplot_fr.qm \
                  translations/qtiplot_ru.qm \
                  translations/qtiplot_ja.qm \
                  translations/qtiplot_sv.qm

###################### DOCUMENTATION ########################################

manual.files += ../manual/html \
				../manual/qtiplot-manual-en.pdf

documentation.files += ../README.html \
                       ../gpl_licence.txt

unix: man.files += ../qtiplot.1

###################### HEADERS ##############################################

HEADERS  += src/ApplicationWindow.h \
            src/globals.h\
            src/Table.h \
            src/SetColValuesDialog.h \
            src/ExportDialog.h \
            src/TableDialog.h \
            src/pixmaps.h\
            src/SortDialog.h\
            src/ConfigDialog.h \
            src/DataSetDialog.h \
            src/MyParser.h \
            src/ColorBox.h \
            src/SymbolBox.h \
            src/PatternBox.h \
            src/importOPJ.h\
            src/SymbolDialog.h \
            src/ColorButton.h \
            src/RenameWindowDialog.h \
			src/MdiSubWindow.h \
            src/ImportASCIIDialog.h \
            src/Note.h\
            src/Folder.h\
            src/FindDialog.h\
            src/ScriptingEnv.h\
            src/Script.h\
            src/ScriptEdit.h\
            src/customevents.h\
            src/ScriptingLangDialog.h\
            src/ScriptWindow.h\
            src/TextFormatButtons.h\
            src/TableStatistics.h\
            src/ColorMapEditor.h\
			src/ColorMapDialog.h\
            src/ExtensibleFileDialog.h\
            src/OpenProjectDialog.h\
            src/CustomActionDialog.h \
            src/DoubleSpinBox.h \
			src/PlotWizard.h \
			src/LineNumberDisplay.h \
			src/PenStyleBox.h \

###################### SOURCES ##############################################

SOURCES  += src/main.cpp \
			src/ApplicationWindow.cpp \
            src/Table.cpp \
            src/SetColValuesDialog.cpp \
            src/ExportDialog.cpp \
            src/TableDialog.cpp \
            src/SortDialog.cpp\
            src/ConfigDialog.cpp \
            src/DataSetDialog.cpp \
            src/MyParser.cpp \
            src/ColorBox.cpp \
            src/SymbolBox.cpp \
            src/PatternBox.cpp \
            src/importOPJ.cpp\
            src/SymbolDialog.cpp \
            src/ColorButton.cpp \
            src/RenameWindowDialog.cpp \
			src/MdiSubWindow.cpp \
            src/ImportASCIIDialog.cpp \
            src/Note.cpp\
            src/Folder.cpp\
            src/FindDialog.cpp\
            src/ScriptingEnv.cpp\
            src/Script.cpp\
            src/ScriptEdit.cpp\
            src/ScriptingLangDialog.cpp\
            src/ScriptWindow.cpp\
            src/TextFormatButtons.cpp\
            src/TableStatistics.cpp\
            src/ColorMapEditor.cpp\
			src/ColorMapDialog.cpp\
            src/ExtensibleFileDialog.cpp\
            src/OpenProjectDialog.cpp\
            src/CustomActionDialog.cpp \
            src/DoubleSpinBox.cpp \
			src/PlotWizard.cpp \
			src/LineNumberDisplay.cpp \
			src/PenStyleBox.cpp \

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
################# Module: Matrix ##############################
###############################################################

	HEADERS += src/matrix/Matrix.h \
			   src/matrix/MatrixCommand.h \
               src/matrix/MatrixDialog.h \
			   src/matrix/MatrixModel.h \
               src/matrix/MatrixSizeDialog.h \
               src/matrix/MatrixValuesDialog.h \

	SOURCES += src/matrix/Matrix.cpp \
			   src/matrix/MatrixCommand.cpp \
               src/matrix/MatrixDialog.cpp \
			   src/matrix/MatrixModel.cpp \
               src/matrix/MatrixSizeDialog.cpp \
               src/matrix/MatrixValuesDialog.cpp \

###############################################################
################# Module: Plot 2D #############################
###############################################################

    HEADERS += src/plot2D/AddWidgetTool.h \
			   src/plot2D/ArrowMarker.h \
			   src/plot2D/BoxCurve.h \
			   src/plot2D/CanvasPicker.h \
			   src/plot2D/DataPickerTool.h \
			   src/plot2D/FrameWidget.h \
			   src/plot2D/FunctionCurve.h \
			   src/plot2D/Graph.h \
			   src/plot2D/Grid.h \
			   src/plot2D/ImageWidget.h \
			   src/plot2D/LegendWidget.h \
			   src/plot2D/LineProfileTool.h \
			   src/plot2D/MultiLayer.h \
			   src/plot2D/MultiPeakFitTool.h \
			   src/plot2D/PlotCurve.h \
			   src/plot2D/PlotToolInterface.h \
			   src/plot2D/QwtBarCurve.h \
               src/plot2D/QwtErrorPlotCurve.h \
			   src/plot2D/QwtHistogram.h \
               src/plot2D/QwtPieCurve.h \
			   src/plot2D/RangeSelectorTool.h \
			   src/plot2D/RectangleWidget.h \
			   src/plot2D/ScaleDraw.h \
			   src/plot2D/ScaleEngine.h \
			   src/plot2D/ScalePicker.h \
			   src/plot2D/ScreenPickerTool.h \
			   src/plot2D/SelectionMoveResizer.h \
			   src/plot2D/Spectrogram.h \
			   src/plot2D/TexWidget.h \
			   src/plot2D/TitlePicker.h \
			   src/plot2D/TranslateCurveTool.h \
			   src/plot2D/VectorCurve.h \

    SOURCES += src/plot2D/AddWidgetTool.cpp \
			   src/plot2D/ArrowMarker.cpp \
			   src/plot2D/BoxCurve.cpp \
			   src/plot2D/CanvasPicker.cpp \
			   src/plot2D/DataPickerTool.cpp \
			   src/plot2D/FrameWidget.cpp \
			   src/plot2D/FunctionCurve.cpp \
			   src/plot2D/Graph.cpp \
			   src/plot2D/Grid.cpp \
			   src/plot2D/ImageWidget.cpp \
			   src/plot2D/LegendWidget.cpp \
			   src/plot2D/LineProfileTool.cpp \
			   src/plot2D/MultiLayer.cpp \
			   src/plot2D/MultiPeakFitTool.cpp \
			   src/plot2D/PlotCurve.cpp \
			   src/plot2D/QwtBarCurve.cpp \
               src/plot2D/QwtErrorPlotCurve.cpp \
			   src/plot2D/QwtHistogram.cpp \
               src/plot2D/QwtPieCurve.cpp \
			   src/plot2D/RangeSelectorTool.cpp \
			   src/plot2D/RectangleWidget.cpp \
			   src/plot2D/ScaleDraw.cpp \
			   src/plot2D/ScaleEngine.cpp \
			   src/plot2D/ScalePicker.cpp \
			   src/plot2D/ScreenPickerTool.cpp \
			   src/plot2D/SelectionMoveResizer.cpp \
			   src/plot2D/Spectrogram.cpp \
			   src/plot2D/TexWidget.cpp \
			   src/plot2D/TitlePicker.cpp \
			   src/plot2D/TranslateCurveTool.cpp \
			   src/plot2D/VectorCurve.cpp \

	HEADERS += src/plot2D/dialogs/AssociationsDialog.h \
			   src/plot2D/dialogs/AxesDialog.h \
			   src/plot2D/dialogs/CurvesDialog.h \
			   src/plot2D/dialogs/CurveRangeDialog.h \
			   src/plot2D/dialogs/EnrichmentDialog.h \
			   src/plot2D/dialogs/ErrDialog.h \
			   src/plot2D/dialogs/FunctionDialog.h \
			   src/plot2D/dialogs/ImageExportDialog.h \
			   src/plot2D/dialogs/LayerDialog.h \
			   src/plot2D/dialogs/LineDialog.h \
		       src/plot2D/dialogs/PlotDialog.h \
			   src/plot2D/dialogs/TextDialog.h \
			   src/plot2D/dialogs/TextEditor.h \

	SOURCES += src/plot2D/dialogs/AssociationsDialog.cpp \
			   src/plot2D/dialogs/AxesDialog.cpp \
			   src/plot2D/dialogs/CurvesDialog.cpp \
			   src/plot2D/dialogs/CurveRangeDialog.cpp \
			   src/plot2D/dialogs/EnrichmentDialog.cpp \
			   src/plot2D/dialogs/ErrDialog.cpp \
			   src/plot2D/dialogs/FunctionDialog.cpp \
			   src/plot2D/dialogs/ImageExportDialog.cpp \
			   src/plot2D/dialogs/LayerDialog.cpp \
			   src/plot2D/dialogs/LineDialog.cpp \
		       src/plot2D/dialogs/PlotDialog.cpp \
			   src/plot2D/dialogs/TextDialog.cpp \
			   src/plot2D/dialogs/TextEditor.cpp \

###############################################################
################# Module: Plot 3D #############################
###############################################################

    HEADERS += src/plot3D/Bar.h \
               src/plot3D/Cone3D.h \
			   src/plot3D/Graph3D.h \
			   src/plot3D/Plot3DDialog.h \
			   src/plot3D/SurfaceDialog.h \

	SOURCES += src/plot3D/Bar.cpp \
               src/plot3D/Cone3D.cpp \
			   src/plot3D/Graph3D.cpp \
			   src/plot3D/Plot3DDialog.cpp \
			   src/plot3D/SurfaceDialog.cpp \

###############################################################
################# Module: Analysis ##############################
###############################################################

    HEADERS += src/analysis/Convolution.h \
			   src/analysis/Correlation.h \
			   src/analysis/Differentiation.h \
			   src/analysis/ExponentialFit.h \
			   src/analysis/FFTFilter.h \
			   src/analysis/FFT.h \
			   src/analysis/Filter.h \
			   src/analysis/Fit.h \
			   src/analysis/FitModelHandler.h \
			   src/analysis/Integration.h \
			   src/analysis/Interpolation.h \
			   src/analysis/LogisticFit.h \
			   src/analysis/MultiPeakFit.h \
			   src/analysis/NonLinearFit.h \
			   src/analysis/PluginFit.h \
			   src/analysis/PolynomialFit.h \
			   src/analysis/SigmoidalFit.h \
			   src/analysis/SmoothFilter.h \
			   src/analysis/fft2D.h \
               src/analysis/fit_gsl.h \
			   src/analysis/nrutil.h \

	SOURCES += src/analysis/Convolution.cpp \
			   src/analysis/Correlation.cpp \
			   src/analysis/Differentiation.cpp \
			   src/analysis/ExponentialFit.cpp \
			   src/analysis/FFTFilter.cpp \
			   src/analysis/FFT.cpp \
			   src/analysis/Filter.cpp \
			   src/analysis/Fit.cpp \
			   src/analysis/FitModelHandler.cpp \
			   src/analysis/Integration.cpp \
			   src/analysis/Interpolation.cpp \
			   src/analysis/LogisticFit.cpp \
			   src/analysis/MultiPeakFit.cpp \
			   src/analysis/NonLinearFit.cpp \
			   src/analysis/PluginFit.cpp \
			   src/analysis/PolynomialFit.cpp \
			   src/analysis/SigmoidalFit.cpp \
			   src/analysis/SmoothFilter.cpp \
			   src/analysis/fft2D.cpp \
               src/analysis/fit_gsl.cpp \
			   src/analysis/nrutil.cpp \

    HEADERS += src/analysis/dialogs/ExpDecayDialog.h \
			   src/analysis/dialogs/FFTDialog.h \
			   src/analysis/dialogs/FitDialog.h \
			   src/analysis/dialogs/FilterDialog.h \
			   src/analysis/dialogs/FrequencyCountDialog.h \
			   src/analysis/dialogs/IntDialog.h \
			   src/analysis/dialogs/InterpolationDialog.h \
			   src/analysis/dialogs/PolynomFitDialog.h \
			   src/analysis/dialogs/SmoothCurveDialog.h \

	SOURCES += src/analysis/dialogs/ExpDecayDialog.cpp \
			   src/analysis/dialogs/FFTDialog.cpp \
			   src/analysis/dialogs/FitDialog.cpp \
			   src/analysis/dialogs/FilterDialog.cpp \
			   src/analysis/dialogs/FrequencyCountDialog.cpp \
			   src/analysis/dialogs/IntDialog.cpp \
			   src/analysis/dialogs/InterpolationDialog.cpp \
			   src/analysis/dialogs/PolynomFitDialog.cpp \
			   src/analysis/dialogs/SmoothCurveDialog.cpp \

###############################################################
################# Restricted Module: EmfEngine ################
###############################################################

contains(RESTRICTED_MODULES, EMF) {
	DEFINES += EMF_OUTPUT

    INCLUDEPATH += ../3rdparty/libEMF/include
	unix:LIBS += -L../3rdparty/libEMF/lib
	win32:LIBS += -lgdi32

	INCLUDEPATH += ../3rdparty/EmfEngine
    HEADERS += ../3rdparty/EmfEngine/EmfEngine.h
    SOURCES += ../3rdparty/EmfEngine/EmfEngine.cpp
}

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

  contains(CONFIG, CustomInstall){
  	INSTALLS += pythonconfig
  	pythonconfig.files += qtiplotrc.py \
  						qtiUtil.py \
  						qti_wordlist.txt \

  	unix: pythonconfig.path = /usr/local/qtiplot
  	win32: pythonconfig.path = $$INSTALLBASE
  	DEFINES += PYTHON_CONFIG_PATH="\\\"$$replace(pythonconfig.path," ","\ ")\\\"
  }

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

  SOURCES += $${SIP_DIR}/sipqticmodule.cpp\
             $${SIP_DIR}/sipqtiApplicationWindow.cpp\
			 $${SIP_DIR}/sipqtiQwtPlot.cpp\
             $${SIP_DIR}/sipqtiGraph.cpp\
             $${SIP_DIR}/sipqtiGraph3D.cpp\
             $${SIP_DIR}/sipqtiArrowMarker.cpp\
             $${SIP_DIR}/sipqtiFrameWidget.cpp\
			 $${SIP_DIR}/sipqtiImageWidget.cpp\
			 $${SIP_DIR}/sipqtiLegendWidget.cpp\
			 $${SIP_DIR}/sipqtiGrid.cpp\
             $${SIP_DIR}/sipqtiMultiLayer.cpp\
             $${SIP_DIR}/sipqtiTable.cpp\
             $${SIP_DIR}/sipqtiMatrix.cpp\
             $${SIP_DIR}/sipqtiMdiSubWindow.cpp\
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
