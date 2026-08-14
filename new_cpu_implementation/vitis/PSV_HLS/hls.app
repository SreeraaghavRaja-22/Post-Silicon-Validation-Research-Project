<project xmlns="com.autoesl.autopilot.project" name="PSV_HLS" top="pipeline_top">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../../../hls/test/testbench_hls.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../hls/pipeline_core_hls.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../hls/pipeline_core_hls.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="RAW_solu" status="active"/>
    </solutions>
</project>

