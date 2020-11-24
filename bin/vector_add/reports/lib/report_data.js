var areaJSON='{"columns":["", "ALUTs", "FFs", "RAMs", "DSPs", "Details"], "debug_enabled":"true", "type":"module", "total_percent":[33.5122, 21.0985, 14.3157, 15.1751, 0], "total":[23118, 31372, 78, 0], "name":"Kernel System", "max_resources":[109572, 219144, 514, 112], "children":[{"name":"Board interface", "type":"resource", "data":[2160, 1908, 20, 0], "details":[{"type":"text", "text":"Platform interface logic."}]}, {"name":"Global interconnect", "type":"resource", "data":[6577, 8915, 0, 0], "details":[{"type":"text", "text":"Global interconnect for 2 global loads and 1 global store. Reduce number of global loads and stores to simplify global interconnect."}, {"type":"text", "text":"See %L for more information", "links":[{"guide":"Best Practices Guide : Global Memory Interconnect", "link":"https://www.altera.com/documentation/mwh1391807516407.html#hnj1476724450050"}]}]}, {"name":"vector_add", "compute_units":1, "type":"function", "total_percent":[21.3656, 13.1247, 9.37694, 11.284, 0], "total_kernel_resources":[14381, 20549, 58, 0], "details":[{"type":"text", "text":"Number of compute units: 1"}], "children":[{"name":"Function overhead", "type":"resource", "data":[1574, 1505, 0, 0], "details":[{"type":"text", "text":"Kernel dispatch logic."}]}, {"name":"vector_add.B0", "type":"basicblock", "children":[{"name":"State", "type":"resource", "data":[58, 14, 0, 0], "details":[{"type":"text", "text":"Resources for live values and control logic. To reduce this area:", "details":[{"type":"text", "text":"reduce size of local variables"}, {"type":"text", "text":"reduce scope of local variables, localizing them as much as possible"}, {"type":"text", "text":"reduce number of nested loops"}]}], "children":[{"name":"No Source Line", "type":"resource", "data":[58, 14, 0, 0]}]}, {"name":"Feedback", "type":"resource", "data":[58, 55, 0, 0], "details":[{"type":"text", "text":"Resources for loop-carried dependencies. To reduce this area:", "details":[{"type":"text", "text":"reduce number and size of loop-carried variables"}]}], "children":[{"name":"No Source Line", "type":"resource", "data":[58, 55, 0, 0]}]}, {"name":"Cluster logic", "type":"resource", "data":[586, 179, 0, 0], "details":[{"type":"text", "text":"Logic required to efficiently support sets of operations that do not stall. This area cannot be affected directly."}]}, {"name":"Computation", "type":"resource", "children":[{"name":"No Source Line", "type":"resource", "data":[33, 2, 0, 0], "debug":[[{"filename":"", "line":0}]], "children":[{"name":"And", "type":"resource", "count":1, "data":[11, 0, 0, 0]}, {"name":"Integer Compare", "type":"resource", "count":1, "data":[11, 1, 0, 0]}, {"name":"Or", "type":"resource", "count":2, "data":[11, 1, 0, 0]}]}, {"name":"vector_add.cl:6", "type":"resource", "data":[12072, 18794, 58, 0], "debug":[[{"filename":"d:/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl", "line":6}]], "children":[{"name":"Floating-point Add", "type":"resource", "count":10, "data":[9950, 7170, 0, 0]}, {"name":"Load", "type":"resource", "count":2, "data":[1692, 8212, 42, 0], "details":[{"type":"text", "text":"Load uses a Burst-coalesced LSU"}]}, {"name":"Store", "type":"resource", "count":1, "data":[430, 3412, 16, 0], "details":[{"type":"text", "text":"Store uses a Burst-coalesced LSU"}]}], "replace_name":"true"}]}]}]}]}';
var area_srcJSON='{"max_resources":[109572,219144,514,112],"name":"Kernel System","children":[{"name":"Board interface","type":"resource","data":[2160,1908,20,0],"details":[{"text":"Platform interface logic.","type":"text"}]},{"name":"Global interconnect","type":"resource","data":[6577,8915,0,0],"details":[{"text":"Global interconnect for 2 global loads and 1 global store. Reduce number of global loads and stores to simplify global interconnect.","type":"text"},{"text":"See %L for more information","type":"text","links":[{"link":"https://www.altera.com/documentation/mwh1391807516407.html#hnj1476724450050","guide":"Best Practices Guide : Global Memory Interconnect"}]}]},{"name":"vector_add","total_kernel_resources":[14381,20549,58,0],"type":"function","total_percent":[21.3656,13.1247,9.37694,11.284,0],"children":[{"detail":[{"text":"Feedback + Cluster logic","type":"text"}],"name":"Data control overhead","type":"resource","data":[644,234,0,0]},{"name":"Function overhead","type":"resource","data":[1574,1505,0,0],"details":[{"text":"Kernel dispatch logic.","type":"text"}]},{"name":"No Source Line","children":[{"count":1,"name":"State","debug":[[{"filename":"","line":0}]],"type":"resource","data":[58,14,0,0]},{"count":1,"debug":[[{"filename":"","line":0}]],"name":"And","data":[11,0,0,0],"type":"resource"},{"count":1,"debug":[[{"filename":"","line":0}]],"name":"Integer Compare","data":[11,1,0,0],"type":"resource"},{"count":2,"debug":[[{"filename":"","line":0}]],"name":"Or","data":[11,1,0,0],"type":"resource"}],"type":"resource","data":[91,16,0,0]},{"replace_name":"true","debug":[[{"filename":"d:/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl","line":6}]],"name":"d:/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl:6","children":[{"count":10,"name":"Floating-point Add","debug":[[{"filename":"d","line":"/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl"}]],"type":"resource","data":[9950,7170,0,0]},{"count":2,"name":"Load","debug":[[{"filename":"d","line":"/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl"}]],"type":"resource","data":[1692,8212,42,0]},{"count":1,"name":"Store","debug":[[{"filename":"d","line":"/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl"}]],"type":"resource","data":[430,3412,16,0]}],"data":[12072,18794,58,0],"type":"resource"}],"data":[14381,20549,58,0],"details":[{"text":"Number of compute units: 1","type":"text"}],"compute_units":1}],"data":[23118,31372,78,0],"total_percent":[33.5122,21.0985,14.3157,15.1751,0],"total":[23118,31372,78,0],"debug_enabled":"true","columns":["","ALUTs","FFs","RAMs","DSPs","Details"],"type":"module"}';
var mavJSON='{"nodes":[{"type":"kernel", "id":2, "name":"vector_add", "children":[{"type":"bb", "id":3, "name":"vector_add.B0", "children":[{"type":"inst", "id":4, "name":"Load", "debug":[[{"filename":"d:/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl", "line":6}]], "details":[{"type":"table", "Width":"512 bits", "Type":"Burst-coalesced", "Stall-free":"No", "Loads from":"a", "Start Cycle":"2", "Latency":"1", "Reference":[{"type":"text", "text":"See %L for more information", "links":[{"guide":"Best Practices Guide : Load-Store Units", "link":"https://www.altera.com/documentation/mwh1391807516407.html#yeo1491314105959"}]}]}]}, {"type":"inst", "id":5, "name":"Load", "debug":[[{"filename":"d:/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl", "line":6}]], "details":[{"type":"table", "Width":"512 bits", "Type":"Burst-coalesced", "Stall-free":"No", "Loads from":"b", "Start Cycle":"2", "Latency":"1", "Reference":[{"type":"text", "text":"See %L for more information", "links":[{"guide":"Best Practices Guide : Load-Store Units", "link":"https://www.altera.com/documentation/mwh1391807516407.html#yeo1491314105959"}]}]}]}, {"type":"inst", "id":6, "name":"Store", "debug":[[{"filename":"d:/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl", "line":6}]], "details":[{"type":"table", "Width":"512 bits", "Type":"Burst-coalesced", "Stall-free":"No", "Stores to":"c", "Start Cycle":"21", "Latency":"1", "Reference":[{"type":"text", "text":"See %L for more information", "links":[{"guide":"Best Practices Guide : Load-Store Units", "link":"https://www.altera.com/documentation/mwh1391807516407.html#yeo1491314105959"}]}]}]}, {"type":"inst", "id":7, "name":"begin", "details":[{"type":"table", "Start Cycle":"0", "Latency":"1"}]}, {"type":"inst", "id":8, "name":"end", "details":[{"type":"table", "Start Cycle":"23", "Latency":"1"}]}], "details":[{"type":"table", "Latency":"23"}]}]}, {"type":"memtype", "id":1, "name":"Global Memory", "children":[{"type":"memsys", "id":9, "name":"Unknown name", "details":[{"type":"table", "Number of banks":"1"}]}]}], "links":[{"from":4, "to":8}, {"from":5, "to":8}, {"from":6, "to":8}, {"from":7, "to":4}, {"from":7, "to":5}, {"from":4, "to":6}, {"from":5, "to":6}, {"from":9, "to":4}, {"from":6, "to":9}, {"from":9, "to":5}]}';
var lmvJSON='{"nodes":[], "links":[]}';
var loopsJSON='{"columns":["", "Pipelined", "II", "Bottleneck", "Details"], "children":[{"name":"Kernel: vector_add", "data":["", "", ""], "debug":[[{"filename":"d:/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl", "line":4}]], "details":[{"type":"brief", "text":"Single work-item execution"}, {"type":"text", "text":"Single work-item execution"}, {"type":"text", "text":"See %L for more information", "links":[{"guide":"Best Practices Guide : Kernels", "link":"https://www.altera.com/documentation/mwh1391807516407.html#ipp1476408832230"}]}], "children":[{"name":"Fully unrolled loop", "data":["n/a", "n/a", "n/a"], "debug":[[{"filename":"d:/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl", "line":5}]], "details":[{"type":"brief", "text":"Auto-unrolled"}, {"type":"text", "text":"Auto-unrolled"}], "children":[]}]}]}';
var summaryJSON='{"performanceSummary":{"name":"Kernel Summary", "columns":["Kernel Name", "Kernel Type", "Autorun", "Workgroup Size", "# Compute Units"], "children":[{"name":"vector_add", "data":["Single work-item", "No", [1, 1, 1], 1], "details":[{"type":"text", "text":"Kernel type: Single work-item"}, {"type":"text", "text":"Required workgroup size: (1, 1, 1)"}, {"type":"text", "text":"Maximum workgroup size: 1"}], "debug":[[{"filename":"d:/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl", "line":4}]]}]}, "estimatedResources":{"name":"Estimated Resource Usage", "columns":["Kernel Name", "ALUTs ", "FFs  ", "RAMs ", "DSPs "], "children":[{"name":"vector_add", "data":[14381, 20549, 58, 0], "debug":[[{"filename":"d:/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl", "line":4}]]}, {"name":"Global Interconnect", "classes":["summary-highlight", "nohover"], "data":[6577, 8915, 0, 0]}, {"name":"Board Interface", "classes":["summary-highlight", "nohover"], "data":[2160, 1908, 20, 0]}, {"name":"Total", "classes":["summary-highlight", "nohover"], "data":[23118, 31372, 78, 0], "data_percent":[21.0985, 14.3157, 15.1751, 0]}, {"name":"Available", "classes":["summary-highlight", "nohover"], "data":[109572, 219144, 514, 112]}]}, "compileWarnings":{"name":"Compile Warnings", "children":[]}}';
var infoJSON='{"name":"Info","rows":[{"name":"Project Name","data":["vector_add"],"classes":["info-table"]},{"name":"Target Family, Device, Board","data":["Cyclone V, 5CSXFC6D6F31C8ES, de10_nano:de10_nano_sharedonly"]},{"name":"AOC Version","data":["18.1.0 Build 625"]},{"name":"Quartus Version","data":["18.1.0 Build 625"]},{"name":"Command","data":["aoc device\\\\vector_add.cl -o bin\\\\vector_add.aocx -board=de10_nano_sharedonly -v -report"]},{"name":"Reports Generated At", "data":["Tue Nov 24 20:30:00 2020"]}]}';
var warningsJSON='{"rows":[{"name":"Auto-unrolled loop at d:\\\\intelfpga\\\\18.1\\\\hld\\\\board\\\\terasic\\\\de10_nano\\\\test\\\\vectoradd...","details":["Compiler Warning: Auto-unrolled loop at d:\\\\intelfpga\\\\18.1\\\\hld\\\\board\\\\terasic\\\\de10_nano\\\\test\\\\vectoradd_emulator/d:/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl:5"]}]}';
var fileJSON=[{"path":"d:/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl", "name":"vector_add.cl", "has_active_debug_locs":true, "absName":"d:/intelfpga/18.1/hld/board/terasic/de10_nano/test/vectoradd_emulator/device/vector_add.cl", "content":"__kernel void vector_add(__global  float *restrict a, \012                         __global  float *restrict b, \012                         __global float *restrict c)\012{\012    for(int i=0;i<10;i++)\012        c[i]=a[i]+b[i];\012}\012\012"}];