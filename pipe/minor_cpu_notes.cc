
/** Pipeline Evaluate Function */
void Pipeline::evaluate()
{

   /** Note that it is important to evaluate the stages in order to
    * allow 'immediate', 0-time offset TimeBuffer activity to be 
    * visible from later stages to earlier ones in the same cycle */
   execute.evaluate();
   decode.evaluate();
   fetch2.evaluate();
   fetch1.evaluate();

   /* Update the time buffers/latches after the stages */
   f1toF2.evaluate();
   f2ToF1.evaluate();
   f2ToD.evaluate();
   dToE.evaluate();
   eToF1.evaluate();

}
