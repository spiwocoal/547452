#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/sepic18-usb.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/sepic18-usb.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=/media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/bsp/leds.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb/usb_device.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb/usb_device_cdc.c src/main.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/app_led_usb_status.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/app_sepic_cdc.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/system.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb_events.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb_descriptors.c src/pwm.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/531260859/leds.p1 ${OBJECTDIR}/_ext/531279104/usb_device.p1 ${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1 ${OBJECTDIR}/src/main.p1 ${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1 ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1 ${OBJECTDIR}/_ext/594036619/system.p1 ${OBJECTDIR}/_ext/594036619/usb_events.p1 ${OBJECTDIR}/_ext/594036619/usb_descriptors.p1 ${OBJECTDIR}/src/pwm.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/531260859/leds.p1.d ${OBJECTDIR}/_ext/531279104/usb_device.p1.d ${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1.d ${OBJECTDIR}/src/main.p1.d ${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1.d ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1.d ${OBJECTDIR}/_ext/594036619/system.p1.d ${OBJECTDIR}/_ext/594036619/usb_events.p1.d ${OBJECTDIR}/_ext/594036619/usb_descriptors.p1.d ${OBJECTDIR}/src/pwm.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/531260859/leds.p1 ${OBJECTDIR}/_ext/531279104/usb_device.p1 ${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1 ${OBJECTDIR}/src/main.p1 ${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1 ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1 ${OBJECTDIR}/_ext/594036619/system.p1 ${OBJECTDIR}/_ext/594036619/usb_events.p1 ${OBJECTDIR}/_ext/594036619/usb_descriptors.p1 ${OBJECTDIR}/src/pwm.p1

# Source Files
SOURCEFILES=/media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/bsp/leds.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb/usb_device.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb/usb_device_cdc.c src/main.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/app_led_usb_status.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/app_sepic_cdc.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/system.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb_events.c /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb_descriptors.c src/pwm.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/sepic18-usb.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F4550
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/531260859/leds.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/bsp/leds.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/531260859" 
	@${RM} ${OBJECTDIR}/_ext/531260859/leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/531260859/leds.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/531260859/leds.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/bsp/leds.c 
	@-${MV} ${OBJECTDIR}/_ext/531260859/leds.d ${OBJECTDIR}/_ext/531260859/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/531260859/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/531279104/usb_device.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb/usb_device.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/531279104" 
	@${RM} ${OBJECTDIR}/_ext/531279104/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/531279104/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/531279104/usb_device.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/531279104/usb_device.d ${OBJECTDIR}/_ext/531279104/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/531279104/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/531279104" 
	@${RM} ${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/531279104/usb_device_cdc.d ${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/main.p1: src/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.p1.d 
	@${RM} ${OBJECTDIR}/src/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/main.p1 src/main.c 
	@-${MV} ${OBJECTDIR}/src/main.d ${OBJECTDIR}/src/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/594036619" 
	@${RM} ${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/594036619/app_led_usb_status.d ${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/app_sepic_cdc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/594036619" 
	@${RM} ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/app_sepic_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.d ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/594036619/system.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/system.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/594036619" 
	@${RM} ${OBJECTDIR}/_ext/594036619/system.p1.d 
	@${RM} ${OBJECTDIR}/_ext/594036619/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/594036619/system.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/system.c 
	@-${MV} ${OBJECTDIR}/_ext/594036619/system.d ${OBJECTDIR}/_ext/594036619/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/594036619/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/594036619/usb_events.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/594036619" 
	@${RM} ${OBJECTDIR}/_ext/594036619/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/594036619/usb_events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/594036619/usb_events.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/594036619/usb_events.d ${OBJECTDIR}/_ext/594036619/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/594036619/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/594036619/usb_descriptors.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/594036619" 
	@${RM} ${OBJECTDIR}/_ext/594036619/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/594036619/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/594036619/usb_descriptors.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/594036619/usb_descriptors.d ${OBJECTDIR}/_ext/594036619/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/594036619/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/pwm.p1: src/pwm.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/pwm.p1.d 
	@${RM} ${OBJECTDIR}/src/pwm.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit3   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/pwm.p1 src/pwm.c 
	@-${MV} ${OBJECTDIR}/src/pwm.d ${OBJECTDIR}/src/pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/531260859/leds.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/bsp/leds.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/531260859" 
	@${RM} ${OBJECTDIR}/_ext/531260859/leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/531260859/leds.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/531260859/leds.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/bsp/leds.c 
	@-${MV} ${OBJECTDIR}/_ext/531260859/leds.d ${OBJECTDIR}/_ext/531260859/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/531260859/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/531279104/usb_device.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb/usb_device.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/531279104" 
	@${RM} ${OBJECTDIR}/_ext/531279104/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/531279104/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/531279104/usb_device.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/531279104/usb_device.d ${OBJECTDIR}/_ext/531279104/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/531279104/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/531279104" 
	@${RM} ${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/531279104/usb_device_cdc.d ${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/531279104/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/main.p1: src/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.p1.d 
	@${RM} ${OBJECTDIR}/src/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/main.p1 src/main.c 
	@-${MV} ${OBJECTDIR}/src/main.d ${OBJECTDIR}/src/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/594036619" 
	@${RM} ${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/594036619/app_led_usb_status.d ${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/594036619/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/app_sepic_cdc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/594036619" 
	@${RM} ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/app_sepic_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.d ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/594036619/app_sepic_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/594036619/system.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/system.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/594036619" 
	@${RM} ${OBJECTDIR}/_ext/594036619/system.p1.d 
	@${RM} ${OBJECTDIR}/_ext/594036619/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/594036619/system.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/system.c 
	@-${MV} ${OBJECTDIR}/_ext/594036619/system.d ${OBJECTDIR}/_ext/594036619/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/594036619/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/594036619/usb_events.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/594036619" 
	@${RM} ${OBJECTDIR}/_ext/594036619/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/594036619/usb_events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/594036619/usb_events.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/594036619/usb_events.d ${OBJECTDIR}/_ext/594036619/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/594036619/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/594036619/usb_descriptors.p1: /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/594036619" 
	@${RM} ${OBJECTDIR}/_ext/594036619/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/594036619/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/594036619/usb_descriptors.p1 /media/UdeC/2025/S2/Taller-Sistemas-Electronicos/pic-src/sepic18-usb.X/src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/594036619/usb_descriptors.d ${OBJECTDIR}/_ext/594036619/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/594036619/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/pwm.p1: src/pwm.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/pwm.p1.d 
	@${RM} ${OBJECTDIR}/src/pwm.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/pwm.p1 src/pwm.c 
	@-${MV} ${OBJECTDIR}/src/pwm.d ${OBJECTDIR}/src/pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/sepic18-usb.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/sepic18-usb.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -mdebugger=pickit3  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -mrom=default,-7dc0-7fff -mram=default,-3f4-3ff,-f9c-f9c,-fd4-fd4,-fdb-fdf,-fe3-fe7,-feb-fef,-ffd-fff  $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/sepic18-usb.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} ${DISTDIR}/sepic18-usb.X.${IMAGE_TYPE}.hex 
	
	
else
${DISTDIR}/sepic18-usb.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/sepic18-usb.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"./include" -I"./include/usb" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/sepic18-usb.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
