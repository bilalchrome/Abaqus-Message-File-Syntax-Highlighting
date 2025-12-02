" Abaqus Message File Syntax Highlighting
" For more information and updates, visit: https://github.com/bilalchrome/Abaqus-Message-File-Syntax-Highlighting
" Author: Bilal Abdul Halim

if exists("b:current_syntax")
  finish
endif

" -------------------------------------------------------------------
" Section: Basic and miscellaneous matches
" -------------------------------------------------------------------

" Contact pair designation: e.g. (SURF1,SURF2)
syn match abaqusContactPair        /(\(\w\+\,\w\+\))/ 

" Lines referencing nodes and degrees of freedom
syn match abaqusAtNode              /AT NODE.\{-}\zeDOF/
syn match abaqusAtNode              /AT NODE.\{-}\zeOF CONTACT/
syn match abaqusDof                 /DOF\s\+\d\+/

" Numeric values: decimal and scientific notation
syn match abaqusNumeric             /\v[-+]?\d+(\.\d+)?(E[-+]?\d+)?/

" Non-default controls: lines beginning with "***" indicate non-default
" convergence or time increment parameters selected via *CONTROLS
syn match abaqusNonDefaultCtrl      /^\s*\*\*\*.*/

" Runtime exception banner
syn match runtimeException          /---------- RUNTIME EXCEPTION HAS OCCURRED ----------/

" -------------------------------------------------------------------
" Section: Step and analysis headers
" -------------------------------------------------------------------

" STEP header showing the current step, increment and step time
syn match abaqusStepHeader          /^\s*STEP\s\+\d\+\s\+INCREMENT\s\+\d\+\s\+STEP\s\+TIME\s\+[0-9.E+-]\+/

" Generic analysis header: matches any line (not beginning with *) that
" contains the word ANALYSIS.  Examples include static/dynamic analyses
syn match abaqusAnalysisHeader      /^\s*[^*].*ANALYSIS.*$/

" Step type header: lines like "S T E P  1  S T A T I C  A N A L Y S I S"
syn match abaqusStepTypeHeader      /^\s*S T E P\s\+\d\+.*$/

" Analysis data check header
syn match abaqusDataCheckHeader     /^\s*A N A L Y S I S\s\+D A T A C H E C K.*/

" Analysis summary and completion messages
syn match abaqusAnalysisSummaryHeader /^\s*ANALYSIS SUMMARY:/
syn match abaqusAnalysisCompletion   /^\s*THE ANALYSIS HAS BEEN COMPLETED/

" -------------------------------------------------------------------
" Section: Increment control and solver information
" -------------------------------------------------------------------

" Increment start: captures increment number, attempt number and time increment
syn match abaqusIncrementHeader     /^\s*INCREMENT\s\+\d\+\s\+STARTS\.\s\+ATTEMPT\s\+NUMBER\s\+\d\+,\s\+TIME\s\+INCREMENT\s\+[0-9.E+-]\+/

" Lines indicating that a time increment may increase
syn match abaqusIncrementIncrease   /^\s*TIME\s\+INCREMENT\s\+MAY\s\+NOW\s\+INCREASE\s\+TO\s\+[0-9.E+-]\+/

" Time increment and step time completion summaries
syn match abaqusTimeIncSummary      /^\s*TIME\s\+INCREMENT\s\+COMPLETED\s\+[0-9.E+-]\+,\s\+FRACTION\s\+OF\s\+STEP\s\+COMPLETED\s\+[0-9.E+-]\+/
syn match abaqusStepTimeSummary     /^\s*STEP\s\+TIME\s\+COMPLETED\s\+[0-9.E+-]\+,\s\+TOTAL\s\+TIME\s\+COMPLETED\s\+[0-9.E+-]\+$/

