" messagefile.vim
if exists("b:current_syntax")
  finish
endif

" Define syntax groups for various messages and states
syn match abaqusIncrement "INCREMENT\s\+\d\+\s\+STARTS.\s\+ATTEMPT NUMBER\s\+\d\+,\s\+TIME INCREMENT\s\+\S\+"
syn match abaqusIncrementIncrease /TIME INCREMENT MAY NOW INCREASE TO\s\+\S\+/
syn match abaqusStep /STEP\s\+\d\+\s\+INCREMENT\s\+\d\+\s\+STEP TIME\s\+\d\+\.\d\+/
syn match abaqusWarning /.*\*\*\*WARNING:.*$/

" Match the start of a warning message
syn match abaqusWarningStart /^\s*\*\*\*WARNING:.*$/ nextgroup=abaqusWarningCont,abaqusWarningStart

" Match the continuation lines of a warning message, adjust the pattern to match more specifically
" syn match abaqusWarningCont /^\s\{13\}\(ELEMENT NUMBER\|INCREMENTAL ROTATION UPDATE\).*$/
syn match abaqusWarningCont /^\s\{13\}\(ELEMENT NUMBER\|INCREMENTAL ROTATION UPDATE\|FIRST YIELD AT\|(CONTINUUM) ELEMENTS\|THE PLASTICITY\|EXPLANATIONS ARE SUGGESTED\).*$/
    \ nextgroup=abaqusWarningCont,abaqusWarningStart

" Define the highlighting for these matches
hi def link abaqusWarningStart abaqusWarning
hi def link abaqusWarningCont abaqusWarning


syn match abaqusNote /.*\*\*\*NOTE:.*$/
syn match abaqusError /.*\*\*\*ERROR:.*$/
syn match abaqusError /.*\*\*\* ERROR:.*$/
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
syn match abaqusStaticAnalysis /S T E P\s\+\d\s\+S T A T I C\s\+A N A L Y S I S/
syn match abaqusSolver /LINEAR EQUATION SOLVER TYPE\s\+\w\+\s\+\w\+/
syn match abaqusConvergenceForce /CONVERGENCE TOLERANCE PARAMETERS FOR FORCE/
syn match abaqusConvergenceMoment /CONVERGENCE TOLERANCE PARAMETERS FOR MOMENT/
syn match abaqusTimeIncrementation /TIME INCREMENTATION CONTROL PARAMETERS:/
syn match abaqusContactControls /CONTACT CONTROLS APPLIED TO ALL CONTACT PAIRS:/
syn match abaqusSolverWarning /.*\*\*\*\sWARNING: SOLVER PROBLEM\..*$/


" Link the syntax groups to colors
hi def abaqusIncrement ctermbg=DarkBlue
hi def abaqusZeroMoment ctermfg=DarkYellow
hi def abaqusIncrementIncrease ctermfg=Green
hi def abaqusStep ctermfg=DarkBlue
hi def abaqusWarning ctermbg=DarkYellow
hi def abaqusError ctermbg=Red
hi def abaqusDispCorrection ctermfg=Red
hi def abaqusRotCorrection ctermfg=Red
hi def abaqusNote ctermbg=DarkCyan
hi def runtimeException ctermfg=Red
hi def abaqusSevereDiscontinuity ctermfg=DarkMagenta
hi def abaqusEquilibrium ctermfg=Brown
hi def abaqusLinearForceEquilibrium ctermfg=Green
hi def abaqusLinearMomentEquilibrium ctermfg=Green
hi def abaqusPenetrationError ctermfg=Red
hi def abaqusForceEquilibrium ctermfg=Red
hi def abaqusMomentEquilibrium ctermfg=Red
hi def abaqusMomentEquilibriumAcc ctermfg=Green
hi def abaqusForceEquilibriumAcc ctermfg=Green
hi def abaqusElapsedTimes ctermfg=DarkGreen
hi def abaqusAnalysisSummary ctermfg=DarkGreen
hi def abaqusAnalysisCompletion ctermbg=DarkGreen
hi def abaqusContactConstraintErrors ctermfg=Green
hi def abaqusContactConverged ctermfg=Green
hi def abaqusForceEquilibriumConverged ctermfg=Green
hi def abaqusMomentEquilibriumConverged ctermfg=Green
hi def abaqusSystemWarning ctermfg=Yellow
hi def abaqusDistortion ctermfg=Yellow
hi def abaqusTimeIncrementCompleted ctermfg=LightCyan
hi def abaqusStaticAnalysis ctermbg=DarkBlue
hi def abaqusSolver ctermfg=LightGreen
hi def abaqusConvergenceForce ctermfg=DarkYellow
hi def abaqusConvergenceMoment ctermfg=DarkYellow
hi def abaqusTimeIncrementation ctermfg=DarkYellow
hi def abaqusContactControls ctermfg=DarkYellow
hi def abaqusSolverWarning ctermbg=DarkYellow


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
