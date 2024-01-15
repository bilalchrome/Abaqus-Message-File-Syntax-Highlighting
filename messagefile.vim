" Abaqus Message File Syntax Highlighting
" For more information and updates, visit: https://github.com/bilalchrome/Abaqus-Message-File-Syntax-Highlighting
" Author: Bilal Abdul Halim

if exists("b:current_syntax")
  finish
endif

syn match abaqusContactPair /\((\w\+,\w\+)\)/
syn match abaqusIterationSummary /^ ITERATION SUMMARY FOR THE INCREMENT:/
syn match abaqusSevereDiscontinuityIterations01 /^\s*\d\+\sARE SEVERE DISCONTINUITY ITERATIONS/
syn match abaqusEquilibriumIterations01 /\d\+\sARE EQUILIBRIUM ITERATIONS\.$/
syn match abaqusTimeIncCompleted /TIME INCREMENT COMPLETED\s\+\ze\s\+,/
syn match abaqusSevereDiscontinuities01 /^\s*\d\+\sSEVERE DISCONTINUITIES OCCURRED DURING INCREMENT ATTEMPT INITIALIZATION\.$/
syn match abaqusSevereDiscontinuities /^\s*\d\+\sSEVERE DISCONTINUITIES OCCURRED DURING THIS ITERATION\.$/
syn match abaqusOpenToClosed /^\s*\d\+\sPOINTS CHANGED FROM OPEN TO CLOSED$/
syn match abaqusClosedToOpen /^\s*\d\+\sPOINTS CHANGED FROM CLOSED TO OPEN$/
syn match abaqusSlippingToSticking /^\s*\d\+\sPOINTS CHANGED FROM SLIPPING TO STICKING$/
syn match abaqusStickingToSlipping /^\s*\d\+\sPOINTS CHANGED FROM STICKING TO SLIPPING$/
syn match abaqusMomResZ /ALL MOMENT\s\+RESIDUALS ARE ZERO/
syn match abaqusEstiCo /THE ESTIMATED CONTACT FORCE ERROR IS OUTSIDE.*$/
syn match abaqusCompaError /COMPATIBILITY ERRORS:/
syn match abaqusAtNode /AT NODE.\{-}\zeDOF/
syn match abaqusAtNode /AT NODE.\{-}\zeOF CONTACT/
syn match abaqusDof /DOF\s\+\d\+/
syn match abaqusMaxPenError /MAX\. PENETRATION ERROR\s\+\S\+\ze\s\+AT NODE/
syn match abaqusMaxConError /MAX\. CONTACT FORCE ERROR\s\+\S\+\ze\s\+AT NODE/
syn match abaqusAverageForce /AVERAGE FORCE.\{-}\zeTIME AVG\. FORCE/
syn match abaqusTimeAverageForce /TIME AVG\. FORCE.*$/
syn match abaqusAverageMoment /AVERAGE MOMENT.\{-}\zeTIME AVG\. MOMENT/
syn match abaqusTimeAverageMoment /TIME AVG\. MOMENT.*$/
syn match abaqusLargestIncD /LARGEST INCREMENT OF DISP\.\s\+\S\+\ze\s\+AT NODE/
syn match abaqusLargestCorrD /LARGEST CORRECTION TO DISP\.\s\+\S\+\ze\s\+AT NODE/
syn match abaqusLargestScaledResidualForce /LARGEST SCALED RESIDUAL FORCE\s\+\S\+\ze\s\+AT NODE/
syn match abaqusLargestResidualForce /LARGEST RESIDUAL FORCE\s\+\S\+\ze\s\+AT NODE/
syn match abaqusCorrespondingResidualForce /CORRESPONDING RESIDUAL FORCE\s\+\S\+/
syn match abaqusLargestScaledResidualMoment /LARGEST SCALED RESIDUAL MOMENT\s\+\S\+\ze\s\+AT NODE/
syn match abaqusLargestResidualMoment /LARGEST RESIDUAL MOMENT\s\+\S\+\ze\s\+AT NODE/
syn match abaqusCorrespondingResidualMoment /CORRESPONDING RESIDUAL MOMENT\s\+\S\+/
syn match abaqusLargestIncR /LARGEST INCREMENT OF ROTATION\s\+\S\+\ze\s\+AT NODE/
syn match abaqusLargestCorrR /LARGEST CORRECTION TO ROTATION\s\+\S\+\ze\s\+AT NODE/
syn match abaqusIncrement "INCREMENT\s\+\d\+\s\+STARTS.\s\+ATTEMPT NUMBER\s\+\d\+,\s\+TIME INCREMENT\s\+\S\+"
syn match abaqusIncrementIncrease /TIME INCREMENT MAY NOW INCREASE TO\s\+\S\+/
syn match abaqusStep /STEP\s\+\d\+\s\+INCREMENT\s\+\d\+\s\+STEP TIME\s\+\d\+\.\d\+/
syn match abaqusWarning /.*\*\*\*WARNING:.*$/
syn match abaqusWarningStart /^\s*\*\*\*WARNING:.*$/ nextgroup=abaqusWarningCont,abaqusWarningStart
syn match abaqusWarningCont /^\s\{,\}\(ELEMENT NUMBER\|INCREMENTAL ROTATION UPDATE\|FIRST YIELD AT\|(CONTINUUM) ELEMENTS\|THE PLASTICITY\|EXPLANATIONS ARE SUGGESTED\|ALGORITHM\|INCORRECT\|ASSEMBLY\|SOLID\|NONCOVERGENCE\|WITH A \|DEFAULT \|DURING\|ENOUGH\|CONTROLS TO\).*$/
    \ nextgroup=abaqusWarningCont,abaqusWarningStart