" Solver running information
syn match abaqusSolverRunning       /^\s*SYMMETRIC\s\+HYBRID\s\+DIRECT\s\+SPARSE\s\+SOLVER\s\+RUNNING\s\+ON/
syn match abaqusSolverRunning       /^\s*REGULARIZED\s\+UNSYMMETRIC\s\+HYBRID\s\+DIRECT\s\+SPARSE\s\+SOLVER\s\+RUNNING\s\+ON/
syn match abaqusParallelInfo        /^\s*\d\+\s\+HOST\s\+x\s\+\d\+\s\+MPI\s\+RANK\s\+PER\s\+HOST\s\+x\s\+\d\+\s\+THREADS\s\+PER\s\+RANK/
syn match abaqusCountLabel          /^\s*NUMBER\s\+OF\s\+\(EQUATIONS\|RHS\|FLOPS\):/

" Job time summary header and lines
syn match abaqusJobTimeHeader       /^\s*JOB TIME SUMMARY$/
syn match abaqusJobTimeLine         /^\s*\w.*=\s*[0-9.E+-]\+\(\s*[0-9.E+-]\+\)*$/

" Restart information and check point markers
syn match abaqusRestartInfo         /^\s*RESTART INFORMATION WRITTEN.*/
syn match abaqusCheckPoint          /^\s*CHECK POINT.*/

" Element load balance and parallel contact tracking
syn match abaqusElementLoadHeader   /^\s*INITIAL ELEMENT LOAD BALANCE.*/
syn match abaqusParallelContact     /^\s*PARALLEL CONTACT TRACKING ENABLED/

" Constraint information
syn match abaqusConstraintInfo      /^\s*COLLECTING .*CONSTRAINT INFORMATION.*$/

" Time increment control parameter section
syn match abaqusTimeIncrementation  /^\s*TIME INCREMENTATION CONTROL PARAMETERS:/

" Linear equation solver type header
syn match abaqusSolverType          /^\s*LINEAR EQUATION SOLVER TYPE\s\+\w\+\s\+\w\+/

" -------------------------------------------------------------------
" Section: Convergence tolerance parameters and controls
" -------------------------------------------------------------------

" Headers for convergence tolerance sections (Force, Moment, Cav. Vol., Vol. Flux)
syn match abaqusToleranceSection    /^\s*CONVERGENCE TOLERANCE PARAMETERS FOR \w\+/

" Individual criterion lines beginning with CRITERION or ALTERNATE CRIT.
syn match abaqusCriterionLine       /^\s*\(CRITERION\|ALTERNATE CRIT\.\)\s.*$/

" Lines indicating that non-default parameters are selected
syn match abaqusNonDefaultIndicator /^\s*\*\*\* INDICATES USE OF.*/

" Time increment control criteria lines (cut-back, increase factors, etc.)
syn match abaqusTimeControlParam    /^\s*\(CUT-BACK FACTOR\|INCREASE FACTOR\|MAX\. TIME INCREMENT\|MINIMUM TIME INCREMENT\|MAXIMUM EQUILIBRIUM ITERATIONS\|MAXIMUM DISCON\. ITERS\|MAXIMUM CONTACT AUGMENTATIONS\).*/

" -------------------------------------------------------------------
" Section: Convergence checks, residuals, contact and averages
" -------------------------------------------------------------------

" Convergence checks for equilibrium and severe discontinuity iterations
syn match abaqusEquilConvChecks     /^\s*CONVERGENCE\s\+CHECKS\s\+FOR\s\+EQUILIBRIUM\s\+ITERATION\s\+\d\+/
syn match abaqusSevereDiscontinuity /^\s*CONVERGENCE\s\+CHECKS\s\+FOR\s\+SEVERE\s\+DISCONTINUITY\s\+ITERATION\s\+\d\+/

" Severe discontinuity counts and contact state changes
syn match abaqusSevereDiscontinuityCount /^\s*\d\+\s\+SEVERE\s\+DISCONTINUITIES\s\+OCCURRED\s\+DURING\s\+THIS\s\+ITERATION\./
syn match abaqusContactStateChange       /^\s*\d\+\s\+POINTS\s\+CHANGED\s\+FROM\s\+\(OPEN\|CLOSED\)\s\+TO\s\+\(OPEN\|CLOSED\)/

