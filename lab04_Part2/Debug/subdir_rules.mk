################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
main.obj: ../main.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv7/tools/compiler/c6000_7.4.24/bin/cl6x" -mv6700 --abi=coffabi -g --preinclude="E:/5th semester lab/Digital_Signal_Processing/DIGITAL-SIGNAL-PROCESSING-EC5011_Labortory_Sessions/lab04_Part2/lib/dsk6713bsl.lib" --preinclude="C:/ti/c6000/dsk6713/include/dsk6713.h" --include_path="E:/5th semester lab/Digital_Signal_Processing/DIGITAL-SIGNAL-PROCESSING-EC5011_Labortory_Sessions/lab04_Part2" --include_path="C:/ti/c6000/dsk6713/include" --include_path="E:/5th semester lab/Digital_Signal_Processing/DIGITAL-SIGNAL-PROCESSING-EC5011_Labortory_Sessions/lab04_Part2/lib" --include_path="C:/ti/ccsv7/tools/compiler/c6000_7.4.24/include" --define=c6713 --diag_wrap=off --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="main.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