hi def link abaqusWarningStart abaqusWarning
hi def link abaqusWarningCont abaqusWarning
syn match abaqusError /.*\*\*\*ERROR:.*$/
syn match abaqusErrorStart /^\s*\*\*\*ERROR:.*$/ nextgroup=abaqusErrorCont,abaqusErrorStart
syn match abaqusErrorCont /^\s\{,\}\(REQUESTS HAVE\).*$/
    \ nextgroup=abaqusErrorCont,abaqusErrorStart
hi def link abaqusErrorStart abaqusError
hi def link abaqusErrorCont abaqusError
syn match abaqusNote /.*\*\*\*NOTE:.*$/
syn match abaqusNoteStart /^\s*\*\*\*NOTE:.*$/ nextgroup=abaqusNoteCont,abaqusNoteStart
syn match abaqusNoteCont /^\s\{,\}\(A RIGID\|OR MORE\|ITERATIONS\).*$/
    \ nextgroup=abaqusNoteCont,abaqusNoteStart
hi def link abaqusNoteStart abaqusNote
hi def link abaqusNoteCont abaqusNote
syn match runtimeException "---------- RUNTIME EXCEPTION HAS OCCURRED ----------"
syn match abaqusSevereDiscontinuity /CONVERGENCE CHECKS FOR SEVERE DISCONTINUITY ITERATION\s\+\d\+/
syn match abaqusEquilibrium /CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION\s\+\d\+/
syn match abaqusPenetrationError /PENETRATION ERROR TOO LARGE COMPARED TO DISPLACEMENT INCREMENT\./
syn match abaqusForceEquilibrium /FORCE\s\+EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE\./
syn match abaqusMomentEquilibrium /MOMENT\s\+EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE\./
syn match abaqusMomentEquilibriumAcc /MOMENT\s\+EQUILIB\.\s\+ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION/
syn match abaqusZeroMoment /THERE IS ZERO MOMENT\s\+EVERYWHERE/
syn match abaqusForceEquilibriumAcc /FORCE\s\+EQUILIB\.\s\+ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION/
syn match abaqusDispCorrection /DISP\.\s\+CORRECTION TOO LARGE COMPARED TO DISP\.\s\+INCREMENT/
syn match abaqusRotCorrection /ROTATION CORRECTION TOO LARGE COMPARED TO ROTATION INCREMENT/
syn match abaqusElapsedTimes /JOB TIME SUMMARY/
syn match abaqusAnalysisSummary /ANALYSIS SUMMARY/
syn match abaqusAnalysisCompletion /THE ANALYSIS HAS BEEN COMPLETED/
syn match abaqusContactConstraintErrors /THE CONTACT CONSTRAINT ERRORS ARE WITHIN THE TOLERANCES\./
syn match abaqusContactConverged /THE CONTACT CONSTRAINTS HAVE CONVERGED\./
syn match abaqusForceEquilibriumConverged /THE FORCE\s\+EQUILIBRIUM EQUATIONS HAVE CONVERGED/
syn match abaqusMomentEquilibriumConverged /THE MOMENT\s\+EQUILIBRIUM EQUATIONS HAVE CONVERGED/
syn match abaqusLinearForceEquilibrium /THE FORCE\s\+EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT/
syn match abaqusLinearMomentEquilibrium /THE MOMENT\s\+EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT/
syn match abaqusSystemWarning /.*\*\*\*\sWARNING:.*$/
syn match abaqusDistortion /ELEMENT\s\+\S\+\sIS DISTORTING EXCESSIVELY\./
syn match abaqusTimeIncrementCompleted /TIME INCREMENT COMPLETED\s\+\S\+,\s\+FRACTION OF STEP COMPLETED\s\+\S\+/
syn match abaqusStepTimeCompleted /STEP TIME COMPLETED\s\+\S\+,\s\+TOTAL TIME COMPLETED\s\+\S\+/
syn match abaqusStaticAnalysis /S T E P\s\+\d\s\+S T A T I C\s\+A N A L Y S I S/
syn match abaqusSolver /LINEAR EQUATION SOLVER TYPE\s\+\w\+\s\+\w\+/
syn match abaqusConvergenceForce /CONVERGENCE TOLERANCE PARAMETERS FOR FORCE/
syn match abaqusConvergenceMoment /CONVERGENCE TOLERANCE PARAMETERS FOR MOMENT/
syn match abaqusTimeIncrementation /TIME INCREMENTATION CONTROL PARAMETERS:/
syn match abaqusContactControls /CONTACT CONTROLS APPLIED TO ALL CONTACT PAIRS:/
syn match abaqusSolverWarning /.*\*\*\*\sWARNING: SOLVER PROBLEM\..*$/