" Contact error lines
syn match abaqusContactErrorLine     /^\s*MAX\.\s\+\(PENETRATION\s\+ERROR\|CONTACT\s\+FORCE\s\+ERROR\)\s\+.*$/

" Contact constraint status messages
syn match abaqusContactConverged     /^\s*THE\s\+CONTACT\s\+CONSTRAINTS\s\+HAVE\s\+CONVERGED\./
syn match abaqusContactWithinTol     /^\s*THE\s\+CONTACT\s\+CONSTRAINT\s\+ERRORS\s\+ARE\s\+WITHIN\s\+THE\s\+TOLERANCES\./
syn match abaqusContactOutsideTol    /^\s*THE\s\+ESTIMATED\s\+CONTACT\s\+FORCE\s\+ERROR\s\+IS\s\+OUTSIDE\s\+OF\s\+CONVERGENCE\s\+TOLERANCES\./

" Average lines for Force, Moment and Vol. Flux (and cavity volume if present)
syn match abaqusAverageLine         /^\s*AVERAGE\s\+\(FORCE\|MOMENT\|VOL\.\s\+FLUX\|CAV\.\s\+VOL\.\)/

" Time average continuation lines
syn match abaqusTimeAverageLine     /^\s*TIME\s\+AVG\.\s\+.*$/

" Largest residual, increment or correction lines (scaled and unscaled)
syn match abaqusLargestLine         /^\s*LARGEST\s\+\(SCALED\s\+\)\?\(RESIDUAL\|INCREMENT\|CORRECTION\).*/

" Corresponding residual lines
syn match abaqusCorrespondingLine   /^\s*CORRESPONDING\s\+RESIDUAL\s\+\(FORCE\|MOMENT\|CAV\.\s\+VOL\.\)\?\s.*$/

" Lines summarising estimate or correction values
syn match abaqusEstimateLine        /^\s*ESTIMATE OF .*/

" Vol. flux zero-residual / status lines
syn match abaqusVolFluxResidualZero /^\s*ALL\s\+VOL\.\s\+FLUX\s\+RESIDUALS\s\+ARE\s\+ZERO/
syn match abaqusZeroVolFlux         /^\s*THERE\s\+IS\s\+ZERO\s\+VOL\.\s\+FLUX\s\+EVERYWHERE/

" -------------------------------------------------------------------
" Section: Equilibrium status and convergence messages
" -------------------------------------------------------------------

" Equilibrium not achieved messages for force, moment or flux / cavity volume
syn match abaqusEquilNotAchieved    /^\s*\(FORCE\|MOMENT\|CAV\.\s\+VOL\.\|VOL\.\s\+FLUX\)\s\+EQUILIBRIUM\s\+NOT\s\+ACHIEVED\s\+WITHIN\s\+TOLERANCE\./

" Equilibrium converged messages
syn match abaqusEquilConverged      /^\s*THE\s\+\(FORCE\|MOMENT\|CAV\.\s\+VOL\.\|VOL\.\s\+FLUX\)\s\+EQUILIBRIUM\s\+EQUATIONS\s\+HAVE\s\+CONVERGED/

" Equilibrium accepted based on residual and estimated correction
syn match abaqusEquilAccepted       /^\s*\(FORCE\|MOMENT\|CAV\.\s\+VOL\.\|VOL\.\s\+FLUX\)\?\s*EQUILIB\.\s\+ACCEPTED\s\+BASED\s\+ON\s\+SMALL\s\+RESIDUAL\s\+AND\s\+ESTIMATED\s\+CORRECTION/

" Linear equilibrium response messages
syn match abaqusEquilLinear         /^\s*THE\s\+\(FORCE\|MOMENT\|CAV\.\s\+VOL\.\|VOL\.\s\+FLUX\)\s\+EQUILIBRIUM\s\+RESPONSE\s\+WAS\s\+LINEAR\s\+IN\s\+THIS\s\+INCREMENT/