hi def abaqusContactPair ctermfg=DarkCyan guifg=DarkCyan
hi def abaqusIterationSummary ctermfg=Cyan guifg=Cyan
hi def abaqusSevereDiscontinuityIterations01 ctermfg=DarkMagenta guifg=DarkMagenta
hi def abaqusEquilibriumIterations01 ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusTimeIncCompleted ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusClosedToOpen ctermfg=Magenta guifg=Magenta
hi def abaqusOpenToClosed ctermfg=Magenta guifg=Magenta
hi def abaqusStickingToSlipping ctermfg=Magenta guifg=Magenta
hi def abaqusSlippingToSticking ctermfg=Magenta guifg=Magenta
hi def abaqusSevereDiscontinuities01 ctermfg=Magenta guifg=Magenta
hi def abaqusSevereDiscontinuities ctermbg=Magenta guibg=Magenta
hi def abaqusMomResZ ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusEstiCo ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusCompaError ctermfg=Red guifg=Red
hi def abaqusMaxConError ctermfg=Red guifg=Red
hi def abaqusMaxPenError ctermfg=Red guifg=Red
hi def abaqusLargestScaledResidualMoment ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusLargestResidualMoment ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusCorrespondingResidualMoment ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusAtNode ctermfg=Magenta guifg=Magenta
hi def abaqusDof ctermfg=DarkRed guifg=DarkRed
hi def abaqusLargestIncR ctermfg=DarkGreen guifg=DarkGreen
hi def abaqusLargestCorrR ctermfg=DarkGreen guifg=DarkGreen
hi def abaqusLargestIncD ctermfg=DarkGreen guifg=DarkGreen
hi def abaqusLargestCorrD ctermfg=DarkGreen guifg=DarkGreen
hi def abaqusAverageForce ctermfg=Blue guifg=Blue
hi def abaqusTimeAverageForce ctermfg=Blue guifg=Blue
hi def abaqusAverageMoment ctermfg=Blue guifg=Blue
hi def abaqusTimeAverageMoment ctermfg=Blue guifg=Blue
hi def abaqusLargestResidualForce ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusLargestScaledResidualForce ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusCorrespondingResidualForce ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusIncrement ctermbg=DarkBlue guibg=DarkBlue
hi def abaqusZeroMoment ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusIncrementIncrease ctermfg=Green guifg=Green
hi def abaqusStep ctermfg=DarkBlue guifg=DarkBlue
hi def abaqusWarning ctermbg=DarkYellow guibg=DarkYellow
hi def abaqusError ctermbg=Red guibg=Red
hi def abaqusDispCorrection ctermfg=Red guifg=Red
hi def abaqusRotCorrection ctermfg=Red guifg=Red
hi def abaqusNote ctermbg=DarkCyan guibg=DarkCyan
hi def runtimeException ctermfg=Red guifg=Red
hi def abaqusSevereDiscontinuity ctermfg=DarkMagenta guifg=DarkMagenta
hi def abaqusEquilibrium ctermfg=Brown guifg=Brown
hi def abaqusLinearForceEquilibrium ctermfg=Green guifg=Green
hi def abaqusLinearMomentEquilibrium ctermfg=Green guifg=Green
hi def abaqusPenetrationError ctermfg=Red guifg=Red
hi def abaqusForceEquilibrium ctermfg=Red guifg=Red
hi def abaqusMomentEquilibrium ctermfg=Red guifg=Red
hi def abaqusMomentEquilibriumAcc ctermfg=Green guifg=Green
hi def abaqusForceEquilibriumAcc ctermfg=Green guifg=Green
hi def abaqusElapsedTimes ctermfg=DarkGreen guifg=DarkGreen
hi def abaqusAnalysisSummary ctermfg=DarkGreen guifg=DarkGreen
hi def abaqusAnalysisCompletion ctermbg=DarkGreen guibg=DarkGreen
hi def abaqusContactConstraintErrors ctermfg=Green guifg=Green
hi def abaqusContactConverged ctermfg=Green guifg=Green
hi def abaqusForceEquilibriumConverged ctermfg=Green guifg=Green
hi def abaqusMomentEquilibriumConverged ctermfg=Green guifg=Green
hi def abaqusSystemWarning ctermfg=Yellow guifg=Yellow
hi def abaqusDistortion ctermfg=Yellow guifg=Yellow
hi def abaqusTimeIncrementCompleted ctermfg=Cyan guifg=Cyan
hi def abaqusStepTimeCompleted ctermfg=Cyan guifg=Cyan
hi def abaqusStaticAnalysis ctermbg=DarkBlue guibg=DarkBlue
hi def abaqusSolver ctermfg=LightGreen guifg=LightGreen
hi def abaqusConvergenceForce ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusConvergenceMoment ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusTimeIncrementation ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusContactControls ctermfg=DarkYellow guifg=DarkYellow
hi def abaqusSolverWarning ctermbg=DarkYellow guibg=DarkYellow