" Severe discontinuity iteration counts in iteration summary (keep for completeness)
syn match abaqusSevereDiscontinuityIterations /^\s*\d\+\s\+ARE\s\+SEVERE\s\+DISCONTINUITY\s\+ITERATIONS\.\?$/

" Equilibrium iteration counts within the iteration summary
syn match abaqusEquilibriumIterations  /^\s*\d\+\s\+ARE\s\+EQUILIBRIUM\s\+ITERATIONS\.\?$/

" -------------------------------------------------------------------
" Section: Iteration summaries and summaries for increments
" -------------------------------------------------------------------

" Iteration summary header
syn match abaqusIterSummaryHeader   /^\s*ITERATION SUMMARY FOR THE INCREMENT:.*/

" Counts of severe discontinuity and equilibrium iterations in summary
syn match abaqusIterSummaryCount    /^\s*\d\+\s\+ARE.*ITERATIONS\.\?$/

" -------------------------------------------------------------------
" Section: Error, warning and note messages
" -------------------------------------------------------------------

" Warnings: a line containing ***WARNING and its continuations
syn match abaqusWarning             /.*\*\*\*WARNING:.*/
syn match abaqusWarningStart        /^\s*\*\*\*WARNING:.*/ nextgroup=abaqusWarningCont,abaqusWarningStart
syn match abaqusWarningCont         /^\s\{,}\(ELEMENT NUMBER\|INCREMENTAL ROTATION UPDATE\|FIRST YIELD AT\|(CONTINUUM) ELEMENTS\|THE PLASTICITY\|EXPLANATIONS ARE SUGGESTED\|ALGORITHM\|INCORRECT\|ASSEMBLY\|SOLID\|NONCOVERGENCE\|WITH A \|DEFAULT \|DURING\|ENOUGH\|CONTROLS TO\).*/ nextgroup=abaqusWarningCont,abaqusWarningStart

" System warnings and solver warnings
syn match abaqusSystemWarning       /.*\*\*\*\sWARNING:.*/
syn match abaqusSolverWarning       /.*\*\*\*\sWARNING: SOLVER PROBLEM\..*/

" Errors and their continuations
syn match abaqusError               /.*\*\*\*ERROR:.*/
syn match abaqusErrorStart          /^\s*\*\*\*ERROR:.*/ nextgroup=abaqusErrorCont,abaqusErrorStart
syn match abaqusErrorCont           /^\s\{,}\(REQUESTS HAVE\).*/ nextgroup=abaqusErrorCont,abaqusErrorStart

" Notes and their continuations
syn match abaqusNote                /.*\*\*\*NOTE:.*/
syn match abaqusNoteStart           /^\s*\*\*\*NOTE:.*/ nextgroup=abaqusNoteCont,abaqusNoteStart
syn match abaqusNoteCont            /^\s\{,}\(A RIGID\|OR MORE\|ITERATIONS\).*/ nextgroup=abaqusNoteCont,abaqusNoteStart

" Penetration error and other specific warning lines
syn match abaqusPenetrationError    /PENETRATION ERROR TOO LARGE COMPARED TO DISPLACEMENT INCREMENT\./
syn match abaqusDispCorrection      /^\s*DISP\.\s\+CORRECTION TOO LARGE COMPARED TO DISP\.\s\+INCREMENT/
syn match abaqusRotCorrection       /ROTATION CORRECTION TOO LARGE COMPARED TO ROTATION INCREMENT/
syn match abaqusDistortion          /ELEMENT\s\+\S\+\sIS DISTORTING EXCESSIVELY\./

" -------------------------------------------------------------------
" Section: Job and analysis summaries
" -------------------------------------------------------------------

" Analysis count lines (used in analysis summary sections)
syn match abaqusAnalysisCount       /^\s*\d\+\s\+\w.*$/

" Job elapsed time summary lines
syn match abaqusElapsedTimes        /^\s*JOB TIME SUMMARY/

" -------------------------------------------------------------------
" Section: Highlight group links
" -------------------------------------------------------------------