hi def link abaqusContactPair abaqusContactPair
hi def link abaqusTimeIncrementCompleted abaqusTimeIncrementCompleted
hi def link abaqusStepTimeCompleted abaqusStepTimeCompleted
hi def link abaqusIterationSummary abaqusIterationSummary
hi def link abaqusSevereDiscontinuityIterations01 abaqusSevereDiscontinuityIterations01
hi def link abaqusEquilibriumIterations01 abaqusEquilibriumIterations01
hi def link abaqusTimeIncCompleted abaqusTimeIncCompleted
hi def link abaqusClosedToOpen abaqusClosedToOpen
hi def link abaqusOpenToClosed abaqusOpenToClosed
hi def link abaqusStickingToSlipping abaqusStickingToSlipping
hi def link abaqusSlippingToSticking abaqusSlippingToSticking
hi def link abaqusSevereDiscontinuities01 abaqusSevereDiscontinuities01
hi def link abaqusSevereDiscontinuities abaqusSevereDiscontinuities
hi def link abaqusMomResZ abaqusMomResZ
hi def link abaqusEstiCo abaqusEstiCo
hi def link abaqusCompaError abaqusCompaError
hi def link abaqusMaxConError abaqusMaxConError
hi def link abaqusMaxPenError abaqusMaxPenError
hi def link abaqusLargestScaledResidualMoment abaqusLargestScaledResidualMoment
hi def link abaqusLargestResidualMoment abaqusLargestResidualMoment
hi def link abaqusCorrespondingResidualMoment abaqusCorrespondingResidualMoment
hi def link abaqusAtNode abaqusAtNode
hi def link abaqusDof abaqusDof
hi def link abaqusLargestIncR abaqusLargestIncR
hi def link abaqusLargestCorrR abaqusLargestCorrR
hi def link abaqusLargestIncD abaqusLargestIncD
hi def link abaqusLargestCorrD abaqusLargestCorrD
hi def link abaqusAverageForce abaqusAverageForce
hi def link abaqusTimeAverageForce abaqusTimeAverageForce
hi def link abaqusAverageMoment abaqusAverageMoment
hi def link abaqusTimeAverageMoment abaqusTimeAverageMoment
hi def link abaqusLargestResidualForce abaqusLargestResidualForce
hi def link abaqusLargestScaledResidualForce abaqusLargestScaledResidualForce
hi def link abaqusCorrespondingResidualForce abaqusCorrespondingResidualForce
hi def link abaqusIncrement abaqusIncrement
hi def link abaqusZeroMoment abaqusZeroMoment
hi def link abaqusIncrementIncrease abaqusIncrementIncrease
hi def link abaqusStep abaqusStep
hi def link abaqusWarning abaqusWarning
hi def link abaqusError abaqusError
hi def link abaqusNote abaqusNote
hi def link abaqusDispCorrection abaqusDispCorrection
hi def link abaqusMomentEquilibriumAcc abaqusMomentEquilibriumAcc
hi def link abaqusForceEquilibriumAcc abaqusForceEquilibriumAcc
hi def link abaqusRotCorrection abaqusDispCorrection
hi def link runtimeException runtimeException
hi def link abaqusSevereDiscontinuity abaqusSevereDiscontinuity
hi def link abaqusEquilibrium abaqusEquilibrium
hi def link abaqusPenetrationError abaqusPenetrationError
hi def link abaqusForceEquilibrium abaqusForceEquilibrium
hi def link abaqusLinearForceEquilibrium abaqusLinearForceEquilibrium
hi def link abaqusLinearMomentEquilibrium abaqusLinearMomentEquilibrium
hi def link abaqusMomentEquilibrium abaqusMomentEquilibrium
hi def link abaqusElapsedTimes abaqusElapsedTimes
hi def link abaqusContactConstraintErrors abaqusContactConstraintErrors
hi def link abaqusContactConverged abaqusContactConverged
hi def link abaqusAnalysisSummary abaqusAnalysisSymmary
hi def link abaqusAnalysisCompletion abaqusAnalysisCompletion
hi def link abaqusForceEquilibriumConverged abaqusForceEquilibriumConverged
hi def link abaqusMomentEquilibriumConverged abaqusMomentEquilibriumConverged
hi def link abaqusSystemWarning abaqusSystemWarning
hi def link abaqusDistortion abaqusDistortion
hi def link abaqusTimeIncrementCompleted abaqusTimeIncrementCompleted
hi def link abaqusStaticAnalysis abaqusStaticAnalysis
hi def link abaqusSolver abaqusSolver
hi def link abaqusConvergenceForce abaqusConvergenceForce
hi def link abaqusConvergenceMoment abaqusConvergenceMoment
hi def link abaqusTimeIncrementation abaqusTimeIncrementation
hi def link abaqusContactControls abaqusContactControls
hi def link abaqusSolverWarning abaqusSolverWarning

let b:current_syntax = "messagefile"