" Link syntax groups to existing Vim highlight groups.

hi def link abaqusContactPair        Identifier
hi def link abaqusAtNode             Identifier
hi def link abaqusDof                Number
hi def link abaqusNumeric            Number
hi def link abaqusNonDefaultCtrl     Special
hi def link runtimeException         ErrorMsg

" Headers and section titles
hi def link abaqusStepHeader         Label
hi def link abaqusStepTypeHeader     Label
hi def link abaqusDataCheckHeader    Title
hi def link abaqusAnalysisHeader     Title
hi def link abaqusAnalysisSummaryHeader Title
hi def link abaqusAnalysisCompletion Statement

" Increment and solver details
hi def link abaqusIncrementHeader    Label
hi def link abaqusIncrementIncrease  WarningMsg
hi def link abaqusTimeIncSummary     Statement
hi def link abaqusStepTimeSummary    Statement
hi def link abaqusSolverRunning      Statement
hi def link abaqusParallelInfo       Type
hi def link abaqusCountLabel         PreProc
hi def link abaqusJobTimeHeader      Title
hi def link abaqusJobTimeLine        Identifier
hi def link abaqusRestartInfo        Statement
hi def link abaqusCheckPoint         Statement
hi def link abaqusElementLoadHeader  Title
hi def link abaqusParallelContact    Type
hi def link abaqusConstraintInfo     Statement
hi def link abaqusTimeIncrementation Title
hi def link abaqusSolverType         Statement

" Convergence parameters
hi def link abaqusToleranceSection   Identifier
hi def link abaqusCriterionLine      Identifier
hi def link abaqusNonDefaultIndicator Special
hi def link abaqusTimeControlParam   Identifier

" Convergence checks and residuals
hi def link abaqusEquilConvChecks    Function
hi def link abaqusSevereDiscontinuity Function
hi def link abaqusSevereDiscontinuityCount WarningMsg
hi def link abaqusContactStateChange Identifier
hi def link abaqusContactErrorLine   Identifier
hi def link abaqusContactConverged   Statement
hi def link abaqusContactWithinTol   Statement
hi def link abaqusContactOutsideTol  WarningMsg
hi def link abaqusAverageLine        Identifier
hi def link abaqusTimeAverageLine    Identifier
hi def link abaqusLargestLine        Identifier
hi def link abaqusCorrespondingLine  Identifier
hi def link abaqusEstimateLine       Identifier
hi def link abaqusVolFluxResidualZero Identifier
hi def link abaqusZeroVolFlux        Statement

" Equilibrium status
hi def link abaqusEquilNotAchieved   WarningMsg
hi def link abaqusEquilConverged     Statement
hi def link abaqusEquilAccepted      Statement
hi def link abaqusEquilLinear        Statement
hi def link abaqusSevereDiscontinuityIterations WarningMsg
hi def link abaqusEquilibriumIterations Number

" Iteration summaries
hi def link abaqusIterSummaryHeader  Label
hi def link abaqusIterSummaryCount   Number

" Error, warning and note groups
hi def link abaqusWarning            WarningMsg
hi def link abaqusWarningStart       WarningMsg
hi def link abaqusWarningCont        WarningMsg
hi def link abaqusSystemWarning      WarningMsg
hi def link abaqusSolverWarning      WarningMsg
hi def link abaqusError              ErrorMsg
hi def link abaqusErrorStart         ErrorMsg
hi def link abaqusErrorCont          ErrorMsg
hi def link abaqusNote               Identifier
hi def link abaqusNoteStart          Identifier
hi def link abaqusNoteCont           Identifier
hi def link abaqusPenetrationError   WarningMsg
hi def link abaqusDispCorrection     WarningMsg
hi def link abaqusRotCorrection      WarningMsg
hi def link abaqusDistortion         WarningMsg

" Job/analysis summary lines
hi def link abaqusAnalysisCount      Number
hi def link abaqusElapsedTimes       Title

" Set the current syntax for this buffer
let b:current_syntax = "abaqusmsg"
