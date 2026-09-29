import kan_core_pkg::*;
import layer_0_lut_pkg::*;
import layer_1_lut_pkg::*;

module kan_core (
    input  logic                                       i_clk   ,
    input  logic                                       i_rst_n ,
    input  logic                                       i_en    ,
    input  logic [IN_FEATURES  - 1:0][IN_WIDTH  - 1:0] i_vector,
    output logic [OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] o_vector
);
    // Signal declarations
    // Layer 0: 784 -> 64
    logic  [5:0] acts_0_0_242, acts_0_0_258, acts_0_0_270, acts_0_0_272, acts_0_0_323, acts_0_0_324, acts_0_0_329, acts_0_0_330, acts_0_0_349, acts_0_0_352, acts_0_0_353, acts_0_0_358, acts_0_0_380, acts_0_0_383, acts_0_0_384, acts_0_0_386;
    logic  [5:0] acts_0_0_411, acts_0_0_412, acts_0_0_438, acts_0_0_439, acts_0_0_493, acts_0_0_513, acts_0_0_576, acts_0_1_154, acts_0_1_155, acts_0_1_178, acts_0_1_218, acts_0_1_240, acts_0_1_272, acts_0_1_288, acts_0_1_293, acts_0_1_294;
    logic  [5:0] acts_0_1_296, acts_0_1_297, acts_0_1_298, acts_0_1_300, acts_0_1_301, acts_0_1_313, acts_0_1_321, acts_0_1_327, acts_0_1_345, acts_0_1_347, acts_0_1_348, acts_0_1_353, acts_0_1_354, acts_0_1_355, acts_0_1_370, acts_0_1_380;
    logic  [5:0] acts_0_1_381, acts_0_1_399, acts_0_1_408, acts_0_1_435, acts_0_1_461, acts_0_1_471, acts_0_1_497, acts_0_1_512, acts_0_1_526, acts_0_2_127, acts_0_2_148, acts_0_2_149, acts_0_2_202, acts_0_2_234, acts_0_2_235, acts_0_2_236;
    logic  [5:0] acts_0_2_258, acts_0_2_261, acts_0_2_262, acts_0_2_263, acts_0_2_264, acts_0_2_345, acts_0_2_369, acts_0_2_370, acts_0_2_397, acts_0_2_398, acts_0_2_417, acts_0_2_444, acts_0_2_469, acts_0_2_470, acts_0_2_498, acts_0_2_520;
    logic  [5:0] acts_0_2_525, acts_0_2_526, acts_0_2_553, acts_0_2_574, acts_0_2_671, acts_0_2_708, acts_0_3_98, acts_0_3_264, acts_0_3_289, acts_0_3_320, acts_0_3_321, acts_0_3_323, acts_0_3_324, acts_0_3_325, acts_0_3_380, acts_0_3_409;
    logic  [5:0] acts_0_3_437, acts_0_3_454, acts_0_3_455, acts_0_3_456, acts_0_3_465, acts_0_3_491, acts_0_3_492, acts_0_3_518, acts_0_3_519, acts_0_3_573, acts_0_3_574, acts_0_3_578, acts_0_3_595, acts_0_3_599, acts_0_3_601, acts_0_3_602;
    logic  [5:0] acts_0_3_603, acts_0_3_604, acts_0_3_605, acts_0_3_623, acts_0_3_624, acts_0_3_625, acts_0_3_626, acts_0_3_627, acts_0_3_628, acts_0_3_630, acts_0_3_631, acts_0_3_632, acts_0_3_633, acts_0_3_636, acts_0_3_655, acts_0_3_657;
    logic  [5:0] acts_0_3_659, acts_0_3_661, acts_0_3_662, acts_0_3_684, acts_0_3_685, acts_0_4_94, acts_0_4_122, acts_0_4_191, acts_0_4_214, acts_0_4_219, acts_0_4_377, acts_0_4_405, acts_0_4_416, acts_0_4_433, acts_0_4_473, acts_0_4_487;
    logic  [5:0] acts_0_4_522, acts_0_4_547, acts_0_4_548, acts_0_4_575, acts_0_4_627, acts_0_4_631, acts_0_4_632, acts_0_4_633, acts_0_4_634, acts_0_4_654, acts_0_4_656, acts_0_4_657, acts_0_4_658, acts_0_4_659, acts_0_4_660, acts_0_4_661;
    logic  [5:0] acts_0_4_662, acts_0_5_91, acts_0_5_123, acts_0_5_124, acts_0_5_149, acts_0_5_150, acts_0_5_153, acts_0_5_154, acts_0_5_155, acts_0_5_158, acts_0_5_179, acts_0_5_180, acts_0_5_181, acts_0_5_182, acts_0_5_184, acts_0_5_186;
    logic  [5:0] acts_0_5_248, acts_0_5_263, acts_0_5_264, acts_0_5_266, acts_0_5_275, acts_0_5_289, acts_0_5_290, acts_0_5_291, acts_0_5_294, acts_0_5_295, acts_0_5_300, acts_0_5_319, acts_0_5_345, acts_0_5_432, acts_0_5_456, acts_0_5_486;
    logic  [5:0] acts_0_5_488, acts_0_5_489, acts_0_5_544, acts_0_5_545, acts_0_5_568, acts_0_5_570, acts_0_5_571, acts_0_5_596, acts_0_5_597, acts_0_5_598, acts_0_5_606, acts_0_5_630, acts_0_5_654, acts_0_5_683, acts_0_6_21, acts_0_6_63;
    logic  [5:0] acts_0_6_97, acts_0_6_138, acts_0_6_161, acts_0_6_214, acts_0_6_324, acts_0_6_331, acts_0_6_363, acts_0_6_441, acts_0_6_466, acts_0_6_485, acts_0_6_512, acts_0_6_516, acts_0_6_542, acts_0_6_545, acts_0_6_556, acts_0_6_602;
    logic  [5:0] acts_0_6_610, acts_0_6_621, acts_0_6_664, acts_0_6_706, acts_0_7_98, acts_0_7_148, acts_0_7_149, acts_0_7_154, acts_0_7_155, acts_0_7_177, acts_0_7_178, acts_0_7_181, acts_0_7_182, acts_0_7_209, acts_0_7_210, acts_0_7_211;
    logic  [5:0] acts_0_7_234, acts_0_7_237, acts_0_7_238, acts_0_7_265, acts_0_7_266, acts_0_7_268, acts_0_7_292, acts_0_7_293, acts_0_7_320, acts_0_7_321, acts_0_7_342, acts_0_7_345, acts_0_7_347, acts_0_7_348, acts_0_7_349, acts_0_7_369;
    logic  [5:0] acts_0_7_371, acts_0_7_397, acts_0_7_493, acts_0_7_574, acts_0_7_600, acts_0_7_601, acts_0_7_661, acts_0_8_151, acts_0_8_177, acts_0_8_209, acts_0_8_266, acts_0_8_301, acts_0_8_318, acts_0_8_322, acts_0_8_327, acts_0_8_328;
    logic  [5:0] acts_0_8_345, acts_0_8_346, acts_0_8_347, acts_0_8_349, acts_0_8_350, acts_0_8_371, acts_0_8_377, acts_0_8_383, acts_0_8_405, acts_0_8_432, acts_0_8_433, acts_0_8_459, acts_0_8_460, acts_0_8_485, acts_0_8_486, acts_0_8_487;
    logic  [5:0] acts_0_8_488, acts_0_8_515, acts_0_8_516, acts_0_8_544, acts_0_8_545, acts_0_8_598, acts_0_9_156, acts_0_9_157, acts_0_9_177, acts_0_9_204, acts_0_9_231, acts_0_9_232, acts_0_9_244, acts_0_9_296, acts_0_9_324, acts_0_9_325;
    logic  [5:0] acts_0_9_345, acts_0_9_350, acts_0_9_351, acts_0_9_355, acts_0_9_357, acts_0_9_373, acts_0_9_382, acts_0_9_383, acts_0_9_408, acts_0_9_436, acts_0_9_456, acts_0_9_489, acts_0_9_492, acts_0_9_495, acts_0_9_539, acts_0_9_590;
    logic  [5:0] acts_0_9_630, acts_0_9_631, acts_0_9_658, acts_0_9_679, acts_0_9_732, acts_0_10_322, acts_0_10_351, acts_0_10_543, acts_0_11_155, acts_0_11_183, acts_0_11_184, acts_0_11_206, acts_0_11_210, acts_0_11_211, acts_0_11_235, acts_0_11_236;
    logic  [5:0] acts_0_11_238, acts_0_11_239, acts_0_11_263, acts_0_11_264, acts_0_11_266, acts_0_11_271, acts_0_11_289, acts_0_11_291, acts_0_11_294, acts_0_11_321, acts_0_11_322, acts_0_11_344, acts_0_11_345, acts_0_11_346, acts_0_11_347, acts_0_11_352;
    logic  [5:0] acts_0_11_371, acts_0_11_373, acts_0_11_376, acts_0_11_377, acts_0_11_400, acts_0_11_404, acts_0_11_461, acts_0_11_489, acts_0_11_496, acts_0_11_497, acts_0_11_657, acts_0_12_183, acts_0_12_205, acts_0_12_206, acts_0_12_232, acts_0_12_233;
    logic  [5:0] acts_0_12_235, acts_0_12_236, acts_0_12_264, acts_0_12_265, acts_0_12_269, acts_0_12_272, acts_0_12_288, acts_0_12_289, acts_0_12_290, acts_0_12_292, acts_0_12_293, acts_0_12_314, acts_0_12_315, acts_0_12_317, acts_0_12_318, acts_0_12_342;
    logic  [5:0] acts_0_12_344, acts_0_12_371, acts_0_12_372, acts_0_12_374, acts_0_12_378, acts_0_12_402, acts_0_12_429, acts_0_12_430, acts_0_12_435, acts_0_12_470, acts_0_12_511, acts_0_12_549, acts_0_12_580, acts_0_12_692, acts_0_12_693, acts_0_12_726;
    logic  [5:0] acts_0_13_178, acts_0_13_179, acts_0_13_180, acts_0_13_233, acts_0_13_260, acts_0_13_269, acts_0_13_286, acts_0_13_293, acts_0_13_297, acts_0_13_302, acts_0_13_314, acts_0_13_318, acts_0_13_325, acts_0_13_331, acts_0_13_374, acts_0_13_378;
    logic  [5:0] acts_0_13_405, acts_0_13_408, acts_0_13_429, acts_0_13_430, acts_0_13_436, acts_0_13_463, acts_0_13_464, acts_0_13_490, acts_0_13_491, acts_0_13_540, acts_0_13_577, acts_0_13_655, acts_0_13_732, acts_0_14_127, acts_0_14_128, acts_0_14_155;
    logic  [5:0] acts_0_14_158, acts_0_14_188, acts_0_14_377, acts_0_14_385, acts_0_14_386, acts_0_14_411, acts_0_14_412, acts_0_14_413, acts_0_14_414, acts_0_14_432, acts_0_14_435, acts_0_14_437, acts_0_14_438, acts_0_14_439, acts_0_14_440, acts_0_14_460;
    logic  [5:0] acts_0_14_462, acts_0_14_463, acts_0_14_465, acts_0_14_467, acts_0_14_469, acts_0_14_488, acts_0_14_490, acts_0_14_491, acts_0_14_492, acts_0_14_494, acts_0_14_495, acts_0_14_514, acts_0_14_515, acts_0_14_518, acts_0_14_519, acts_0_14_541;
    logic  [5:0] acts_0_14_542, acts_0_14_546, acts_0_14_554, acts_0_14_568, acts_0_14_569, acts_0_14_578, acts_0_14_579, acts_0_14_580, acts_0_14_582, acts_0_14_594, acts_0_14_595, acts_0_14_597, acts_0_14_602, acts_0_14_609, acts_0_14_639, acts_0_14_652;
    logic  [5:0] acts_0_14_654, acts_0_15_73, acts_0_15_96, acts_0_15_119, acts_0_15_148, acts_0_15_162, acts_0_15_212, acts_0_15_244, acts_0_15_248, acts_0_15_254, acts_0_15_300, acts_0_15_304, acts_0_15_314, acts_0_15_328, acts_0_15_370, acts_0_15_385;
    logic  [5:0] acts_0_15_414, acts_0_15_426, acts_0_15_452, acts_0_15_455, acts_0_15_457, acts_0_15_548, acts_0_15_610, acts_0_15_664, acts_0_15_679, acts_0_15_682, acts_0_15_691, acts_0_15_705, acts_0_15_714, acts_0_15_716, acts_0_15_717, acts_0_15_766;
    logic  [5:0] acts_0_16_12, acts_0_16_23, acts_0_16_29, acts_0_16_75, acts_0_16_80, acts_0_16_112, acts_0_16_117, acts_0_16_134, acts_0_16_135, acts_0_16_158, acts_0_16_203, acts_0_16_208, acts_0_16_256, acts_0_16_257, acts_0_16_271, acts_0_16_305;
    logic  [5:0] acts_0_16_312, acts_0_16_320, acts_0_16_328, acts_0_16_416, acts_0_16_443, acts_0_16_447, acts_0_16_458, acts_0_16_463, acts_0_16_501, acts_0_16_561, acts_0_16_584, acts_0_16_601, acts_0_16_608, acts_0_16_613, acts_0_16_636, acts_0_16_644;
    logic  [5:0] acts_0_16_669, acts_0_16_673, acts_0_16_690, acts_0_16_703, acts_0_16_714, acts_0_16_728, acts_0_16_737, acts_0_16_758, acts_0_16_767, acts_0_17_4, acts_0_17_12, acts_0_17_40, acts_0_17_41, acts_0_17_43, acts_0_17_52, acts_0_17_67;
    logic  [5:0] acts_0_17_142, acts_0_17_171, acts_0_17_199, acts_0_17_226, acts_0_17_249, acts_0_17_276, acts_0_17_280, acts_0_17_347, acts_0_17_354, acts_0_17_390, acts_0_17_421, acts_0_17_448, acts_0_17_485, acts_0_17_490, acts_0_17_505, acts_0_17_518;
    logic  [5:0] acts_0_17_529, acts_0_17_546, acts_0_17_583, acts_0_17_702, acts_0_17_703, acts_0_17_704, acts_0_17_715, acts_0_17_743, acts_0_17_770, acts_0_18_71, acts_0_18_131, acts_0_18_157, acts_0_18_158, acts_0_18_184, acts_0_18_238, acts_0_18_239;
    logic  [5:0] acts_0_18_240, acts_0_18_241, acts_0_18_242, acts_0_18_244, acts_0_18_245, acts_0_18_265, acts_0_18_267, acts_0_18_269, acts_0_18_270, acts_0_18_271, acts_0_18_322, acts_0_18_324, acts_0_18_325, acts_0_18_326, acts_0_18_353, acts_0_18_488;
    logic  [5:0] acts_0_18_489, acts_0_18_740, acts_0_19_245, acts_0_19_260, acts_0_19_321, acts_0_19_330, acts_0_19_359, acts_0_19_386, acts_0_19_387, acts_0_19_407, acts_0_19_411, acts_0_19_412, acts_0_19_414, acts_0_19_417, acts_0_19_428, acts_0_19_439;
    logic  [5:0] acts_0_19_461, acts_0_19_488, acts_0_19_489, acts_0_19_490, acts_0_19_493, acts_0_19_573, acts_0_19_574, acts_0_19_575, acts_0_19_595, acts_0_19_600, acts_0_19_601, acts_0_19_602, acts_0_19_625, acts_0_19_628, acts_0_19_629, acts_0_19_653;
    logic  [5:0] acts_0_19_655, acts_0_19_656, acts_0_19_657, acts_0_19_682, acts_0_19_751, acts_0_20_123, acts_0_20_124, acts_0_20_125, acts_0_20_127, acts_0_20_128, acts_0_20_158, acts_0_20_179, acts_0_20_180, acts_0_20_204, acts_0_20_206, acts_0_20_207;
    logic  [5:0] acts_0_20_208, acts_0_20_233, acts_0_20_235, acts_0_20_239, acts_0_20_240, acts_0_20_241, acts_0_20_259, acts_0_20_261, acts_0_20_272, acts_0_20_314, acts_0_20_320, acts_0_20_323, acts_0_20_327, acts_0_20_329, acts_0_20_344, acts_0_20_347;
    logic  [5:0] acts_0_20_348, acts_0_20_350, acts_0_20_405, acts_0_20_462, acts_0_20_516, acts_0_20_544, acts_0_20_593, acts_0_20_654, acts_0_20_732, acts_0_21_152, acts_0_21_180, acts_0_21_181, acts_0_21_208, acts_0_21_236, acts_0_21_239, acts_0_21_251;
    logic  [5:0] acts_0_21_264, acts_0_21_265, acts_0_21_292, acts_0_21_293, acts_0_21_298, acts_0_21_320, acts_0_21_404, acts_0_21_429, acts_0_21_430, acts_0_21_444, acts_0_21_472, acts_0_21_482, acts_0_21_483, acts_0_21_485, acts_0_21_567, acts_0_21_601;
    logic  [5:0] acts_0_21_682, acts_0_22_157, acts_0_22_158, acts_0_22_182, acts_0_22_185, acts_0_22_186, acts_0_22_209, acts_0_22_210, acts_0_22_213, acts_0_22_232, acts_0_22_237, acts_0_22_238, acts_0_22_240, acts_0_22_241, acts_0_22_265, acts_0_22_266;
    logic  [5:0] acts_0_22_268, acts_0_22_269, acts_0_22_291, acts_0_22_292, acts_0_22_293, acts_0_22_296, acts_0_22_319, acts_0_22_320, acts_0_22_324, acts_0_22_348, acts_0_22_351, acts_0_22_382, acts_0_22_397, acts_0_22_407, acts_0_22_433, acts_0_22_488;
    logic  [5:0] acts_0_22_634, acts_0_23_93, acts_0_23_117, acts_0_23_269, acts_0_23_297, acts_0_23_312, acts_0_23_324, acts_0_23_325, acts_0_23_326, acts_0_23_352, acts_0_23_355, acts_0_23_356, acts_0_23_381, acts_0_23_382, acts_0_23_383, acts_0_23_409;
    logic  [5:0] acts_0_23_410, acts_0_23_411, acts_0_23_436, acts_0_23_437, acts_0_23_438, acts_0_23_439, acts_0_23_461, acts_0_23_464, acts_0_23_465, acts_0_23_483, acts_0_23_491, acts_0_23_492, acts_0_23_493, acts_0_23_520, acts_0_23_539, acts_0_23_555;
    logic  [5:0] acts_0_23_564, acts_0_23_567, acts_0_23_568, acts_0_23_592, acts_0_23_647, acts_0_23_706, acts_0_23_721, acts_0_24_98, acts_0_24_127, acts_0_24_150, acts_0_24_177, acts_0_24_179, acts_0_24_181, acts_0_24_182, acts_0_24_206, acts_0_24_211;
    logic  [5:0] acts_0_24_235, acts_0_24_236, acts_0_24_237, acts_0_24_238, acts_0_24_291, acts_0_24_292, acts_0_24_318, acts_0_24_319, acts_0_24_320, acts_0_24_322, acts_0_24_343, acts_0_24_344, acts_0_24_345, acts_0_24_346, acts_0_24_347, acts_0_24_369;
    logic  [5:0] acts_0_24_370, acts_0_24_397, acts_0_24_428, acts_0_24_639, acts_0_25_127, acts_0_25_128, acts_0_25_177, acts_0_25_179, acts_0_25_206, acts_0_25_207, acts_0_25_208, acts_0_25_209, acts_0_25_210, acts_0_25_211, acts_0_25_212, acts_0_25_213;
    logic  [5:0] acts_0_25_236, acts_0_25_237, acts_0_25_238, acts_0_25_240, acts_0_25_291, acts_0_25_322, acts_0_25_463, acts_0_25_466, acts_0_25_492, acts_0_25_493, acts_0_25_518, acts_0_25_659, acts_0_25_679, acts_0_25_712, acts_0_26_163, acts_0_26_185;
    logic  [5:0] acts_0_26_190, acts_0_26_210, acts_0_26_211, acts_0_26_212, acts_0_26_213, acts_0_26_214, acts_0_26_215, acts_0_26_240, acts_0_26_267, acts_0_26_268, acts_0_26_269, acts_0_26_292, acts_0_26_295, acts_0_26_296, acts_0_26_297, acts_0_26_298;
    logic  [5:0] acts_0_26_299, acts_0_26_300, acts_0_26_301, acts_0_26_302, acts_0_26_303, acts_0_26_328, acts_0_26_330, acts_0_26_331, acts_0_26_408, acts_0_26_439, acts_0_26_571, acts_0_26_575, acts_0_27_42, acts_0_27_50, acts_0_27_56, acts_0_27_83;
    logic  [5:0] acts_0_27_212, acts_0_27_219, acts_0_27_223, acts_0_27_307, acts_0_27_310, acts_0_27_319, acts_0_27_323, acts_0_27_337, acts_0_27_339, acts_0_27_347, acts_0_27_356, acts_0_27_378, acts_0_27_390, acts_0_27_393, acts_0_27_416, acts_0_27_430;
    logic  [5:0] acts_0_27_436, acts_0_27_463, acts_0_27_464, acts_0_27_468, acts_0_27_491, acts_0_27_499, acts_0_27_508, acts_0_27_514, acts_0_27_537, acts_0_27_553, acts_0_27_578, acts_0_27_579, acts_0_27_591, acts_0_27_600, acts_0_27_622, acts_0_27_648;
    logic  [5:0] acts_0_27_691, acts_0_27_698, acts_0_27_705, acts_0_27_720, acts_0_27_748, acts_0_27_756, acts_0_27_776, acts_0_27_779, acts_0_28_2, acts_0_28_6, acts_0_28_17, acts_0_28_39, acts_0_28_42, acts_0_28_46, acts_0_28_83, acts_0_28_106;
    logic  [5:0] acts_0_28_110, acts_0_28_111, acts_0_28_112, acts_0_28_127, acts_0_28_137, acts_0_28_165, acts_0_28_167, acts_0_28_200, acts_0_28_262, acts_0_28_276, acts_0_28_277, acts_0_28_298, acts_0_28_310, acts_0_28_360, acts_0_28_361, acts_0_28_362;
    logic  [5:0] acts_0_28_410, acts_0_28_444, acts_0_28_449, acts_0_28_468, acts_0_28_477, acts_0_28_480, acts_0_28_497, acts_0_28_516, acts_0_28_532, acts_0_28_535, acts_0_28_546, acts_0_28_574, acts_0_28_575, acts_0_28_609, acts_0_28_618, acts_0_28_635;
    logic  [5:0] acts_0_28_636, acts_0_28_641, acts_0_28_643, acts_0_28_644, acts_0_28_650, acts_0_28_658, acts_0_28_659, acts_0_28_660, acts_0_28_661, acts_0_28_662, acts_0_28_677, acts_0_28_684, acts_0_28_685, acts_0_28_730, acts_0_28_747, acts_0_28_750;
    logic  [5:0] acts_0_28_752, acts_0_28_772, acts_0_28_778, acts_0_29_173, acts_0_29_183, acts_0_29_184, acts_0_29_211, acts_0_29_212, acts_0_29_215, acts_0_29_239, acts_0_29_266, acts_0_29_267, acts_0_29_333, acts_0_29_351, acts_0_29_380, acts_0_29_381;
    logic  [5:0] acts_0_29_410, acts_0_29_411, acts_0_29_432, acts_0_29_440, acts_0_29_460, acts_0_29_472, acts_0_29_473, acts_0_29_488, acts_0_29_500, acts_0_29_516, acts_0_29_544, acts_0_29_570, acts_0_29_571, acts_0_29_572, acts_0_29_628, acts_0_29_658;
    logic  [5:0] acts_0_29_679, acts_0_29_680, acts_0_30_127, acts_0_30_159, acts_0_30_161, acts_0_30_188, acts_0_30_203, acts_0_30_213, acts_0_30_230, acts_0_30_248, acts_0_30_259, acts_0_30_292, acts_0_30_293, acts_0_30_326, acts_0_30_376, acts_0_30_381;
    logic  [5:0] acts_0_30_383, acts_0_30_432, acts_0_30_435, acts_0_30_459, acts_0_30_486, acts_0_30_487, acts_0_30_489, acts_0_30_517, acts_0_30_542, acts_0_30_545, acts_0_30_546, acts_0_30_566, acts_0_30_568, acts_0_30_570, acts_0_30_573, acts_0_30_576;
    logic  [5:0] acts_0_30_578, acts_0_30_598, acts_0_30_627, acts_0_31_349, acts_0_31_376, acts_0_31_401, acts_0_31_404, acts_0_31_405, acts_0_31_407, acts_0_31_429, acts_0_31_430, acts_0_31_431, acts_0_31_433, acts_0_31_435, acts_0_31_481, acts_0_31_482;
    logic  [5:0] acts_0_31_483, acts_0_31_484, acts_0_31_511, acts_0_31_512, acts_0_31_513, acts_0_31_514, acts_0_31_515, acts_0_31_516, acts_0_31_522, acts_0_31_542, acts_0_31_544, acts_0_31_545, acts_0_31_546, acts_0_31_547, acts_0_31_595, acts_0_31_597;
    logic  [5:0] acts_0_31_604, acts_0_31_605, acts_0_31_622, acts_0_31_632, acts_0_31_654, acts_0_31_679, acts_0_31_708, acts_0_32_38, acts_0_32_125, acts_0_32_126, acts_0_32_152, acts_0_32_154, acts_0_32_155, acts_0_32_182, acts_0_32_183, acts_0_32_184;
    logic  [5:0] acts_0_32_185, acts_0_32_186, acts_0_32_212, acts_0_32_213, acts_0_32_214, acts_0_32_215, acts_0_32_237, acts_0_32_243, acts_0_32_245, acts_0_32_266, acts_0_32_271, acts_0_32_272, acts_0_32_296, acts_0_32_303, acts_0_32_322, acts_0_32_323;
    logic  [5:0] acts_0_32_349, acts_0_32_444, acts_0_32_467, acts_0_32_496, acts_0_32_523, acts_0_33_213, acts_0_33_347, acts_0_33_350, acts_0_33_370, acts_0_33_374, acts_0_33_376, acts_0_33_379, acts_0_33_410, acts_0_33_415, acts_0_33_416, acts_0_33_456;
    logic  [5:0] acts_0_33_464, acts_0_33_470, acts_0_33_471, acts_0_33_491, acts_0_33_496, acts_0_33_497, acts_0_33_524, acts_0_33_525, acts_0_33_552, acts_0_33_577, acts_0_33_580, acts_0_33_607, acts_0_33_634, acts_0_33_636, acts_0_33_662, acts_0_33_679;
    logic  [5:0] acts_0_33_683, acts_0_33_690, acts_0_33_691, acts_0_33_693, acts_0_34_130, acts_0_34_153, acts_0_34_185, acts_0_34_208, acts_0_34_210, acts_0_34_212, acts_0_34_214, acts_0_34_216, acts_0_34_321, acts_0_34_322, acts_0_34_347, acts_0_34_349;
    logic  [5:0] acts_0_34_351, acts_0_34_352, acts_0_34_375, acts_0_34_380, acts_0_34_401, acts_0_34_402, acts_0_34_405, acts_0_34_407, acts_0_34_408, acts_0_34_412, acts_0_34_435, acts_0_34_437, acts_0_34_463, acts_0_34_467, acts_0_34_490, acts_0_34_492;
    logic  [5:0] acts_0_34_494, acts_0_34_519, acts_0_34_521, acts_0_34_571, acts_0_34_572, acts_0_34_579, acts_0_34_580, acts_0_34_581, acts_0_34_598, acts_0_34_631, acts_0_34_634, acts_0_35_128, acts_0_35_131, acts_0_35_132, acts_0_35_158, acts_0_35_160;
    logic  [5:0] acts_0_35_189, acts_0_35_212, acts_0_35_216, acts_0_35_218, acts_0_35_235, acts_0_35_241, acts_0_35_245, acts_0_35_246, acts_0_35_268, acts_0_35_271, acts_0_35_273, acts_0_35_296, acts_0_35_301, acts_0_35_302, acts_0_35_322, acts_0_35_331;
    logic  [5:0] acts_0_35_350, acts_0_35_384, acts_0_36_276, acts_0_36_312, acts_0_36_450, acts_0_36_671, acts_0_37_2, acts_0_37_7, acts_0_37_15, acts_0_37_16, acts_0_37_17, acts_0_37_20, acts_0_37_25, acts_0_37_29, acts_0_37_31, acts_0_37_46;
    logic  [5:0] acts_0_37_55, acts_0_37_56, acts_0_37_59, acts_0_37_68, acts_0_37_77, acts_0_37_84, acts_0_37_85, acts_0_37_86, acts_0_37_87, acts_0_37_92, acts_0_37_116, acts_0_37_167, acts_0_37_193, acts_0_37_199, acts_0_37_211, acts_0_37_212;
    logic  [5:0] acts_0_37_222, acts_0_37_250, acts_0_37_251, acts_0_37_254, acts_0_37_278, acts_0_37_283, acts_0_37_309, acts_0_37_337, acts_0_37_361, acts_0_37_367, acts_0_37_388, acts_0_37_390, acts_0_37_428, acts_0_37_445, acts_0_37_447, acts_0_37_474;
    logic  [5:0] acts_0_37_475, acts_0_37_503, acts_0_37_506, acts_0_37_530, acts_0_37_533, acts_0_37_585, acts_0_37_592, acts_0_37_648, acts_0_37_662, acts_0_37_670, acts_0_37_671, acts_0_37_672, acts_0_37_676, acts_0_37_689, acts_0_37_696, acts_0_37_699;
    logic  [5:0] acts_0_37_706, acts_0_37_711, acts_0_37_719, acts_0_37_725, acts_0_37_729, acts_0_37_730, acts_0_37_738, acts_0_37_746, acts_0_37_753, acts_0_37_757, acts_0_37_759, acts_0_37_760, acts_0_37_762, acts_0_37_781, acts_0_37_783, acts_0_38_236;
    logic  [5:0] acts_0_38_247, acts_0_38_260, acts_0_38_262, acts_0_38_263, acts_0_38_265, acts_0_38_266, acts_0_38_282, acts_0_38_286, acts_0_38_287, acts_0_38_288, acts_0_38_289, acts_0_38_290, acts_0_38_291, acts_0_38_292, acts_0_38_293, acts_0_38_348;
    logic  [5:0] acts_0_38_349, acts_0_38_377, acts_0_38_396, acts_0_38_400, acts_0_38_404, acts_0_38_408, acts_0_38_426, acts_0_38_439, acts_0_38_454, acts_0_38_468, acts_0_38_576, acts_0_38_578, acts_0_38_623, acts_0_39_27, acts_0_39_92, acts_0_39_94;
    logic  [5:0] acts_0_39_139, acts_0_39_296, acts_0_39_313, acts_0_39_318, acts_0_39_364, acts_0_39_367, acts_0_39_394, acts_0_39_434, acts_0_39_435, acts_0_39_457, acts_0_39_564, acts_0_39_661, acts_0_39_671, acts_0_39_672, acts_0_39_690, acts_0_39_692;
    logic  [5:0] acts_0_39_724, acts_0_39_751, acts_0_40_123, acts_0_40_151, acts_0_40_212, acts_0_40_269, acts_0_40_325, acts_0_40_346, acts_0_40_347, acts_0_40_348, acts_0_40_350, acts_0_40_376, acts_0_40_378, acts_0_40_379, acts_0_40_398, acts_0_40_425;
    logic  [5:0] acts_0_40_427, acts_0_40_428, acts_0_40_429, acts_0_40_430, acts_0_40_431, acts_0_40_455, acts_0_40_456, acts_0_40_457, acts_0_40_458, acts_0_40_459, acts_0_40_460, acts_0_40_488, acts_0_40_489, acts_0_40_597, acts_0_41_213, acts_0_41_267;
    logic  [5:0] acts_0_41_430, acts_0_41_431, acts_0_41_457, acts_0_41_458, acts_0_41_485, acts_0_41_486, acts_0_41_512, acts_0_41_513, acts_0_41_539, acts_0_41_540, acts_0_41_541, acts_0_41_542, acts_0_41_544, acts_0_41_569, acts_0_41_572, acts_0_41_573;
    logic  [5:0] acts_0_41_574, acts_0_41_597, acts_0_41_600, acts_0_41_605, acts_0_41_626, acts_0_41_632, acts_0_42_156, acts_0_42_175, acts_0_42_178, acts_0_42_179, acts_0_42_185, acts_0_42_202, acts_0_42_203, acts_0_42_204, acts_0_42_206, acts_0_42_231;
    logic  [5:0] acts_0_42_232, acts_0_42_235, acts_0_42_236, acts_0_42_242, acts_0_42_263, acts_0_42_264, acts_0_42_269, acts_0_42_343, acts_0_42_370, acts_0_42_372, acts_0_42_378, acts_0_42_398, acts_0_42_399, acts_0_42_401, acts_0_42_426, acts_0_42_428;
    logic  [5:0] acts_0_42_431, acts_0_42_433, acts_0_42_455, acts_0_42_459, acts_0_42_486, acts_0_42_516, acts_0_42_517, acts_0_42_541, acts_0_42_549, acts_0_42_595, acts_0_42_600, acts_0_42_622, acts_0_42_623, acts_0_42_624, acts_0_42_626, acts_0_42_627;
    logic  [5:0] acts_0_42_629, acts_0_42_630, acts_0_42_651, acts_0_42_654, acts_0_42_655, acts_0_42_686, acts_0_43_104, acts_0_43_213, acts_0_43_267, acts_0_43_268, acts_0_43_322, acts_0_43_323, acts_0_43_324, acts_0_43_351, acts_0_43_353, acts_0_43_354;
    logic  [5:0] acts_0_43_378, acts_0_43_379, acts_0_43_406, acts_0_43_407, acts_0_43_412, acts_0_43_414, acts_0_43_415, acts_0_43_416, acts_0_43_433, acts_0_43_434, acts_0_43_440, acts_0_43_454, acts_0_43_463, acts_0_43_465, acts_0_43_467, acts_0_43_491;
    logic  [5:0] acts_0_43_517, acts_0_43_541, acts_0_43_542, acts_0_43_543, acts_0_43_654, acts_0_43_732, acts_0_44_68, acts_0_44_69, acts_0_44_107, acts_0_44_156, acts_0_44_157, acts_0_44_158, acts_0_44_171, acts_0_44_184, acts_0_44_186, acts_0_44_211;
    logic  [5:0] acts_0_44_296, acts_0_44_312, acts_0_44_317, acts_0_44_392, acts_0_44_416, acts_0_44_439, acts_0_44_457, acts_0_44_499, acts_0_44_516, acts_0_44_571, acts_0_44_581, acts_0_44_643, acts_0_44_692, acts_0_45_243, acts_0_45_247, acts_0_45_356;
    logic  [5:0] acts_0_45_380, acts_0_45_383, acts_0_45_409, acts_0_45_437, acts_0_45_438, acts_0_45_457, acts_0_45_460, acts_0_45_486, acts_0_45_491, acts_0_45_492, acts_0_45_493, acts_0_45_538, acts_0_45_539, acts_0_45_568, acts_0_45_593, acts_0_45_604;
    logic  [5:0] acts_0_45_625, acts_0_45_631, acts_0_45_654, acts_0_46_182, acts_0_46_183, acts_0_46_208, acts_0_46_209, acts_0_46_210, acts_0_46_235, acts_0_46_261, acts_0_46_262, acts_0_46_263, acts_0_46_325, acts_0_46_347, acts_0_46_348, acts_0_46_403;
    logic  [5:0] acts_0_46_405, acts_0_46_429, acts_0_46_431, acts_0_46_433, acts_0_46_462, acts_0_46_463, acts_0_46_492, acts_0_46_518, acts_0_46_539, acts_0_46_542, acts_0_46_545, acts_0_46_571, acts_0_46_572, acts_0_46_597, acts_0_46_717, acts_0_47_151;
    logic  [5:0] acts_0_47_182, acts_0_47_261, acts_0_47_295, acts_0_47_323, acts_0_47_324, acts_0_47_351, acts_0_47_374, acts_0_47_378, acts_0_47_380, acts_0_47_407, acts_0_47_462, acts_0_47_466, acts_0_47_468, acts_0_47_470, acts_0_47_489, acts_0_47_493;
    logic  [5:0] acts_0_47_494, acts_0_47_495, acts_0_47_516, acts_0_47_520, acts_0_47_521, acts_0_47_542, acts_0_47_547, acts_0_47_548, acts_0_47_581, acts_0_47_655, acts_0_48_214, acts_0_48_215, acts_0_48_216, acts_0_48_242, acts_0_48_243, acts_0_48_244;
    logic  [5:0] acts_0_48_246, acts_0_48_268, acts_0_48_269, acts_0_48_271, acts_0_48_272, acts_0_48_273, acts_0_48_274, acts_0_48_275, acts_0_48_294, acts_0_48_295, acts_0_48_296, acts_0_48_303, acts_0_48_355, acts_0_48_375, acts_0_48_380, acts_0_48_399;
    logic  [5:0] acts_0_48_403, acts_0_48_410, acts_0_48_414, acts_0_48_431, acts_0_48_437, acts_0_48_440, acts_0_48_465, acts_0_48_469, acts_0_48_489, acts_0_48_493, acts_0_48_566, acts_0_48_594, acts_0_48_634, acts_0_48_658, acts_0_48_659, acts_0_48_661;
    logic  [5:0] acts_0_48_662, acts_0_49_188, acts_0_49_214, acts_0_49_220, acts_0_49_248, acts_0_49_263, acts_0_49_264, acts_0_49_276, acts_0_49_303, acts_0_49_305, acts_0_49_346, acts_0_49_378, acts_0_49_379, acts_0_49_397, acts_0_49_398, acts_0_49_399;
    logic  [5:0] acts_0_49_408, acts_0_49_428, acts_0_49_429, acts_0_49_431, acts_0_49_455, acts_0_49_458, acts_0_49_459, acts_0_49_460, acts_0_49_485, acts_0_49_486, acts_0_49_488, acts_0_49_495, acts_0_49_497, acts_0_49_520, acts_0_49_522, acts_0_49_688;
    logic  [5:0] acts_0_49_689, acts_0_50_216, acts_0_50_217, acts_0_50_218, acts_0_50_219, acts_0_50_244, acts_0_50_263, acts_0_50_269, acts_0_50_270, acts_0_50_322, acts_0_50_328, acts_0_50_331, acts_0_50_350, acts_0_50_355, acts_0_50_356, acts_0_50_357;
    logic  [5:0] acts_0_50_358, acts_0_50_359, acts_0_50_378, acts_0_50_383, acts_0_50_433, acts_0_50_464, acts_0_50_491, acts_0_50_492, acts_0_50_497, acts_0_50_520, acts_0_50_523, acts_0_50_550, acts_0_50_633, acts_0_50_636, acts_0_51_47, acts_0_51_48;
    logic  [5:0] acts_0_51_122, acts_0_51_123, acts_0_51_124, acts_0_51_149, acts_0_51_150, acts_0_51_151, acts_0_51_152, acts_0_51_153, acts_0_51_178, acts_0_51_180, acts_0_51_181, acts_0_51_239, acts_0_51_261, acts_0_51_262, acts_0_51_263, acts_0_51_264;
    logic  [5:0] acts_0_51_269, acts_0_51_287, acts_0_51_289, acts_0_51_290, acts_0_51_291, acts_0_51_297, acts_0_51_298, acts_0_51_314, acts_0_51_315, acts_0_51_316, acts_0_51_333, acts_0_51_341, acts_0_51_342, acts_0_51_351, acts_0_51_364, acts_0_51_417;
    logic  [5:0] acts_0_51_527, acts_0_51_629, acts_0_51_651, acts_0_51_743, acts_0_52_153, acts_0_52_178, acts_0_52_180, acts_0_52_208, acts_0_52_236, acts_0_52_239, acts_0_52_241, acts_0_52_264, acts_0_52_267, acts_0_52_269, acts_0_52_270, acts_0_52_296;
    logic  [5:0] acts_0_52_298, acts_0_52_300, acts_0_52_312, acts_0_52_323, acts_0_52_326, acts_0_52_328, acts_0_52_352, acts_0_52_382, acts_0_52_462, acts_0_52_487, acts_0_52_509, acts_0_52_510, acts_0_52_519, acts_0_52_537, acts_0_52_538, acts_0_52_546;
    logic  [5:0] acts_0_52_547, acts_0_52_548, acts_0_52_555, acts_0_52_569, acts_0_52_575, acts_0_52_605, acts_0_52_606, acts_0_52_607, acts_0_52_708, acts_0_53_16, acts_0_53_45, acts_0_53_48, acts_0_53_51, acts_0_53_141, acts_0_53_146, acts_0_53_228;
    logic  [5:0] acts_0_53_251, acts_0_53_296, acts_0_53_325, acts_0_53_328, acts_0_53_358, acts_0_53_363, acts_0_53_397, acts_0_53_423, acts_0_53_449, acts_0_53_458, acts_0_53_460, acts_0_53_486, acts_0_53_487, acts_0_53_503, acts_0_53_516, acts_0_53_517;
    logic  [5:0] acts_0_53_531, acts_0_53_563, acts_0_53_592, acts_0_53_639, acts_0_53_756, acts_0_53_780, acts_0_53_782, acts_0_53_783, acts_0_54_41, acts_0_54_152, acts_0_54_191, acts_0_54_285, acts_0_54_322, acts_0_54_350, acts_0_54_353, acts_0_54_380;
    logic  [5:0] acts_0_54_407, acts_0_54_408, acts_0_54_426, acts_0_54_427, acts_0_54_454, acts_0_54_455, acts_0_54_456, acts_0_54_457, acts_0_54_483, acts_0_54_484, acts_0_54_485, acts_0_54_486, acts_0_54_487, acts_0_54_488, acts_0_54_507, acts_0_54_514;
    logic  [5:0] acts_0_54_515, acts_0_54_516, acts_0_54_567, acts_0_54_602, acts_0_54_604, acts_0_54_701, acts_0_55_126, acts_0_55_149, acts_0_55_155, acts_0_55_156, acts_0_55_175, acts_0_55_176, acts_0_55_207, acts_0_55_212, acts_0_55_242, acts_0_55_275;
    logic  [5:0] acts_0_55_315, acts_0_55_330, acts_0_55_342, acts_0_55_343, acts_0_55_345, acts_0_55_350, acts_0_55_354, acts_0_55_356, acts_0_55_369, acts_0_55_371, acts_0_55_373, acts_0_55_374, acts_0_55_377, acts_0_55_378, acts_0_55_406, acts_0_55_433;
    logic  [5:0] acts_0_55_434, acts_0_55_466, acts_0_55_467, acts_0_55_469, acts_0_55_495, acts_0_55_498, acts_0_55_519, acts_0_55_525, acts_0_55_544, acts_0_55_566, acts_0_55_575, acts_0_55_576, acts_0_55_628, acts_0_55_633, acts_0_55_656, acts_0_56_348;
    logic  [5:0] acts_0_56_457, acts_0_56_458, acts_0_56_460, acts_0_56_462, acts_0_56_489, acts_0_56_509, acts_0_56_537, acts_0_56_538, acts_0_56_539, acts_0_56_540, acts_0_56_541, acts_0_56_546, acts_0_56_570, acts_0_56_571, acts_0_56_572, acts_0_56_578;
    logic  [5:0] acts_0_56_597, acts_0_56_600, acts_0_56_682, acts_0_56_684, acts_0_56_709, acts_0_56_711, acts_0_56_712, acts_0_57_101, acts_0_57_129, acts_0_57_130, acts_0_57_157, acts_0_57_158, acts_0_57_160, acts_0_57_175, acts_0_57_243, acts_0_57_261;
    logic  [5:0] acts_0_57_321, acts_0_57_322, acts_0_57_344, acts_0_57_349, acts_0_57_430, acts_0_57_467, acts_0_57_482, acts_0_57_483, acts_0_57_493, acts_0_57_495, acts_0_57_509, acts_0_57_510, acts_0_57_511, acts_0_57_520, acts_0_57_521, acts_0_57_522;
    logic  [5:0] acts_0_57_523, acts_0_57_537, acts_0_57_538, acts_0_57_547, acts_0_57_549, acts_0_57_627, acts_0_57_628, acts_0_57_629, acts_0_57_666, acts_0_57_685, acts_0_57_686, acts_0_57_687, acts_0_58_159, acts_0_58_182, acts_0_58_183, acts_0_58_184;
    logic  [5:0] acts_0_58_187, acts_0_58_188, acts_0_58_211, acts_0_58_215, acts_0_58_216, acts_0_58_239, acts_0_58_242, acts_0_58_248, acts_0_58_266, acts_0_58_267, acts_0_58_270, acts_0_58_271, acts_0_58_276, acts_0_58_297, acts_0_58_298, acts_0_58_299;
    logic  [5:0] acts_0_58_321, acts_0_58_325, acts_0_58_326, acts_0_58_350, acts_0_58_410, acts_0_58_486, acts_0_59_266, acts_0_59_294, acts_0_59_295, acts_0_59_296, acts_0_59_353, acts_0_59_356, acts_0_59_380, acts_0_59_381, acts_0_59_397, acts_0_59_398;
    logic  [5:0] acts_0_59_399, acts_0_59_400, acts_0_59_403, acts_0_59_404, acts_0_59_405, acts_0_59_410, acts_0_59_425, acts_0_59_427, acts_0_59_428, acts_0_59_429, acts_0_59_439, acts_0_59_440, acts_0_59_461, acts_0_59_467, acts_0_59_487, acts_0_59_489;
    logic  [5:0] acts_0_59_516, acts_0_59_518, acts_0_59_520, acts_0_59_541, acts_0_59_543, acts_0_59_544, acts_0_59_545, acts_0_59_568, acts_0_59_571, acts_0_59_574, acts_0_59_597, acts_0_59_621, acts_0_59_623, acts_0_59_625, acts_0_60_185, acts_0_60_239;
    logic  [5:0] acts_0_60_269, acts_0_60_290, acts_0_60_348, acts_0_60_349, acts_0_60_374, acts_0_60_375, acts_0_60_376, acts_0_60_397, acts_0_60_400, acts_0_60_401, acts_0_60_402, acts_0_60_425, acts_0_60_427, acts_0_60_428, acts_0_60_433, acts_0_60_453;
    logic  [5:0] acts_0_60_517, acts_0_60_714, acts_0_60_717, acts_0_61_209, acts_0_61_234, acts_0_61_266, acts_0_61_293, acts_0_61_295, acts_0_61_323, acts_0_61_352, acts_0_61_353, acts_0_61_376, acts_0_61_382, acts_0_61_405, acts_0_61_413, acts_0_61_414;
    logic  [5:0] acts_0_61_433, acts_0_61_434, acts_0_61_435, acts_0_61_436, acts_0_61_460, acts_0_61_462, acts_0_61_463, acts_0_61_544, acts_0_61_555, acts_0_61_574, acts_0_61_583, acts_0_61_608, acts_0_61_636, acts_0_61_637, acts_0_61_688, acts_0_61_691;
    logic  [5:0] acts_0_62_109, acts_0_62_143, acts_0_62_288, acts_0_62_294, acts_0_62_374, acts_0_62_375, acts_0_62_403, acts_0_62_407, acts_0_62_408, acts_0_62_432, acts_0_62_433, acts_0_62_445, acts_0_63_125, acts_0_63_214, acts_0_63_243, acts_0_63_268;
    logic  [5:0] acts_0_63_271, acts_0_63_272, acts_0_63_297, acts_0_63_300, acts_0_63_301, acts_0_63_325, acts_0_63_331, acts_0_63_354, acts_0_63_357, acts_0_63_359, acts_0_63_381, acts_0_63_403, acts_0_63_408, acts_0_63_435, acts_0_63_436, acts_0_63_439;
    logic  [5:0] acts_0_63_440, acts_0_63_441, acts_0_63_457, acts_0_63_460, acts_0_63_461, acts_0_63_462, acts_0_63_483, acts_0_63_485, acts_0_63_486, acts_0_63_487, acts_0_63_488, acts_0_63_514, acts_0_63_515, acts_0_63_539, acts_0_63_540, acts_0_63_627;
    logic  [5:0] acts_0_63_651;
    logic  [5:0] out_0_0_sat, out_0_1_sat, out_0_2_sat, out_0_3_sat, out_0_4_sat, out_0_5_sat, out_0_6_sat, out_0_7_sat, out_0_8_sat, out_0_9_sat, out_0_10_sat, out_0_11_sat, out_0_12_sat, out_0_13_sat, out_0_14_sat, out_0_15_sat;
    logic  [5:0] out_0_16_sat, out_0_17_sat, out_0_18_sat, out_0_19_sat, out_0_20_sat, out_0_21_sat, out_0_22_sat, out_0_23_sat, out_0_24_sat, out_0_25_sat, out_0_26_sat, out_0_27_sat, out_0_28_sat, out_0_29_sat, out_0_30_sat, out_0_31_sat;
    logic  [5:0] out_0_32_sat, out_0_33_sat, out_0_34_sat, out_0_35_sat, out_0_36_sat, out_0_37_sat, out_0_38_sat, out_0_39_sat, out_0_40_sat, out_0_41_sat, out_0_42_sat, out_0_43_sat, out_0_44_sat, out_0_45_sat, out_0_46_sat, out_0_47_sat;
    logic  [5:0] out_0_48_sat, out_0_49_sat, out_0_50_sat, out_0_51_sat, out_0_52_sat, out_0_53_sat, out_0_54_sat, out_0_55_sat, out_0_56_sat, out_0_57_sat, out_0_58_sat, out_0_59_sat, out_0_60_sat, out_0_61_sat, out_0_62_sat, out_0_63_sat;
    logic  [5:0] out_0_0_reg, out_0_1_reg, out_0_2_reg, out_0_3_reg, out_0_4_reg, out_0_5_reg, out_0_6_reg, out_0_7_reg, out_0_8_reg, out_0_9_reg, out_0_10_reg, out_0_11_reg, out_0_12_reg, out_0_13_reg, out_0_14_reg, out_0_15_reg;
    logic  [5:0] out_0_16_reg, out_0_17_reg, out_0_18_reg, out_0_19_reg, out_0_20_reg, out_0_21_reg, out_0_22_reg, out_0_23_reg, out_0_24_reg, out_0_25_reg, out_0_26_reg, out_0_27_reg, out_0_28_reg, out_0_29_reg, out_0_30_reg, out_0_31_reg;
    logic  [5:0] out_0_32_reg, out_0_33_reg, out_0_34_reg, out_0_35_reg, out_0_36_reg, out_0_37_reg, out_0_38_reg, out_0_39_reg, out_0_40_reg, out_0_41_reg, out_0_42_reg, out_0_43_reg, out_0_44_reg, out_0_45_reg, out_0_46_reg, out_0_47_reg;
    logic  [5:0] out_0_48_reg, out_0_49_reg, out_0_50_reg, out_0_51_reg, out_0_52_reg, out_0_53_reg, out_0_54_reg, out_0_55_reg, out_0_56_reg, out_0_57_reg, out_0_58_reg, out_0_59_reg, out_0_60_reg, out_0_61_reg, out_0_62_reg, out_0_63_reg;

// Layer 1: 64 -> 10
    logic  [5:0] acts_1_0_0, acts_1_0_1, acts_1_0_2, acts_1_0_3, acts_1_0_5, acts_1_0_6, acts_1_0_8, acts_1_0_10, acts_1_0_11, acts_1_0_12, acts_1_0_14, acts_1_0_16, acts_1_0_17, acts_1_0_18, acts_1_0_19, acts_1_0_20;
    logic  [5:0] acts_1_0_23, acts_1_0_24, acts_1_0_25, acts_1_0_26, acts_1_0_27, acts_1_0_28, acts_1_0_29, acts_1_0_30, acts_1_0_31, acts_1_0_32, acts_1_0_33, acts_1_0_34, acts_1_0_38, acts_1_0_39, acts_1_0_40, acts_1_0_41;
    logic  [5:0] acts_1_0_42, acts_1_0_43, acts_1_0_45, acts_1_0_49, acts_1_0_50, acts_1_0_51, acts_1_0_53, acts_1_0_54, acts_1_0_55, acts_1_0_56, acts_1_0_57, acts_1_0_58, acts_1_0_59, acts_1_0_60, acts_1_0_61, acts_1_0_62;
    logic  [5:0] acts_1_0_63, acts_1_1_0, acts_1_1_1, acts_1_1_3, acts_1_1_4, acts_1_1_5, acts_1_1_6, acts_1_1_7, acts_1_1_8, acts_1_1_9, acts_1_1_11, acts_1_1_12, acts_1_1_17, acts_1_1_18, acts_1_1_19, acts_1_1_20;
    logic  [5:0] acts_1_1_21, acts_1_1_22, acts_1_1_24, acts_1_1_25, acts_1_1_27, acts_1_1_28, acts_1_1_29, acts_1_1_30, acts_1_1_31, acts_1_1_32, acts_1_1_33, acts_1_1_34, acts_1_1_35, acts_1_1_37, acts_1_1_40, acts_1_1_41;
    logic  [5:0] acts_1_1_42, acts_1_1_43, acts_1_1_45, acts_1_1_47, acts_1_1_48, acts_1_1_49, acts_1_1_50, acts_1_1_51, acts_1_1_52, acts_1_1_53, acts_1_1_54, acts_1_1_55, acts_1_1_56, acts_1_1_57, acts_1_1_58, acts_1_1_59;
    logic  [5:0] acts_1_1_62, acts_1_1_63, acts_1_2_0, acts_1_2_1, acts_1_2_2, acts_1_2_3, acts_1_2_4, acts_1_2_5, acts_1_2_6, acts_1_2_8, acts_1_2_9, acts_1_2_10, acts_1_2_11, acts_1_2_12, acts_1_2_14, acts_1_2_15;
    logic  [5:0] acts_1_2_16, acts_1_2_19, acts_1_2_20, acts_1_2_21, acts_1_2_24, acts_1_2_26, acts_1_2_27, acts_1_2_29, acts_1_2_31, acts_1_2_32, acts_1_2_33, acts_1_2_34, acts_1_2_35, acts_1_2_38, acts_1_2_39, acts_1_2_41;
    logic  [5:0] acts_1_2_43, acts_1_2_45, acts_1_2_46, acts_1_2_48, acts_1_2_50, acts_1_2_51, acts_1_2_52, acts_1_2_53, acts_1_2_54, acts_1_2_55, acts_1_2_56, acts_1_2_57, acts_1_2_59, acts_1_2_60, acts_1_2_61, acts_1_2_62;
    logic  [5:0] acts_1_3_0, acts_1_3_1, acts_1_3_2, acts_1_3_3, acts_1_3_5, acts_1_3_6, acts_1_3_7, acts_1_3_9, acts_1_3_11, acts_1_3_12, acts_1_3_13, acts_1_3_14, acts_1_3_16, acts_1_3_17, acts_1_3_19, acts_1_3_20;
    logic  [5:0] acts_1_3_21, acts_1_3_22, acts_1_3_23, acts_1_3_24, acts_1_3_25, acts_1_3_28, acts_1_3_29, acts_1_3_30, acts_1_3_31, acts_1_3_32, acts_1_3_34, acts_1_3_35, acts_1_3_38, acts_1_3_40, acts_1_3_41, acts_1_3_42;
    logic  [5:0] acts_1_3_43, acts_1_3_46, acts_1_3_47, acts_1_3_49, acts_1_3_50, acts_1_3_51, acts_1_3_52, acts_1_3_54, acts_1_3_55, acts_1_3_56, acts_1_3_57, acts_1_3_58, acts_1_3_59, acts_1_3_60, acts_1_3_61, acts_1_3_63;
    logic  [5:0] acts_1_4_3, acts_1_4_4, acts_1_4_5, acts_1_4_6, acts_1_4_7, acts_1_4_8, acts_1_4_9, acts_1_4_11, acts_1_4_12, acts_1_4_14, acts_1_4_15, acts_1_4_16, acts_1_4_17, acts_1_4_18, acts_1_4_20, acts_1_4_21;
    logic  [5:0] acts_1_4_22, acts_1_4_23, acts_1_4_24, acts_1_4_25, acts_1_4_26, acts_1_4_28, acts_1_4_30, acts_1_4_31, acts_1_4_32, acts_1_4_35, acts_1_4_38, acts_1_4_39, acts_1_4_42, acts_1_4_44, acts_1_4_45, acts_1_4_46;
    logic  [5:0] acts_1_4_47, acts_1_4_48, acts_1_4_49, acts_1_4_50, acts_1_4_54, acts_1_4_56, acts_1_4_57, acts_1_4_58, acts_1_4_59, acts_1_4_60, acts_1_4_61, acts_1_4_62, acts_1_4_63, acts_1_5_0, acts_1_5_1, acts_1_5_2;
    logic  [5:0] acts_1_5_3, acts_1_5_4, acts_1_5_5, acts_1_5_6, acts_1_5_8, acts_1_5_9, acts_1_5_11, acts_1_5_12, acts_1_5_13, acts_1_5_14, acts_1_5_15, acts_1_5_16, acts_1_5_18, acts_1_5_19, acts_1_5_21, acts_1_5_22;
    logic  [5:0] acts_1_5_23, acts_1_5_24, acts_1_5_25, acts_1_5_26, acts_1_5_28, acts_1_5_29, acts_1_5_30, acts_1_5_31, acts_1_5_32, acts_1_5_33, acts_1_5_35, acts_1_5_40, acts_1_5_41, acts_1_5_42, acts_1_5_43, acts_1_5_45;
    logic  [5:0] acts_1_5_46, acts_1_5_47, acts_1_5_49, acts_1_5_50, acts_1_5_51, acts_1_5_52, acts_1_5_53, acts_1_5_54, acts_1_5_55, acts_1_5_56, acts_1_5_57, acts_1_5_58, acts_1_5_59, acts_1_5_62, acts_1_5_63, acts_1_6_0;
    logic  [5:0] acts_1_6_1, acts_1_6_2, acts_1_6_3, acts_1_6_4, acts_1_6_5, acts_1_6_6, acts_1_6_7, acts_1_6_8, acts_1_6_10, acts_1_6_11, acts_1_6_13, acts_1_6_14, acts_1_6_16, acts_1_6_17, acts_1_6_18, acts_1_6_19;
    logic  [5:0] acts_1_6_20, acts_1_6_21, acts_1_6_23, acts_1_6_24, acts_1_6_25, acts_1_6_26, acts_1_6_28, acts_1_6_29, acts_1_6_30, acts_1_6_31, acts_1_6_32, acts_1_6_33, acts_1_6_35, acts_1_6_37, acts_1_6_39, acts_1_6_40;
    logic  [5:0] acts_1_6_42, acts_1_6_43, acts_1_6_44, acts_1_6_45, acts_1_6_46, acts_1_6_47, acts_1_6_48, acts_1_6_49, acts_1_6_50, acts_1_6_51, acts_1_6_52, acts_1_6_54, acts_1_6_55, acts_1_6_56, acts_1_6_57, acts_1_6_58;
    logic  [5:0] acts_1_6_60, acts_1_6_61, acts_1_7_0, acts_1_7_1, acts_1_7_2, acts_1_7_3, acts_1_7_4, acts_1_7_5, acts_1_7_7, acts_1_7_8, acts_1_7_9, acts_1_7_10, acts_1_7_13, acts_1_7_14, acts_1_7_15, acts_1_7_16;
    logic  [5:0] acts_1_7_17, acts_1_7_18, acts_1_7_20, acts_1_7_21, acts_1_7_22, acts_1_7_24, acts_1_7_25, acts_1_7_26, acts_1_7_28, acts_1_7_29, acts_1_7_30, acts_1_7_31, acts_1_7_32, acts_1_7_33, acts_1_7_37, acts_1_7_40;
    logic  [5:0] acts_1_7_42, acts_1_7_43, acts_1_7_44, acts_1_7_46, acts_1_7_47, acts_1_7_49, acts_1_7_50, acts_1_7_51, acts_1_7_52, acts_1_7_55, acts_1_7_56, acts_1_7_57, acts_1_7_58, acts_1_7_59, acts_1_7_60, acts_1_7_61;
    logic  [5:0] acts_1_7_62, acts_1_7_63, acts_1_8_1, acts_1_8_3, acts_1_8_5, acts_1_8_6, acts_1_8_7, acts_1_8_8, acts_1_8_9, acts_1_8_11, acts_1_8_12, acts_1_8_13, acts_1_8_16, acts_1_8_19, acts_1_8_22, acts_1_8_23;
    logic  [5:0] acts_1_8_24, acts_1_8_26, acts_1_8_27, acts_1_8_28, acts_1_8_29, acts_1_8_30, acts_1_8_31, acts_1_8_32, acts_1_8_34, acts_1_8_35, acts_1_8_38, acts_1_8_41, acts_1_8_42, acts_1_8_43, acts_1_8_44, acts_1_8_45;
    logic  [5:0] acts_1_8_46, acts_1_8_47, acts_1_8_48, acts_1_8_49, acts_1_8_50, acts_1_8_52, acts_1_8_53, acts_1_8_54, acts_1_8_56, acts_1_8_58, acts_1_8_59, acts_1_8_60, acts_1_8_61, acts_1_9_0, acts_1_9_1, acts_1_9_2;
    logic  [5:0] acts_1_9_3, acts_1_9_4, acts_1_9_5, acts_1_9_6, acts_1_9_7, acts_1_9_8, acts_1_9_9, acts_1_9_10, acts_1_9_11, acts_1_9_12, acts_1_9_13, acts_1_9_15, acts_1_9_17, acts_1_9_18, acts_1_9_20, acts_1_9_21;
    logic  [5:0] acts_1_9_22, acts_1_9_23, acts_1_9_24, acts_1_9_25, acts_1_9_28, acts_1_9_29, acts_1_9_30, acts_1_9_31, acts_1_9_32, acts_1_9_33, acts_1_9_34, acts_1_9_35, acts_1_9_36, acts_1_9_37, acts_1_9_38, acts_1_9_39;
    logic  [5:0] acts_1_9_40, acts_1_9_41, acts_1_9_42, acts_1_9_43, acts_1_9_44, acts_1_9_45, acts_1_9_46, acts_1_9_49, acts_1_9_50, acts_1_9_52, acts_1_9_53, acts_1_9_54, acts_1_9_55, acts_1_9_58, acts_1_9_59, acts_1_9_60;
    logic  [5:0] acts_1_9_61, acts_1_9_62;

    // Auto layer blocks
        // Layer 0, Node 0
      logic  [11:0] s_0_0_3_0;
    logic  [11:0] s_0_0_3_0_reg;
    logic  [7:0] s_0_0_1_0, s_0_0_1_1, s_0_0_1_2, s_0_0_1_3, s_0_0_1_4, s_0_0_1_5;
    logic  [7:0] s_0_0_1_0_reg, s_0_0_1_1_reg, s_0_0_1_2_reg, s_0_0_1_3_reg, s_0_0_1_4_reg, s_0_0_1_5_reg;
    logic  [9:0] s_0_0_2_0, s_0_0_2_1;
    logic  [9:0] s_0_0_2_0_reg, s_0_0_2_1_reg;
    logic [13:0] sum_0_0;
    logic [13:0] sum_0_0_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_242)) 
    rom_0_0_242 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[242]), .o_ld_data(acts_0_0_242));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_258)) 
    rom_0_0_258 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[258]), .o_ld_data(acts_0_0_258));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_270)) 
    rom_0_0_270 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[270]), .o_ld_data(acts_0_0_270));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_272)) 
    rom_0_0_272 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[272]), .o_ld_data(acts_0_0_272));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_323)) 
    rom_0_0_323 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[323]), .o_ld_data(acts_0_0_323));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_324)) 
    rom_0_0_324 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[324]), .o_ld_data(acts_0_0_324));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_329)) 
    rom_0_0_329 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[329]), .o_ld_data(acts_0_0_329));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_330)) 
    rom_0_0_330 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[330]), .o_ld_data(acts_0_0_330));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_349)) 
    rom_0_0_349 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[349]), .o_ld_data(acts_0_0_349));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_352)) 
    rom_0_0_352 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[352]), .o_ld_data(acts_0_0_352));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_353)) 
    rom_0_0_353 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[353]), .o_ld_data(acts_0_0_353));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_358)) 
    rom_0_0_358 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[358]), .o_ld_data(acts_0_0_358));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_380)) 
    rom_0_0_380 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[380]), .o_ld_data(acts_0_0_380));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_383)) 
    rom_0_0_383 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[383]), .o_ld_data(acts_0_0_383));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_384)) 
    rom_0_0_384 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[384]), .o_ld_data(acts_0_0_384));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_386)) 
    rom_0_0_386 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[386]), .o_ld_data(acts_0_0_386));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_411)) 
    rom_0_0_411 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[411]), .o_ld_data(acts_0_0_411));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_412)) 
    rom_0_0_412 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[412]), .o_ld_data(acts_0_0_412));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_438)) 
    rom_0_0_438 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[438]), .o_ld_data(acts_0_0_438));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_439)) 
    rom_0_0_439 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[439]), .o_ld_data(acts_0_0_439));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_493)) 
    rom_0_0_493 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[493]), .o_ld_data(acts_0_0_493));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_513)) 
    rom_0_0_513 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[513]), .o_ld_data(acts_0_0_513));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_0_576)) 
    rom_0_0_576 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[576]), .o_ld_data(acts_0_0_576));

  // Stage 1
    assign s_0_0_1_0 = {{2{acts_0_0_242[5]}}, acts_0_0_242} + {{2{acts_0_0_258[5]}}, acts_0_0_258} + {{2{acts_0_0_270[5]}}, acts_0_0_270} + {{2{acts_0_0_272[5]}}, acts_0_0_272};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_0), .q(s_0_0_1_0_reg));

    assign s_0_0_1_1 = {{2{acts_0_0_323[5]}}, acts_0_0_323} + {{2{acts_0_0_324[5]}}, acts_0_0_324} + {{2{acts_0_0_329[5]}}, acts_0_0_329} + {{2{acts_0_0_330[5]}}, acts_0_0_330};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_1), .q(s_0_0_1_1_reg));

    assign s_0_0_1_2 = {{2{acts_0_0_349[5]}}, acts_0_0_349} + {{2{acts_0_0_352[5]}}, acts_0_0_352} + {{2{acts_0_0_353[5]}}, acts_0_0_353} + {{2{acts_0_0_358[5]}}, acts_0_0_358};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_2), .q(s_0_0_1_2_reg));

    assign s_0_0_1_3 = {{2{acts_0_0_380[5]}}, acts_0_0_380} + {{2{acts_0_0_383[5]}}, acts_0_0_383} + {{2{acts_0_0_384[5]}}, acts_0_0_384} + {{2{acts_0_0_386[5]}}, acts_0_0_386};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_3), .q(s_0_0_1_3_reg));

    assign s_0_0_1_4 = {{2{acts_0_0_411[5]}}, acts_0_0_411} + {{2{acts_0_0_412[5]}}, acts_0_0_412} + {{2{acts_0_0_438[5]}}, acts_0_0_438} + {{2{acts_0_0_439[5]}}, acts_0_0_439};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_4), .q(s_0_0_1_4_reg));

    assign s_0_0_1_5 = {{2{acts_0_0_493[5]}}, acts_0_0_493} + {{2{acts_0_0_513[5]}}, acts_0_0_513} + {{2{acts_0_0_576[5]}}, acts_0_0_576};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_5), .q(s_0_0_1_5_reg));

  // Stage 2
    assign s_0_0_2_0 = {{2{s_0_0_1_0_reg[7]}}, s_0_0_1_0_reg} + {{2{s_0_0_1_1_reg[7]}}, s_0_0_1_1_reg} + {{2{s_0_0_1_2_reg[7]}}, s_0_0_1_2_reg} + {{2{s_0_0_1_3_reg[7]}}, s_0_0_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_0_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_2_0), .q(s_0_0_2_0_reg));

    assign s_0_0_2_1 = {{2{s_0_0_1_4_reg[7]}}, s_0_0_1_4_reg} + {{2{s_0_0_1_5_reg[7]}}, s_0_0_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_0_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_2_1), .q(s_0_0_2_1_reg));

  // Stage 3
    assign s_0_0_3_0 = {{2{s_0_0_2_0_reg[9]}}, s_0_0_2_0_reg} + {{2{s_0_0_2_1_reg[9]}}, s_0_0_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_0_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_3_0), .q(s_0_0_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_0_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_0_3_0_reg[11]}}, s_0_0_3_0_reg}), .q(sum_0_0_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_0 (.i_data(sum_0_0_reg), .o_data(out_0_0_sat));


    // Layer 0, Node 1
      logic  [11:0] s_0_1_3_0;
    logic  [11:0] s_0_1_3_0_reg;
    logic  [7:0] s_0_1_1_0, s_0_1_1_1, s_0_1_1_2, s_0_1_1_3, s_0_1_1_4, s_0_1_1_5, s_0_1_1_6, s_0_1_1_7, s_0_1_1_8;
    logic  [7:0] s_0_1_1_0_reg, s_0_1_1_1_reg, s_0_1_1_2_reg, s_0_1_1_3_reg, s_0_1_1_4_reg, s_0_1_1_5_reg, s_0_1_1_6_reg, s_0_1_1_7_reg, s_0_1_1_8_reg;
    logic  [9:0] s_0_1_2_0, s_0_1_2_1, s_0_1_2_2;
    logic  [9:0] s_0_1_2_0_reg, s_0_1_2_1_reg, s_0_1_2_2_reg;
    logic [13:0] sum_0_1;
    logic [13:0] sum_0_1_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_154)) 
    rom_0_1_154 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[154]), .o_ld_data(acts_0_1_154));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_155)) 
    rom_0_1_155 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[155]), .o_ld_data(acts_0_1_155));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_178)) 
    rom_0_1_178 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[178]), .o_ld_data(acts_0_1_178));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_218)) 
    rom_0_1_218 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[218]), .o_ld_data(acts_0_1_218));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_240)) 
    rom_0_1_240 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[240]), .o_ld_data(acts_0_1_240));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_272)) 
    rom_0_1_272 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[272]), .o_ld_data(acts_0_1_272));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_288)) 
    rom_0_1_288 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[288]), .o_ld_data(acts_0_1_288));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_293)) 
    rom_0_1_293 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[293]), .o_ld_data(acts_0_1_293));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_294)) 
    rom_0_1_294 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[294]), .o_ld_data(acts_0_1_294));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_296)) 
    rom_0_1_296 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[296]), .o_ld_data(acts_0_1_296));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_297)) 
    rom_0_1_297 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[297]), .o_ld_data(acts_0_1_297));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_298)) 
    rom_0_1_298 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[298]), .o_ld_data(acts_0_1_298));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_300)) 
    rom_0_1_300 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[300]), .o_ld_data(acts_0_1_300));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_301)) 
    rom_0_1_301 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[301]), .o_ld_data(acts_0_1_301));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_313)) 
    rom_0_1_313 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[313]), .o_ld_data(acts_0_1_313));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_321)) 
    rom_0_1_321 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[321]), .o_ld_data(acts_0_1_321));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_327)) 
    rom_0_1_327 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[327]), .o_ld_data(acts_0_1_327));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_345)) 
    rom_0_1_345 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[345]), .o_ld_data(acts_0_1_345));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_347)) 
    rom_0_1_347 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[347]), .o_ld_data(acts_0_1_347));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_348)) 
    rom_0_1_348 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[348]), .o_ld_data(acts_0_1_348));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_353)) 
    rom_0_1_353 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[353]), .o_ld_data(acts_0_1_353));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_354)) 
    rom_0_1_354 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[354]), .o_ld_data(acts_0_1_354));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_355)) 
    rom_0_1_355 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[355]), .o_ld_data(acts_0_1_355));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_370)) 
    rom_0_1_370 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[370]), .o_ld_data(acts_0_1_370));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_380)) 
    rom_0_1_380 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[380]), .o_ld_data(acts_0_1_380));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_381)) 
    rom_0_1_381 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[381]), .o_ld_data(acts_0_1_381));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_399)) 
    rom_0_1_399 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[399]), .o_ld_data(acts_0_1_399));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_408)) 
    rom_0_1_408 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[408]), .o_ld_data(acts_0_1_408));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_435)) 
    rom_0_1_435 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[435]), .o_ld_data(acts_0_1_435));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_461)) 
    rom_0_1_461 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[461]), .o_ld_data(acts_0_1_461));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_471)) 
    rom_0_1_471 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[471]), .o_ld_data(acts_0_1_471));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_497)) 
    rom_0_1_497 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[497]), .o_ld_data(acts_0_1_497));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_512)) 
    rom_0_1_512 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[512]), .o_ld_data(acts_0_1_512));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_1_526)) 
    rom_0_1_526 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[526]), .o_ld_data(acts_0_1_526));

  // Stage 1
    assign s_0_1_1_0 = {{2{acts_0_1_154[5]}}, acts_0_1_154} + {{2{acts_0_1_155[5]}}, acts_0_1_155} + {{2{acts_0_1_178[5]}}, acts_0_1_178} + {{2{acts_0_1_218[5]}}, acts_0_1_218};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_0), .q(s_0_1_1_0_reg));

    assign s_0_1_1_1 = {{2{acts_0_1_240[5]}}, acts_0_1_240} + {{2{acts_0_1_272[5]}}, acts_0_1_272} + {{2{acts_0_1_288[5]}}, acts_0_1_288} + {{2{acts_0_1_293[5]}}, acts_0_1_293};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_1), .q(s_0_1_1_1_reg));

    assign s_0_1_1_2 = {{2{acts_0_1_294[5]}}, acts_0_1_294} + {{2{acts_0_1_296[5]}}, acts_0_1_296} + {{2{acts_0_1_297[5]}}, acts_0_1_297} + {{2{acts_0_1_298[5]}}, acts_0_1_298};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_2), .q(s_0_1_1_2_reg));

    assign s_0_1_1_3 = {{2{acts_0_1_300[5]}}, acts_0_1_300} + {{2{acts_0_1_301[5]}}, acts_0_1_301} + {{2{acts_0_1_313[5]}}, acts_0_1_313} + {{2{acts_0_1_321[5]}}, acts_0_1_321};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_3), .q(s_0_1_1_3_reg));

    assign s_0_1_1_4 = {{2{acts_0_1_327[5]}}, acts_0_1_327} + {{2{acts_0_1_345[5]}}, acts_0_1_345} + {{2{acts_0_1_347[5]}}, acts_0_1_347} + {{2{acts_0_1_348[5]}}, acts_0_1_348};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_4), .q(s_0_1_1_4_reg));

    assign s_0_1_1_5 = {{2{acts_0_1_353[5]}}, acts_0_1_353} + {{2{acts_0_1_354[5]}}, acts_0_1_354} + {{2{acts_0_1_355[5]}}, acts_0_1_355} + {{2{acts_0_1_370[5]}}, acts_0_1_370};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_5), .q(s_0_1_1_5_reg));

    assign s_0_1_1_6 = {{2{acts_0_1_380[5]}}, acts_0_1_380} + {{2{acts_0_1_381[5]}}, acts_0_1_381} + {{2{acts_0_1_399[5]}}, acts_0_1_399} + {{2{acts_0_1_408[5]}}, acts_0_1_408};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_6), .q(s_0_1_1_6_reg));

    assign s_0_1_1_7 = {{2{acts_0_1_435[5]}}, acts_0_1_435} + {{2{acts_0_1_461[5]}}, acts_0_1_461} + {{2{acts_0_1_471[5]}}, acts_0_1_471} + {{2{acts_0_1_497[5]}}, acts_0_1_497};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_7), .q(s_0_1_1_7_reg));

    assign s_0_1_1_8 = {{2{acts_0_1_512[5]}}, acts_0_1_512} + {{2{acts_0_1_526[5]}}, acts_0_1_526};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_8), .q(s_0_1_1_8_reg));

  // Stage 2
    assign s_0_1_2_0 = {{2{s_0_1_1_0_reg[7]}}, s_0_1_1_0_reg} + {{2{s_0_1_1_1_reg[7]}}, s_0_1_1_1_reg} + {{2{s_0_1_1_2_reg[7]}}, s_0_1_1_2_reg} + {{2{s_0_1_1_3_reg[7]}}, s_0_1_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_1_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_2_0), .q(s_0_1_2_0_reg));

    assign s_0_1_2_1 = {{2{s_0_1_1_4_reg[7]}}, s_0_1_1_4_reg} + {{2{s_0_1_1_5_reg[7]}}, s_0_1_1_5_reg} + {{2{s_0_1_1_6_reg[7]}}, s_0_1_1_6_reg} + {{2{s_0_1_1_7_reg[7]}}, s_0_1_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_1_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_2_1), .q(s_0_1_2_1_reg));

    assign s_0_1_2_2 = {{2{s_0_1_1_8_reg[7]}}, s_0_1_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_1_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_2_2), .q(s_0_1_2_2_reg));

  // Stage 3
    assign s_0_1_3_0 = {{2{s_0_1_2_0_reg[9]}}, s_0_1_2_0_reg} + {{2{s_0_1_2_1_reg[9]}}, s_0_1_2_1_reg} + {{2{s_0_1_2_2_reg[9]}}, s_0_1_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_1_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_3_0), .q(s_0_1_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_1_3_0_reg[11]}}, s_0_1_3_0_reg}), .q(sum_0_1_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_1 (.i_data(sum_0_1_reg), .o_data(out_0_1_sat));


    // Layer 0, Node 2
      logic  [11:0] s_0_2_3_0;
    logic  [11:0] s_0_2_3_0_reg;
    logic  [7:0] s_0_2_1_0, s_0_2_1_1, s_0_2_1_2, s_0_2_1_3, s_0_2_1_4, s_0_2_1_5, s_0_2_1_6, s_0_2_1_7;
    logic  [7:0] s_0_2_1_0_reg, s_0_2_1_1_reg, s_0_2_1_2_reg, s_0_2_1_3_reg, s_0_2_1_4_reg, s_0_2_1_5_reg, s_0_2_1_6_reg, s_0_2_1_7_reg;
    logic  [9:0] s_0_2_2_0, s_0_2_2_1;
    logic  [9:0] s_0_2_2_0_reg, s_0_2_2_1_reg;
    logic [13:0] sum_0_2;
    logic [13:0] sum_0_2_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_127)) 
    rom_0_2_127 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[127]), .o_ld_data(acts_0_2_127));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_148)) 
    rom_0_2_148 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[148]), .o_ld_data(acts_0_2_148));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_149)) 
    rom_0_2_149 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[149]), .o_ld_data(acts_0_2_149));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_202)) 
    rom_0_2_202 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[202]), .o_ld_data(acts_0_2_202));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_234)) 
    rom_0_2_234 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[234]), .o_ld_data(acts_0_2_234));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_235)) 
    rom_0_2_235 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[235]), .o_ld_data(acts_0_2_235));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_236)) 
    rom_0_2_236 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[236]), .o_ld_data(acts_0_2_236));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_258)) 
    rom_0_2_258 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[258]), .o_ld_data(acts_0_2_258));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_261)) 
    rom_0_2_261 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[261]), .o_ld_data(acts_0_2_261));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_262)) 
    rom_0_2_262 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[262]), .o_ld_data(acts_0_2_262));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_263)) 
    rom_0_2_263 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[263]), .o_ld_data(acts_0_2_263));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_264)) 
    rom_0_2_264 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[264]), .o_ld_data(acts_0_2_264));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_345)) 
    rom_0_2_345 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[345]), .o_ld_data(acts_0_2_345));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_369)) 
    rom_0_2_369 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[369]), .o_ld_data(acts_0_2_369));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_370)) 
    rom_0_2_370 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[370]), .o_ld_data(acts_0_2_370));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_397)) 
    rom_0_2_397 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[397]), .o_ld_data(acts_0_2_397));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_398)) 
    rom_0_2_398 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[398]), .o_ld_data(acts_0_2_398));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_417)) 
    rom_0_2_417 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[417]), .o_ld_data(acts_0_2_417));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_444)) 
    rom_0_2_444 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[444]), .o_ld_data(acts_0_2_444));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_469)) 
    rom_0_2_469 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[469]), .o_ld_data(acts_0_2_469));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_470)) 
    rom_0_2_470 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[470]), .o_ld_data(acts_0_2_470));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_498)) 
    rom_0_2_498 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[498]), .o_ld_data(acts_0_2_498));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_520)) 
    rom_0_2_520 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[520]), .o_ld_data(acts_0_2_520));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_525)) 
    rom_0_2_525 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[525]), .o_ld_data(acts_0_2_525));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_526)) 
    rom_0_2_526 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[526]), .o_ld_data(acts_0_2_526));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_553)) 
    rom_0_2_553 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[553]), .o_ld_data(acts_0_2_553));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_574)) 
    rom_0_2_574 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[574]), .o_ld_data(acts_0_2_574));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_671)) 
    rom_0_2_671 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[671]), .o_ld_data(acts_0_2_671));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_2_708)) 
    rom_0_2_708 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[708]), .o_ld_data(acts_0_2_708));

  // Stage 1
    assign s_0_2_1_0 = {{2{acts_0_2_127[5]}}, acts_0_2_127} + {{2{acts_0_2_148[5]}}, acts_0_2_148} + {{2{acts_0_2_149[5]}}, acts_0_2_149} + {{2{acts_0_2_202[5]}}, acts_0_2_202};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_0), .q(s_0_2_1_0_reg));

    assign s_0_2_1_1 = {{2{acts_0_2_234[5]}}, acts_0_2_234} + {{2{acts_0_2_235[5]}}, acts_0_2_235} + {{2{acts_0_2_236[5]}}, acts_0_2_236} + {{2{acts_0_2_258[5]}}, acts_0_2_258};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_1), .q(s_0_2_1_1_reg));

    assign s_0_2_1_2 = {{2{acts_0_2_261[5]}}, acts_0_2_261} + {{2{acts_0_2_262[5]}}, acts_0_2_262} + {{2{acts_0_2_263[5]}}, acts_0_2_263} + {{2{acts_0_2_264[5]}}, acts_0_2_264};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_2), .q(s_0_2_1_2_reg));

    assign s_0_2_1_3 = {{2{acts_0_2_345[5]}}, acts_0_2_345} + {{2{acts_0_2_369[5]}}, acts_0_2_369} + {{2{acts_0_2_370[5]}}, acts_0_2_370} + {{2{acts_0_2_397[5]}}, acts_0_2_397};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_3), .q(s_0_2_1_3_reg));

    assign s_0_2_1_4 = {{2{acts_0_2_398[5]}}, acts_0_2_398} + {{2{acts_0_2_417[5]}}, acts_0_2_417} + {{2{acts_0_2_444[5]}}, acts_0_2_444} + {{2{acts_0_2_469[5]}}, acts_0_2_469};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_4), .q(s_0_2_1_4_reg));

    assign s_0_2_1_5 = {{2{acts_0_2_470[5]}}, acts_0_2_470} + {{2{acts_0_2_498[5]}}, acts_0_2_498} + {{2{acts_0_2_520[5]}}, acts_0_2_520} + {{2{acts_0_2_525[5]}}, acts_0_2_525};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_5), .q(s_0_2_1_5_reg));

    assign s_0_2_1_6 = {{2{acts_0_2_526[5]}}, acts_0_2_526} + {{2{acts_0_2_553[5]}}, acts_0_2_553} + {{2{acts_0_2_574[5]}}, acts_0_2_574} + {{2{acts_0_2_671[5]}}, acts_0_2_671};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_6), .q(s_0_2_1_6_reg));

    assign s_0_2_1_7 = {{2{acts_0_2_708[5]}}, acts_0_2_708};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_7), .q(s_0_2_1_7_reg));

  // Stage 2
    assign s_0_2_2_0 = {{2{s_0_2_1_0_reg[7]}}, s_0_2_1_0_reg} + {{2{s_0_2_1_1_reg[7]}}, s_0_2_1_1_reg} + {{2{s_0_2_1_2_reg[7]}}, s_0_2_1_2_reg} + {{2{s_0_2_1_3_reg[7]}}, s_0_2_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_2_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_2_0), .q(s_0_2_2_0_reg));

    assign s_0_2_2_1 = {{2{s_0_2_1_4_reg[7]}}, s_0_2_1_4_reg} + {{2{s_0_2_1_5_reg[7]}}, s_0_2_1_5_reg} + {{2{s_0_2_1_6_reg[7]}}, s_0_2_1_6_reg} + {{2{s_0_2_1_7_reg[7]}}, s_0_2_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_2_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_2_1), .q(s_0_2_2_1_reg));

  // Stage 3
    assign s_0_2_3_0 = {{2{s_0_2_2_0_reg[9]}}, s_0_2_2_0_reg} + {{2{s_0_2_2_1_reg[9]}}, s_0_2_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_2_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_3_0), .q(s_0_2_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_2_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_2_3_0_reg[11]}}, s_0_2_3_0_reg}), .q(sum_0_2_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_2 (.i_data(sum_0_2_reg), .o_data(out_0_2_sat));


    // Layer 0, Node 3
      logic  [11:0] s_0_3_3_0;
    logic  [11:0] s_0_3_3_0_reg;
    logic  [7:0] s_0_3_1_0, s_0_3_1_1, s_0_3_1_2, s_0_3_1_3, s_0_3_1_4, s_0_3_1_5, s_0_3_1_6, s_0_3_1_7, s_0_3_1_8, s_0_3_1_9, s_0_3_1_10, s_0_3_1_11;
    logic  [7:0] s_0_3_1_0_reg, s_0_3_1_1_reg, s_0_3_1_2_reg, s_0_3_1_3_reg, s_0_3_1_4_reg, s_0_3_1_5_reg, s_0_3_1_6_reg, s_0_3_1_7_reg, s_0_3_1_8_reg, s_0_3_1_9_reg, s_0_3_1_10_reg, s_0_3_1_11_reg;
    logic  [9:0] s_0_3_2_0, s_0_3_2_1, s_0_3_2_2;
    logic  [9:0] s_0_3_2_0_reg, s_0_3_2_1_reg, s_0_3_2_2_reg;
    logic [13:0] sum_0_3;
    logic [13:0] sum_0_3_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_98)) 
    rom_0_3_98 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[98]), .o_ld_data(acts_0_3_98));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_264)) 
    rom_0_3_264 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[264]), .o_ld_data(acts_0_3_264));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_289)) 
    rom_0_3_289 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[289]), .o_ld_data(acts_0_3_289));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_320)) 
    rom_0_3_320 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[320]), .o_ld_data(acts_0_3_320));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_321)) 
    rom_0_3_321 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[321]), .o_ld_data(acts_0_3_321));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_323)) 
    rom_0_3_323 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[323]), .o_ld_data(acts_0_3_323));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_324)) 
    rom_0_3_324 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[324]), .o_ld_data(acts_0_3_324));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_325)) 
    rom_0_3_325 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[325]), .o_ld_data(acts_0_3_325));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_380)) 
    rom_0_3_380 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[380]), .o_ld_data(acts_0_3_380));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_409)) 
    rom_0_3_409 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[409]), .o_ld_data(acts_0_3_409));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_437)) 
    rom_0_3_437 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[437]), .o_ld_data(acts_0_3_437));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_454)) 
    rom_0_3_454 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[454]), .o_ld_data(acts_0_3_454));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_455)) 
    rom_0_3_455 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[455]), .o_ld_data(acts_0_3_455));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_456)) 
    rom_0_3_456 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[456]), .o_ld_data(acts_0_3_456));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_465)) 
    rom_0_3_465 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[465]), .o_ld_data(acts_0_3_465));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_491)) 
    rom_0_3_491 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[491]), .o_ld_data(acts_0_3_491));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_492)) 
    rom_0_3_492 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[492]), .o_ld_data(acts_0_3_492));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_518)) 
    rom_0_3_518 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[518]), .o_ld_data(acts_0_3_518));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_519)) 
    rom_0_3_519 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[519]), .o_ld_data(acts_0_3_519));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_573)) 
    rom_0_3_573 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[573]), .o_ld_data(acts_0_3_573));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_574)) 
    rom_0_3_574 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[574]), .o_ld_data(acts_0_3_574));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_578)) 
    rom_0_3_578 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[578]), .o_ld_data(acts_0_3_578));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_595)) 
    rom_0_3_595 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[595]), .o_ld_data(acts_0_3_595));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_599)) 
    rom_0_3_599 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[599]), .o_ld_data(acts_0_3_599));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_601)) 
    rom_0_3_601 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[601]), .o_ld_data(acts_0_3_601));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_602)) 
    rom_0_3_602 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[602]), .o_ld_data(acts_0_3_602));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_603)) 
    rom_0_3_603 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[603]), .o_ld_data(acts_0_3_603));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_604)) 
    rom_0_3_604 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[604]), .o_ld_data(acts_0_3_604));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_605)) 
    rom_0_3_605 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[605]), .o_ld_data(acts_0_3_605));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_623)) 
    rom_0_3_623 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[623]), .o_ld_data(acts_0_3_623));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_624)) 
    rom_0_3_624 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[624]), .o_ld_data(acts_0_3_624));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_625)) 
    rom_0_3_625 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[625]), .o_ld_data(acts_0_3_625));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_626)) 
    rom_0_3_626 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[626]), .o_ld_data(acts_0_3_626));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_627)) 
    rom_0_3_627 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[627]), .o_ld_data(acts_0_3_627));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_628)) 
    rom_0_3_628 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[628]), .o_ld_data(acts_0_3_628));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_630)) 
    rom_0_3_630 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[630]), .o_ld_data(acts_0_3_630));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_631)) 
    rom_0_3_631 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[631]), .o_ld_data(acts_0_3_631));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_632)) 
    rom_0_3_632 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[632]), .o_ld_data(acts_0_3_632));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_633)) 
    rom_0_3_633 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[633]), .o_ld_data(acts_0_3_633));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_636)) 
    rom_0_3_636 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[636]), .o_ld_data(acts_0_3_636));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_655)) 
    rom_0_3_655 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[655]), .o_ld_data(acts_0_3_655));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_657)) 
    rom_0_3_657 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[657]), .o_ld_data(acts_0_3_657));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_659)) 
    rom_0_3_659 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[659]), .o_ld_data(acts_0_3_659));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_661)) 
    rom_0_3_661 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[661]), .o_ld_data(acts_0_3_661));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_662)) 
    rom_0_3_662 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[662]), .o_ld_data(acts_0_3_662));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_684)) 
    rom_0_3_684 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[684]), .o_ld_data(acts_0_3_684));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_3_685)) 
    rom_0_3_685 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[685]), .o_ld_data(acts_0_3_685));

  // Stage 1
    assign s_0_3_1_0 = {{2{acts_0_3_98[5]}}, acts_0_3_98} + {{2{acts_0_3_264[5]}}, acts_0_3_264} + {{2{acts_0_3_289[5]}}, acts_0_3_289} + {{2{acts_0_3_320[5]}}, acts_0_3_320};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_0), .q(s_0_3_1_0_reg));

    assign s_0_3_1_1 = {{2{acts_0_3_321[5]}}, acts_0_3_321} + {{2{acts_0_3_323[5]}}, acts_0_3_323} + {{2{acts_0_3_324[5]}}, acts_0_3_324} + {{2{acts_0_3_325[5]}}, acts_0_3_325};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_1), .q(s_0_3_1_1_reg));

    assign s_0_3_1_2 = {{2{acts_0_3_380[5]}}, acts_0_3_380} + {{2{acts_0_3_409[5]}}, acts_0_3_409} + {{2{acts_0_3_437[5]}}, acts_0_3_437} + {{2{acts_0_3_454[5]}}, acts_0_3_454};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_2), .q(s_0_3_1_2_reg));

    assign s_0_3_1_3 = {{2{acts_0_3_455[5]}}, acts_0_3_455} + {{2{acts_0_3_456[5]}}, acts_0_3_456} + {{2{acts_0_3_465[5]}}, acts_0_3_465} + {{2{acts_0_3_491[5]}}, acts_0_3_491};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_3), .q(s_0_3_1_3_reg));

    assign s_0_3_1_4 = {{2{acts_0_3_492[5]}}, acts_0_3_492} + {{2{acts_0_3_518[5]}}, acts_0_3_518} + {{2{acts_0_3_519[5]}}, acts_0_3_519} + {{2{acts_0_3_573[5]}}, acts_0_3_573};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_4), .q(s_0_3_1_4_reg));

    assign s_0_3_1_5 = {{2{acts_0_3_574[5]}}, acts_0_3_574} + {{2{acts_0_3_578[5]}}, acts_0_3_578} + {{2{acts_0_3_595[5]}}, acts_0_3_595} + {{2{acts_0_3_599[5]}}, acts_0_3_599};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_5), .q(s_0_3_1_5_reg));

    assign s_0_3_1_6 = {{2{acts_0_3_601[5]}}, acts_0_3_601} + {{2{acts_0_3_602[5]}}, acts_0_3_602} + {{2{acts_0_3_603[5]}}, acts_0_3_603} + {{2{acts_0_3_604[5]}}, acts_0_3_604};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_6), .q(s_0_3_1_6_reg));

    assign s_0_3_1_7 = {{2{acts_0_3_605[5]}}, acts_0_3_605} + {{2{acts_0_3_623[5]}}, acts_0_3_623} + {{2{acts_0_3_624[5]}}, acts_0_3_624} + {{2{acts_0_3_625[5]}}, acts_0_3_625};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_7), .q(s_0_3_1_7_reg));

    assign s_0_3_1_8 = {{2{acts_0_3_626[5]}}, acts_0_3_626} + {{2{acts_0_3_627[5]}}, acts_0_3_627} + {{2{acts_0_3_628[5]}}, acts_0_3_628} + {{2{acts_0_3_630[5]}}, acts_0_3_630};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_8), .q(s_0_3_1_8_reg));

    assign s_0_3_1_9 = {{2{acts_0_3_631[5]}}, acts_0_3_631} + {{2{acts_0_3_632[5]}}, acts_0_3_632} + {{2{acts_0_3_633[5]}}, acts_0_3_633} + {{2{acts_0_3_636[5]}}, acts_0_3_636};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_9), .q(s_0_3_1_9_reg));

    assign s_0_3_1_10 = {{2{acts_0_3_655[5]}}, acts_0_3_655} + {{2{acts_0_3_657[5]}}, acts_0_3_657} + {{2{acts_0_3_659[5]}}, acts_0_3_659} + {{2{acts_0_3_661[5]}}, acts_0_3_661};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_10), .q(s_0_3_1_10_reg));

    assign s_0_3_1_11 = {{2{acts_0_3_662[5]}}, acts_0_3_662} + {{2{acts_0_3_684[5]}}, acts_0_3_684} + {{2{acts_0_3_685[5]}}, acts_0_3_685};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_11), .q(s_0_3_1_11_reg));

  // Stage 2
    assign s_0_3_2_0 = {{2{s_0_3_1_0_reg[7]}}, s_0_3_1_0_reg} + {{2{s_0_3_1_1_reg[7]}}, s_0_3_1_1_reg} + {{2{s_0_3_1_2_reg[7]}}, s_0_3_1_2_reg} + {{2{s_0_3_1_3_reg[7]}}, s_0_3_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_3_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_2_0), .q(s_0_3_2_0_reg));

    assign s_0_3_2_1 = {{2{s_0_3_1_4_reg[7]}}, s_0_3_1_4_reg} + {{2{s_0_3_1_5_reg[7]}}, s_0_3_1_5_reg} + {{2{s_0_3_1_6_reg[7]}}, s_0_3_1_6_reg} + {{2{s_0_3_1_7_reg[7]}}, s_0_3_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_3_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_2_1), .q(s_0_3_2_1_reg));

    assign s_0_3_2_2 = {{2{s_0_3_1_8_reg[7]}}, s_0_3_1_8_reg} + {{2{s_0_3_1_9_reg[7]}}, s_0_3_1_9_reg} + {{2{s_0_3_1_10_reg[7]}}, s_0_3_1_10_reg} + {{2{s_0_3_1_11_reg[7]}}, s_0_3_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_3_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_2_2), .q(s_0_3_2_2_reg));

  // Stage 3
    assign s_0_3_3_0 = {{2{s_0_3_2_0_reg[9]}}, s_0_3_2_0_reg} + {{2{s_0_3_2_1_reg[9]}}, s_0_3_2_1_reg} + {{2{s_0_3_2_2_reg[9]}}, s_0_3_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_3_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_3_0), .q(s_0_3_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_3_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_3_3_0_reg[11]}}, s_0_3_3_0_reg}), .q(sum_0_3_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_3 (.i_data(sum_0_3_reg), .o_data(out_0_3_sat));


    // Layer 0, Node 4
      logic  [11:0] s_0_4_3_0;
    logic  [11:0] s_0_4_3_0_reg;
    logic  [7:0] s_0_4_1_0, s_0_4_1_1, s_0_4_1_2, s_0_4_1_3, s_0_4_1_4, s_0_4_1_5, s_0_4_1_6;
    logic  [7:0] s_0_4_1_0_reg, s_0_4_1_1_reg, s_0_4_1_2_reg, s_0_4_1_3_reg, s_0_4_1_4_reg, s_0_4_1_5_reg, s_0_4_1_6_reg;
    logic  [9:0] s_0_4_2_0, s_0_4_2_1;
    logic  [9:0] s_0_4_2_0_reg, s_0_4_2_1_reg;
    logic [13:0] sum_0_4;
    logic [13:0] sum_0_4_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_94)) 
    rom_0_4_94 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[94]), .o_ld_data(acts_0_4_94));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_122)) 
    rom_0_4_122 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[122]), .o_ld_data(acts_0_4_122));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_191)) 
    rom_0_4_191 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[191]), .o_ld_data(acts_0_4_191));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_214)) 
    rom_0_4_214 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[214]), .o_ld_data(acts_0_4_214));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_219)) 
    rom_0_4_219 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[219]), .o_ld_data(acts_0_4_219));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_377)) 
    rom_0_4_377 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[377]), .o_ld_data(acts_0_4_377));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_405)) 
    rom_0_4_405 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[405]), .o_ld_data(acts_0_4_405));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_416)) 
    rom_0_4_416 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[416]), .o_ld_data(acts_0_4_416));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_433)) 
    rom_0_4_433 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[433]), .o_ld_data(acts_0_4_433));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_473)) 
    rom_0_4_473 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[473]), .o_ld_data(acts_0_4_473));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_487)) 
    rom_0_4_487 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[487]), .o_ld_data(acts_0_4_487));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_522)) 
    rom_0_4_522 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[522]), .o_ld_data(acts_0_4_522));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_547)) 
    rom_0_4_547 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[547]), .o_ld_data(acts_0_4_547));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_548)) 
    rom_0_4_548 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[548]), .o_ld_data(acts_0_4_548));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_575)) 
    rom_0_4_575 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[575]), .o_ld_data(acts_0_4_575));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_627)) 
    rom_0_4_627 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[627]), .o_ld_data(acts_0_4_627));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_631)) 
    rom_0_4_631 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[631]), .o_ld_data(acts_0_4_631));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_632)) 
    rom_0_4_632 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[632]), .o_ld_data(acts_0_4_632));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_633)) 
    rom_0_4_633 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[633]), .o_ld_data(acts_0_4_633));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_634)) 
    rom_0_4_634 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[634]), .o_ld_data(acts_0_4_634));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_654)) 
    rom_0_4_654 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[654]), .o_ld_data(acts_0_4_654));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_656)) 
    rom_0_4_656 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[656]), .o_ld_data(acts_0_4_656));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_657)) 
    rom_0_4_657 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[657]), .o_ld_data(acts_0_4_657));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_658)) 
    rom_0_4_658 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[658]), .o_ld_data(acts_0_4_658));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_659)) 
    rom_0_4_659 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[659]), .o_ld_data(acts_0_4_659));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_660)) 
    rom_0_4_660 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[660]), .o_ld_data(acts_0_4_660));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_661)) 
    rom_0_4_661 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[661]), .o_ld_data(acts_0_4_661));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_4_662)) 
    rom_0_4_662 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[662]), .o_ld_data(acts_0_4_662));

  // Stage 1
    assign s_0_4_1_0 = {{2{acts_0_4_94[5]}}, acts_0_4_94} + {{2{acts_0_4_122[5]}}, acts_0_4_122} + {{2{acts_0_4_191[5]}}, acts_0_4_191} + {{2{acts_0_4_214[5]}}, acts_0_4_214};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_0), .q(s_0_4_1_0_reg));

    assign s_0_4_1_1 = {{2{acts_0_4_219[5]}}, acts_0_4_219} + {{2{acts_0_4_377[5]}}, acts_0_4_377} + {{2{acts_0_4_405[5]}}, acts_0_4_405} + {{2{acts_0_4_416[5]}}, acts_0_4_416};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_1), .q(s_0_4_1_1_reg));

    assign s_0_4_1_2 = {{2{acts_0_4_433[5]}}, acts_0_4_433} + {{2{acts_0_4_473[5]}}, acts_0_4_473} + {{2{acts_0_4_487[5]}}, acts_0_4_487} + {{2{acts_0_4_522[5]}}, acts_0_4_522};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_2), .q(s_0_4_1_2_reg));

    assign s_0_4_1_3 = {{2{acts_0_4_547[5]}}, acts_0_4_547} + {{2{acts_0_4_548[5]}}, acts_0_4_548} + {{2{acts_0_4_575[5]}}, acts_0_4_575} + {{2{acts_0_4_627[5]}}, acts_0_4_627};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_3), .q(s_0_4_1_3_reg));

    assign s_0_4_1_4 = {{2{acts_0_4_631[5]}}, acts_0_4_631} + {{2{acts_0_4_632[5]}}, acts_0_4_632} + {{2{acts_0_4_633[5]}}, acts_0_4_633} + {{2{acts_0_4_634[5]}}, acts_0_4_634};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_4), .q(s_0_4_1_4_reg));

    assign s_0_4_1_5 = {{2{acts_0_4_654[5]}}, acts_0_4_654} + {{2{acts_0_4_656[5]}}, acts_0_4_656} + {{2{acts_0_4_657[5]}}, acts_0_4_657} + {{2{acts_0_4_658[5]}}, acts_0_4_658};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_5), .q(s_0_4_1_5_reg));

    assign s_0_4_1_6 = {{2{acts_0_4_659[5]}}, acts_0_4_659} + {{2{acts_0_4_660[5]}}, acts_0_4_660} + {{2{acts_0_4_661[5]}}, acts_0_4_661} + {{2{acts_0_4_662[5]}}, acts_0_4_662};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_6), .q(s_0_4_1_6_reg));

  // Stage 2
    assign s_0_4_2_0 = {{2{s_0_4_1_0_reg[7]}}, s_0_4_1_0_reg} + {{2{s_0_4_1_1_reg[7]}}, s_0_4_1_1_reg} + {{2{s_0_4_1_2_reg[7]}}, s_0_4_1_2_reg} + {{2{s_0_4_1_3_reg[7]}}, s_0_4_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_4_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_2_0), .q(s_0_4_2_0_reg));

    assign s_0_4_2_1 = {{2{s_0_4_1_4_reg[7]}}, s_0_4_1_4_reg} + {{2{s_0_4_1_5_reg[7]}}, s_0_4_1_5_reg} + {{2{s_0_4_1_6_reg[7]}}, s_0_4_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_4_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_2_1), .q(s_0_4_2_1_reg));

  // Stage 3
    assign s_0_4_3_0 = {{2{s_0_4_2_0_reg[9]}}, s_0_4_2_0_reg} + {{2{s_0_4_2_1_reg[9]}}, s_0_4_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_4_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_3_0), .q(s_0_4_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_4_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_4_3_0_reg[11]}}, s_0_4_3_0_reg}), .q(sum_0_4_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_4 (.i_data(sum_0_4_reg), .o_data(out_0_4_sat));


    // Layer 0, Node 5
      logic  [11:0] s_0_5_3_0;
    logic  [11:0] s_0_5_3_0_reg;
    logic  [7:0] s_0_5_1_0, s_0_5_1_1, s_0_5_1_2, s_0_5_1_3, s_0_5_1_4, s_0_5_1_5, s_0_5_1_6, s_0_5_1_7, s_0_5_1_8, s_0_5_1_9, s_0_5_1_10, s_0_5_1_11;
    logic  [7:0] s_0_5_1_0_reg, s_0_5_1_1_reg, s_0_5_1_2_reg, s_0_5_1_3_reg, s_0_5_1_4_reg, s_0_5_1_5_reg, s_0_5_1_6_reg, s_0_5_1_7_reg, s_0_5_1_8_reg, s_0_5_1_9_reg, s_0_5_1_10_reg, s_0_5_1_11_reg;
    logic  [9:0] s_0_5_2_0, s_0_5_2_1, s_0_5_2_2;
    logic  [9:0] s_0_5_2_0_reg, s_0_5_2_1_reg, s_0_5_2_2_reg;
    logic [13:0] sum_0_5;
    logic [13:0] sum_0_5_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_91)) 
    rom_0_5_91 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[91]), .o_ld_data(acts_0_5_91));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_123)) 
    rom_0_5_123 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[123]), .o_ld_data(acts_0_5_123));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_124)) 
    rom_0_5_124 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[124]), .o_ld_data(acts_0_5_124));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_149)) 
    rom_0_5_149 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[149]), .o_ld_data(acts_0_5_149));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_150)) 
    rom_0_5_150 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[150]), .o_ld_data(acts_0_5_150));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_153)) 
    rom_0_5_153 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[153]), .o_ld_data(acts_0_5_153));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_154)) 
    rom_0_5_154 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[154]), .o_ld_data(acts_0_5_154));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_155)) 
    rom_0_5_155 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[155]), .o_ld_data(acts_0_5_155));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_158)) 
    rom_0_5_158 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[158]), .o_ld_data(acts_0_5_158));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_179)) 
    rom_0_5_179 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[179]), .o_ld_data(acts_0_5_179));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_180)) 
    rom_0_5_180 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[180]), .o_ld_data(acts_0_5_180));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_181)) 
    rom_0_5_181 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[181]), .o_ld_data(acts_0_5_181));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_182)) 
    rom_0_5_182 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[182]), .o_ld_data(acts_0_5_182));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_184)) 
    rom_0_5_184 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[184]), .o_ld_data(acts_0_5_184));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_186)) 
    rom_0_5_186 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[186]), .o_ld_data(acts_0_5_186));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_248)) 
    rom_0_5_248 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[248]), .o_ld_data(acts_0_5_248));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_263)) 
    rom_0_5_263 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[263]), .o_ld_data(acts_0_5_263));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_264)) 
    rom_0_5_264 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[264]), .o_ld_data(acts_0_5_264));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_266)) 
    rom_0_5_266 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[266]), .o_ld_data(acts_0_5_266));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_275)) 
    rom_0_5_275 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[275]), .o_ld_data(acts_0_5_275));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_289)) 
    rom_0_5_289 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[289]), .o_ld_data(acts_0_5_289));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_290)) 
    rom_0_5_290 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[290]), .o_ld_data(acts_0_5_290));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_291)) 
    rom_0_5_291 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[291]), .o_ld_data(acts_0_5_291));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_294)) 
    rom_0_5_294 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[294]), .o_ld_data(acts_0_5_294));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_295)) 
    rom_0_5_295 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[295]), .o_ld_data(acts_0_5_295));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_300)) 
    rom_0_5_300 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[300]), .o_ld_data(acts_0_5_300));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_319)) 
    rom_0_5_319 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[319]), .o_ld_data(acts_0_5_319));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_345)) 
    rom_0_5_345 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[345]), .o_ld_data(acts_0_5_345));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_432)) 
    rom_0_5_432 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[432]), .o_ld_data(acts_0_5_432));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_456)) 
    rom_0_5_456 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[456]), .o_ld_data(acts_0_5_456));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_486)) 
    rom_0_5_486 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[486]), .o_ld_data(acts_0_5_486));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_488)) 
    rom_0_5_488 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[488]), .o_ld_data(acts_0_5_488));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_489)) 
    rom_0_5_489 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[489]), .o_ld_data(acts_0_5_489));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_544)) 
    rom_0_5_544 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[544]), .o_ld_data(acts_0_5_544));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_545)) 
    rom_0_5_545 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[545]), .o_ld_data(acts_0_5_545));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_568)) 
    rom_0_5_568 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[568]), .o_ld_data(acts_0_5_568));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_570)) 
    rom_0_5_570 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[570]), .o_ld_data(acts_0_5_570));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_571)) 
    rom_0_5_571 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[571]), .o_ld_data(acts_0_5_571));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_596)) 
    rom_0_5_596 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[596]), .o_ld_data(acts_0_5_596));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_597)) 
    rom_0_5_597 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[597]), .o_ld_data(acts_0_5_597));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_598)) 
    rom_0_5_598 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[598]), .o_ld_data(acts_0_5_598));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_606)) 
    rom_0_5_606 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[606]), .o_ld_data(acts_0_5_606));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_630)) 
    rom_0_5_630 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[630]), .o_ld_data(acts_0_5_630));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_654)) 
    rom_0_5_654 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[654]), .o_ld_data(acts_0_5_654));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_5_683)) 
    rom_0_5_683 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[683]), .o_ld_data(acts_0_5_683));

  // Stage 1
    assign s_0_5_1_0 = {{2{acts_0_5_91[5]}}, acts_0_5_91} + {{2{acts_0_5_123[5]}}, acts_0_5_123} + {{2{acts_0_5_124[5]}}, acts_0_5_124} + {{2{acts_0_5_149[5]}}, acts_0_5_149};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_0), .q(s_0_5_1_0_reg));

    assign s_0_5_1_1 = {{2{acts_0_5_150[5]}}, acts_0_5_150} + {{2{acts_0_5_153[5]}}, acts_0_5_153} + {{2{acts_0_5_154[5]}}, acts_0_5_154} + {{2{acts_0_5_155[5]}}, acts_0_5_155};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_1), .q(s_0_5_1_1_reg));

    assign s_0_5_1_2 = {{2{acts_0_5_158[5]}}, acts_0_5_158} + {{2{acts_0_5_179[5]}}, acts_0_5_179} + {{2{acts_0_5_180[5]}}, acts_0_5_180} + {{2{acts_0_5_181[5]}}, acts_0_5_181};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_2), .q(s_0_5_1_2_reg));

    assign s_0_5_1_3 = {{2{acts_0_5_182[5]}}, acts_0_5_182} + {{2{acts_0_5_184[5]}}, acts_0_5_184} + {{2{acts_0_5_186[5]}}, acts_0_5_186} + {{2{acts_0_5_248[5]}}, acts_0_5_248};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_3), .q(s_0_5_1_3_reg));

    assign s_0_5_1_4 = {{2{acts_0_5_263[5]}}, acts_0_5_263} + {{2{acts_0_5_264[5]}}, acts_0_5_264} + {{2{acts_0_5_266[5]}}, acts_0_5_266} + {{2{acts_0_5_275[5]}}, acts_0_5_275};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_4), .q(s_0_5_1_4_reg));

    assign s_0_5_1_5 = {{2{acts_0_5_289[5]}}, acts_0_5_289} + {{2{acts_0_5_290[5]}}, acts_0_5_290} + {{2{acts_0_5_291[5]}}, acts_0_5_291} + {{2{acts_0_5_294[5]}}, acts_0_5_294};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_5), .q(s_0_5_1_5_reg));

    assign s_0_5_1_6 = {{2{acts_0_5_295[5]}}, acts_0_5_295} + {{2{acts_0_5_300[5]}}, acts_0_5_300} + {{2{acts_0_5_319[5]}}, acts_0_5_319} + {{2{acts_0_5_345[5]}}, acts_0_5_345};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_6), .q(s_0_5_1_6_reg));

    assign s_0_5_1_7 = {{2{acts_0_5_432[5]}}, acts_0_5_432} + {{2{acts_0_5_456[5]}}, acts_0_5_456} + {{2{acts_0_5_486[5]}}, acts_0_5_486} + {{2{acts_0_5_488[5]}}, acts_0_5_488};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_7), .q(s_0_5_1_7_reg));

    assign s_0_5_1_8 = {{2{acts_0_5_489[5]}}, acts_0_5_489} + {{2{acts_0_5_544[5]}}, acts_0_5_544} + {{2{acts_0_5_545[5]}}, acts_0_5_545} + {{2{acts_0_5_568[5]}}, acts_0_5_568};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_8), .q(s_0_5_1_8_reg));

    assign s_0_5_1_9 = {{2{acts_0_5_570[5]}}, acts_0_5_570} + {{2{acts_0_5_571[5]}}, acts_0_5_571} + {{2{acts_0_5_596[5]}}, acts_0_5_596} + {{2{acts_0_5_597[5]}}, acts_0_5_597};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_9), .q(s_0_5_1_9_reg));

    assign s_0_5_1_10 = {{2{acts_0_5_598[5]}}, acts_0_5_598} + {{2{acts_0_5_606[5]}}, acts_0_5_606} + {{2{acts_0_5_630[5]}}, acts_0_5_630} + {{2{acts_0_5_654[5]}}, acts_0_5_654};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_10), .q(s_0_5_1_10_reg));

    assign s_0_5_1_11 = {{2{acts_0_5_683[5]}}, acts_0_5_683};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_11), .q(s_0_5_1_11_reg));

  // Stage 2
    assign s_0_5_2_0 = {{2{s_0_5_1_0_reg[7]}}, s_0_5_1_0_reg} + {{2{s_0_5_1_1_reg[7]}}, s_0_5_1_1_reg} + {{2{s_0_5_1_2_reg[7]}}, s_0_5_1_2_reg} + {{2{s_0_5_1_3_reg[7]}}, s_0_5_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_5_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_2_0), .q(s_0_5_2_0_reg));

    assign s_0_5_2_1 = {{2{s_0_5_1_4_reg[7]}}, s_0_5_1_4_reg} + {{2{s_0_5_1_5_reg[7]}}, s_0_5_1_5_reg} + {{2{s_0_5_1_6_reg[7]}}, s_0_5_1_6_reg} + {{2{s_0_5_1_7_reg[7]}}, s_0_5_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_5_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_2_1), .q(s_0_5_2_1_reg));

    assign s_0_5_2_2 = {{2{s_0_5_1_8_reg[7]}}, s_0_5_1_8_reg} + {{2{s_0_5_1_9_reg[7]}}, s_0_5_1_9_reg} + {{2{s_0_5_1_10_reg[7]}}, s_0_5_1_10_reg} + {{2{s_0_5_1_11_reg[7]}}, s_0_5_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_5_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_2_2), .q(s_0_5_2_2_reg));

  // Stage 3
    assign s_0_5_3_0 = {{2{s_0_5_2_0_reg[9]}}, s_0_5_2_0_reg} + {{2{s_0_5_2_1_reg[9]}}, s_0_5_2_1_reg} + {{2{s_0_5_2_2_reg[9]}}, s_0_5_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_5_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_3_0), .q(s_0_5_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_5_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_5_3_0_reg[11]}}, s_0_5_3_0_reg}), .q(sum_0_5_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_5 (.i_data(sum_0_5_reg), .o_data(out_0_5_sat));


    // Layer 0, Node 6
      logic  [11:0] s_0_6_3_0;
    logic  [11:0] s_0_6_3_0_reg;
    logic  [7:0] s_0_6_1_0, s_0_6_1_1, s_0_6_1_2, s_0_6_1_3, s_0_6_1_4, s_0_6_1_5;
    logic  [7:0] s_0_6_1_0_reg, s_0_6_1_1_reg, s_0_6_1_2_reg, s_0_6_1_3_reg, s_0_6_1_4_reg, s_0_6_1_5_reg;
    logic  [9:0] s_0_6_2_0, s_0_6_2_1;
    logic  [9:0] s_0_6_2_0_reg, s_0_6_2_1_reg;
    logic [13:0] sum_0_6;
    logic [13:0] sum_0_6_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_21)) 
    rom_0_6_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_6_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_63)) 
    rom_0_6_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[63]), .o_ld_data(acts_0_6_63));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_97)) 
    rom_0_6_97 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[97]), .o_ld_data(acts_0_6_97));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_138)) 
    rom_0_6_138 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[138]), .o_ld_data(acts_0_6_138));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_161)) 
    rom_0_6_161 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[161]), .o_ld_data(acts_0_6_161));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_214)) 
    rom_0_6_214 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[214]), .o_ld_data(acts_0_6_214));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_324)) 
    rom_0_6_324 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[324]), .o_ld_data(acts_0_6_324));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_331)) 
    rom_0_6_331 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[331]), .o_ld_data(acts_0_6_331));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_363)) 
    rom_0_6_363 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[363]), .o_ld_data(acts_0_6_363));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_441)) 
    rom_0_6_441 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[441]), .o_ld_data(acts_0_6_441));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_466)) 
    rom_0_6_466 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[466]), .o_ld_data(acts_0_6_466));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_485)) 
    rom_0_6_485 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[485]), .o_ld_data(acts_0_6_485));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_512)) 
    rom_0_6_512 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[512]), .o_ld_data(acts_0_6_512));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_516)) 
    rom_0_6_516 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[516]), .o_ld_data(acts_0_6_516));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_542)) 
    rom_0_6_542 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[542]), .o_ld_data(acts_0_6_542));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_545)) 
    rom_0_6_545 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[545]), .o_ld_data(acts_0_6_545));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_556)) 
    rom_0_6_556 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[556]), .o_ld_data(acts_0_6_556));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_602)) 
    rom_0_6_602 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[602]), .o_ld_data(acts_0_6_602));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_610)) 
    rom_0_6_610 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[610]), .o_ld_data(acts_0_6_610));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_621)) 
    rom_0_6_621 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[621]), .o_ld_data(acts_0_6_621));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_664)) 
    rom_0_6_664 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[664]), .o_ld_data(acts_0_6_664));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_6_706)) 
    rom_0_6_706 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[706]), .o_ld_data(acts_0_6_706));

  // Stage 1
    assign s_0_6_1_0 = {{2{acts_0_6_21[5]}}, acts_0_6_21} + {{2{acts_0_6_63[5]}}, acts_0_6_63} + {{2{acts_0_6_97[5]}}, acts_0_6_97} + {{2{acts_0_6_138[5]}}, acts_0_6_138};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_0), .q(s_0_6_1_0_reg));

    assign s_0_6_1_1 = {{2{acts_0_6_161[5]}}, acts_0_6_161} + {{2{acts_0_6_214[5]}}, acts_0_6_214} + {{2{acts_0_6_324[5]}}, acts_0_6_324} + {{2{acts_0_6_331[5]}}, acts_0_6_331};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_1), .q(s_0_6_1_1_reg));

    assign s_0_6_1_2 = {{2{acts_0_6_363[5]}}, acts_0_6_363} + {{2{acts_0_6_441[5]}}, acts_0_6_441} + {{2{acts_0_6_466[5]}}, acts_0_6_466} + {{2{acts_0_6_485[5]}}, acts_0_6_485};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_2), .q(s_0_6_1_2_reg));

    assign s_0_6_1_3 = {{2{acts_0_6_512[5]}}, acts_0_6_512} + {{2{acts_0_6_516[5]}}, acts_0_6_516} + {{2{acts_0_6_542[5]}}, acts_0_6_542} + {{2{acts_0_6_545[5]}}, acts_0_6_545};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_3), .q(s_0_6_1_3_reg));

    assign s_0_6_1_4 = {{2{acts_0_6_556[5]}}, acts_0_6_556} + {{2{acts_0_6_602[5]}}, acts_0_6_602} + {{2{acts_0_6_610[5]}}, acts_0_6_610} + {{2{acts_0_6_621[5]}}, acts_0_6_621};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_4), .q(s_0_6_1_4_reg));

    assign s_0_6_1_5 = {{2{acts_0_6_664[5]}}, acts_0_6_664} + {{2{acts_0_6_706[5]}}, acts_0_6_706};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_5), .q(s_0_6_1_5_reg));

  // Stage 2
    assign s_0_6_2_0 = {{2{s_0_6_1_0_reg[7]}}, s_0_6_1_0_reg} + {{2{s_0_6_1_1_reg[7]}}, s_0_6_1_1_reg} + {{2{s_0_6_1_2_reg[7]}}, s_0_6_1_2_reg} + {{2{s_0_6_1_3_reg[7]}}, s_0_6_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_6_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_2_0), .q(s_0_6_2_0_reg));

    assign s_0_6_2_1 = {{2{s_0_6_1_4_reg[7]}}, s_0_6_1_4_reg} + {{2{s_0_6_1_5_reg[7]}}, s_0_6_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_6_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_2_1), .q(s_0_6_2_1_reg));

  // Stage 3
    assign s_0_6_3_0 = {{2{s_0_6_2_0_reg[9]}}, s_0_6_2_0_reg} + {{2{s_0_6_2_1_reg[9]}}, s_0_6_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_6_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_3_0), .q(s_0_6_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_6_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_6_3_0_reg[11]}}, s_0_6_3_0_reg}), .q(sum_0_6_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_6 (.i_data(sum_0_6_reg), .o_data(out_0_6_sat));


    // Layer 0, Node 7
      logic  [11:0] s_0_7_3_0;
    logic  [11:0] s_0_7_3_0_reg;
    logic  [7:0] s_0_7_1_0, s_0_7_1_1, s_0_7_1_2, s_0_7_1_3, s_0_7_1_4, s_0_7_1_5, s_0_7_1_6, s_0_7_1_7, s_0_7_1_8;
    logic  [7:0] s_0_7_1_0_reg, s_0_7_1_1_reg, s_0_7_1_2_reg, s_0_7_1_3_reg, s_0_7_1_4_reg, s_0_7_1_5_reg, s_0_7_1_6_reg, s_0_7_1_7_reg, s_0_7_1_8_reg;
    logic  [9:0] s_0_7_2_0, s_0_7_2_1, s_0_7_2_2;
    logic  [9:0] s_0_7_2_0_reg, s_0_7_2_1_reg, s_0_7_2_2_reg;
    logic [13:0] sum_0_7;
    logic [13:0] sum_0_7_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_98)) 
    rom_0_7_98 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[98]), .o_ld_data(acts_0_7_98));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_148)) 
    rom_0_7_148 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[148]), .o_ld_data(acts_0_7_148));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_149)) 
    rom_0_7_149 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[149]), .o_ld_data(acts_0_7_149));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_154)) 
    rom_0_7_154 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[154]), .o_ld_data(acts_0_7_154));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_155)) 
    rom_0_7_155 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[155]), .o_ld_data(acts_0_7_155));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_177)) 
    rom_0_7_177 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[177]), .o_ld_data(acts_0_7_177));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_178)) 
    rom_0_7_178 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[178]), .o_ld_data(acts_0_7_178));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_181)) 
    rom_0_7_181 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[181]), .o_ld_data(acts_0_7_181));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_182)) 
    rom_0_7_182 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[182]), .o_ld_data(acts_0_7_182));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_209)) 
    rom_0_7_209 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[209]), .o_ld_data(acts_0_7_209));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_210)) 
    rom_0_7_210 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[210]), .o_ld_data(acts_0_7_210));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_211)) 
    rom_0_7_211 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[211]), .o_ld_data(acts_0_7_211));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_234)) 
    rom_0_7_234 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[234]), .o_ld_data(acts_0_7_234));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_237)) 
    rom_0_7_237 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[237]), .o_ld_data(acts_0_7_237));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_238)) 
    rom_0_7_238 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[238]), .o_ld_data(acts_0_7_238));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_265)) 
    rom_0_7_265 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[265]), .o_ld_data(acts_0_7_265));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_266)) 
    rom_0_7_266 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[266]), .o_ld_data(acts_0_7_266));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_268)) 
    rom_0_7_268 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[268]), .o_ld_data(acts_0_7_268));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_292)) 
    rom_0_7_292 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[292]), .o_ld_data(acts_0_7_292));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_293)) 
    rom_0_7_293 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[293]), .o_ld_data(acts_0_7_293));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_320)) 
    rom_0_7_320 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[320]), .o_ld_data(acts_0_7_320));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_321)) 
    rom_0_7_321 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[321]), .o_ld_data(acts_0_7_321));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_342)) 
    rom_0_7_342 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[342]), .o_ld_data(acts_0_7_342));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_345)) 
    rom_0_7_345 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[345]), .o_ld_data(acts_0_7_345));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_347)) 
    rom_0_7_347 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[347]), .o_ld_data(acts_0_7_347));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_348)) 
    rom_0_7_348 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[348]), .o_ld_data(acts_0_7_348));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_349)) 
    rom_0_7_349 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[349]), .o_ld_data(acts_0_7_349));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_369)) 
    rom_0_7_369 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[369]), .o_ld_data(acts_0_7_369));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_371)) 
    rom_0_7_371 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[371]), .o_ld_data(acts_0_7_371));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_397)) 
    rom_0_7_397 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[397]), .o_ld_data(acts_0_7_397));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_493)) 
    rom_0_7_493 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[493]), .o_ld_data(acts_0_7_493));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_574)) 
    rom_0_7_574 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[574]), .o_ld_data(acts_0_7_574));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_600)) 
    rom_0_7_600 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[600]), .o_ld_data(acts_0_7_600));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_601)) 
    rom_0_7_601 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[601]), .o_ld_data(acts_0_7_601));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_7_661)) 
    rom_0_7_661 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[661]), .o_ld_data(acts_0_7_661));

  // Stage 1
    assign s_0_7_1_0 = {{2{acts_0_7_98[5]}}, acts_0_7_98} + {{2{acts_0_7_148[5]}}, acts_0_7_148} + {{2{acts_0_7_149[5]}}, acts_0_7_149} + {{2{acts_0_7_154[5]}}, acts_0_7_154};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_0), .q(s_0_7_1_0_reg));

    assign s_0_7_1_1 = {{2{acts_0_7_155[5]}}, acts_0_7_155} + {{2{acts_0_7_177[5]}}, acts_0_7_177} + {{2{acts_0_7_178[5]}}, acts_0_7_178} + {{2{acts_0_7_181[5]}}, acts_0_7_181};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_1), .q(s_0_7_1_1_reg));

    assign s_0_7_1_2 = {{2{acts_0_7_182[5]}}, acts_0_7_182} + {{2{acts_0_7_209[5]}}, acts_0_7_209} + {{2{acts_0_7_210[5]}}, acts_0_7_210} + {{2{acts_0_7_211[5]}}, acts_0_7_211};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_2), .q(s_0_7_1_2_reg));

    assign s_0_7_1_3 = {{2{acts_0_7_234[5]}}, acts_0_7_234} + {{2{acts_0_7_237[5]}}, acts_0_7_237} + {{2{acts_0_7_238[5]}}, acts_0_7_238} + {{2{acts_0_7_265[5]}}, acts_0_7_265};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_3), .q(s_0_7_1_3_reg));

    assign s_0_7_1_4 = {{2{acts_0_7_266[5]}}, acts_0_7_266} + {{2{acts_0_7_268[5]}}, acts_0_7_268} + {{2{acts_0_7_292[5]}}, acts_0_7_292} + {{2{acts_0_7_293[5]}}, acts_0_7_293};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_4), .q(s_0_7_1_4_reg));

    assign s_0_7_1_5 = {{2{acts_0_7_320[5]}}, acts_0_7_320} + {{2{acts_0_7_321[5]}}, acts_0_7_321} + {{2{acts_0_7_342[5]}}, acts_0_7_342} + {{2{acts_0_7_345[5]}}, acts_0_7_345};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_5), .q(s_0_7_1_5_reg));

    assign s_0_7_1_6 = {{2{acts_0_7_347[5]}}, acts_0_7_347} + {{2{acts_0_7_348[5]}}, acts_0_7_348} + {{2{acts_0_7_349[5]}}, acts_0_7_349} + {{2{acts_0_7_369[5]}}, acts_0_7_369};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_6), .q(s_0_7_1_6_reg));

    assign s_0_7_1_7 = {{2{acts_0_7_371[5]}}, acts_0_7_371} + {{2{acts_0_7_397[5]}}, acts_0_7_397} + {{2{acts_0_7_493[5]}}, acts_0_7_493} + {{2{acts_0_7_574[5]}}, acts_0_7_574};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_7), .q(s_0_7_1_7_reg));

    assign s_0_7_1_8 = {{2{acts_0_7_600[5]}}, acts_0_7_600} + {{2{acts_0_7_601[5]}}, acts_0_7_601} + {{2{acts_0_7_661[5]}}, acts_0_7_661};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_8), .q(s_0_7_1_8_reg));

  // Stage 2
    assign s_0_7_2_0 = {{2{s_0_7_1_0_reg[7]}}, s_0_7_1_0_reg} + {{2{s_0_7_1_1_reg[7]}}, s_0_7_1_1_reg} + {{2{s_0_7_1_2_reg[7]}}, s_0_7_1_2_reg} + {{2{s_0_7_1_3_reg[7]}}, s_0_7_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_7_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_2_0), .q(s_0_7_2_0_reg));

    assign s_0_7_2_1 = {{2{s_0_7_1_4_reg[7]}}, s_0_7_1_4_reg} + {{2{s_0_7_1_5_reg[7]}}, s_0_7_1_5_reg} + {{2{s_0_7_1_6_reg[7]}}, s_0_7_1_6_reg} + {{2{s_0_7_1_7_reg[7]}}, s_0_7_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_7_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_2_1), .q(s_0_7_2_1_reg));

    assign s_0_7_2_2 = {{2{s_0_7_1_8_reg[7]}}, s_0_7_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_7_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_2_2), .q(s_0_7_2_2_reg));

  // Stage 3
    assign s_0_7_3_0 = {{2{s_0_7_2_0_reg[9]}}, s_0_7_2_0_reg} + {{2{s_0_7_2_1_reg[9]}}, s_0_7_2_1_reg} + {{2{s_0_7_2_2_reg[9]}}, s_0_7_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_7_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_3_0), .q(s_0_7_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_7_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_7_3_0_reg[11]}}, s_0_7_3_0_reg}), .q(sum_0_7_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_7 (.i_data(sum_0_7_reg), .o_data(out_0_7_sat));


    // Layer 0, Node 8
      logic  [11:0] s_0_8_3_0;
    logic  [11:0] s_0_8_3_0_reg;
    logic  [7:0] s_0_8_1_0, s_0_8_1_1, s_0_8_1_2, s_0_8_1_3, s_0_8_1_4, s_0_8_1_5, s_0_8_1_6, s_0_8_1_7;
    logic  [7:0] s_0_8_1_0_reg, s_0_8_1_1_reg, s_0_8_1_2_reg, s_0_8_1_3_reg, s_0_8_1_4_reg, s_0_8_1_5_reg, s_0_8_1_6_reg, s_0_8_1_7_reg;
    logic  [9:0] s_0_8_2_0, s_0_8_2_1;
    logic  [9:0] s_0_8_2_0_reg, s_0_8_2_1_reg;
    logic [13:0] sum_0_8;
    logic [13:0] sum_0_8_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_151)) 
    rom_0_8_151 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[151]), .o_ld_data(acts_0_8_151));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_177)) 
    rom_0_8_177 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[177]), .o_ld_data(acts_0_8_177));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_209)) 
    rom_0_8_209 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[209]), .o_ld_data(acts_0_8_209));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_266)) 
    rom_0_8_266 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[266]), .o_ld_data(acts_0_8_266));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_301)) 
    rom_0_8_301 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[301]), .o_ld_data(acts_0_8_301));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_318)) 
    rom_0_8_318 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[318]), .o_ld_data(acts_0_8_318));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_322)) 
    rom_0_8_322 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[322]), .o_ld_data(acts_0_8_322));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_327)) 
    rom_0_8_327 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[327]), .o_ld_data(acts_0_8_327));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_328)) 
    rom_0_8_328 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[328]), .o_ld_data(acts_0_8_328));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_345)) 
    rom_0_8_345 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[345]), .o_ld_data(acts_0_8_345));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_346)) 
    rom_0_8_346 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[346]), .o_ld_data(acts_0_8_346));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_347)) 
    rom_0_8_347 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[347]), .o_ld_data(acts_0_8_347));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_349)) 
    rom_0_8_349 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[349]), .o_ld_data(acts_0_8_349));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_350)) 
    rom_0_8_350 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[350]), .o_ld_data(acts_0_8_350));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_371)) 
    rom_0_8_371 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[371]), .o_ld_data(acts_0_8_371));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_377)) 
    rom_0_8_377 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[377]), .o_ld_data(acts_0_8_377));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_383)) 
    rom_0_8_383 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[383]), .o_ld_data(acts_0_8_383));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_405)) 
    rom_0_8_405 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[405]), .o_ld_data(acts_0_8_405));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_432)) 
    rom_0_8_432 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[432]), .o_ld_data(acts_0_8_432));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_433)) 
    rom_0_8_433 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[433]), .o_ld_data(acts_0_8_433));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_459)) 
    rom_0_8_459 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[459]), .o_ld_data(acts_0_8_459));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_460)) 
    rom_0_8_460 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[460]), .o_ld_data(acts_0_8_460));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_485)) 
    rom_0_8_485 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[485]), .o_ld_data(acts_0_8_485));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_486)) 
    rom_0_8_486 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[486]), .o_ld_data(acts_0_8_486));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_487)) 
    rom_0_8_487 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[487]), .o_ld_data(acts_0_8_487));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_488)) 
    rom_0_8_488 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[488]), .o_ld_data(acts_0_8_488));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_515)) 
    rom_0_8_515 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[515]), .o_ld_data(acts_0_8_515));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_516)) 
    rom_0_8_516 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[516]), .o_ld_data(acts_0_8_516));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_544)) 
    rom_0_8_544 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[544]), .o_ld_data(acts_0_8_544));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_545)) 
    rom_0_8_545 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[545]), .o_ld_data(acts_0_8_545));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_8_598)) 
    rom_0_8_598 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[598]), .o_ld_data(acts_0_8_598));

  // Stage 1
    assign s_0_8_1_0 = {{2{acts_0_8_151[5]}}, acts_0_8_151} + {{2{acts_0_8_177[5]}}, acts_0_8_177} + {{2{acts_0_8_209[5]}}, acts_0_8_209} + {{2{acts_0_8_266[5]}}, acts_0_8_266};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_0), .q(s_0_8_1_0_reg));

    assign s_0_8_1_1 = {{2{acts_0_8_301[5]}}, acts_0_8_301} + {{2{acts_0_8_318[5]}}, acts_0_8_318} + {{2{acts_0_8_322[5]}}, acts_0_8_322} + {{2{acts_0_8_327[5]}}, acts_0_8_327};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_1), .q(s_0_8_1_1_reg));

    assign s_0_8_1_2 = {{2{acts_0_8_328[5]}}, acts_0_8_328} + {{2{acts_0_8_345[5]}}, acts_0_8_345} + {{2{acts_0_8_346[5]}}, acts_0_8_346} + {{2{acts_0_8_347[5]}}, acts_0_8_347};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_2), .q(s_0_8_1_2_reg));

    assign s_0_8_1_3 = {{2{acts_0_8_349[5]}}, acts_0_8_349} + {{2{acts_0_8_350[5]}}, acts_0_8_350} + {{2{acts_0_8_371[5]}}, acts_0_8_371} + {{2{acts_0_8_377[5]}}, acts_0_8_377};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_3), .q(s_0_8_1_3_reg));

    assign s_0_8_1_4 = {{2{acts_0_8_383[5]}}, acts_0_8_383} + {{2{acts_0_8_405[5]}}, acts_0_8_405} + {{2{acts_0_8_432[5]}}, acts_0_8_432} + {{2{acts_0_8_433[5]}}, acts_0_8_433};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_4), .q(s_0_8_1_4_reg));

    assign s_0_8_1_5 = {{2{acts_0_8_459[5]}}, acts_0_8_459} + {{2{acts_0_8_460[5]}}, acts_0_8_460} + {{2{acts_0_8_485[5]}}, acts_0_8_485} + {{2{acts_0_8_486[5]}}, acts_0_8_486};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_5), .q(s_0_8_1_5_reg));

    assign s_0_8_1_6 = {{2{acts_0_8_487[5]}}, acts_0_8_487} + {{2{acts_0_8_488[5]}}, acts_0_8_488} + {{2{acts_0_8_515[5]}}, acts_0_8_515} + {{2{acts_0_8_516[5]}}, acts_0_8_516};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_6), .q(s_0_8_1_6_reg));

    assign s_0_8_1_7 = {{2{acts_0_8_544[5]}}, acts_0_8_544} + {{2{acts_0_8_545[5]}}, acts_0_8_545} + {{2{acts_0_8_598[5]}}, acts_0_8_598};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_7), .q(s_0_8_1_7_reg));

  // Stage 2
    assign s_0_8_2_0 = {{2{s_0_8_1_0_reg[7]}}, s_0_8_1_0_reg} + {{2{s_0_8_1_1_reg[7]}}, s_0_8_1_1_reg} + {{2{s_0_8_1_2_reg[7]}}, s_0_8_1_2_reg} + {{2{s_0_8_1_3_reg[7]}}, s_0_8_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_8_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_2_0), .q(s_0_8_2_0_reg));

    assign s_0_8_2_1 = {{2{s_0_8_1_4_reg[7]}}, s_0_8_1_4_reg} + {{2{s_0_8_1_5_reg[7]}}, s_0_8_1_5_reg} + {{2{s_0_8_1_6_reg[7]}}, s_0_8_1_6_reg} + {{2{s_0_8_1_7_reg[7]}}, s_0_8_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_8_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_2_1), .q(s_0_8_2_1_reg));

  // Stage 3
    assign s_0_8_3_0 = {{2{s_0_8_2_0_reg[9]}}, s_0_8_2_0_reg} + {{2{s_0_8_2_1_reg[9]}}, s_0_8_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_8_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_3_0), .q(s_0_8_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_8_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_8_3_0_reg[11]}}, s_0_8_3_0_reg}), .q(sum_0_8_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_8 (.i_data(sum_0_8_reg), .o_data(out_0_8_sat));


    // Layer 0, Node 9
      logic  [11:0] s_0_9_3_0;
    logic  [11:0] s_0_9_3_0_reg;
    logic  [7:0] s_0_9_1_0, s_0_9_1_1, s_0_9_1_2, s_0_9_1_3, s_0_9_1_4, s_0_9_1_5, s_0_9_1_6, s_0_9_1_7;
    logic  [7:0] s_0_9_1_0_reg, s_0_9_1_1_reg, s_0_9_1_2_reg, s_0_9_1_3_reg, s_0_9_1_4_reg, s_0_9_1_5_reg, s_0_9_1_6_reg, s_0_9_1_7_reg;
    logic  [9:0] s_0_9_2_0, s_0_9_2_1;
    logic  [9:0] s_0_9_2_0_reg, s_0_9_2_1_reg;
    logic [13:0] sum_0_9;
    logic [13:0] sum_0_9_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_156)) 
    rom_0_9_156 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[156]), .o_ld_data(acts_0_9_156));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_157)) 
    rom_0_9_157 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[157]), .o_ld_data(acts_0_9_157));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_177)) 
    rom_0_9_177 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[177]), .o_ld_data(acts_0_9_177));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_204)) 
    rom_0_9_204 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[204]), .o_ld_data(acts_0_9_204));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_231)) 
    rom_0_9_231 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[231]), .o_ld_data(acts_0_9_231));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_232)) 
    rom_0_9_232 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[232]), .o_ld_data(acts_0_9_232));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_244)) 
    rom_0_9_244 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[244]), .o_ld_data(acts_0_9_244));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_296)) 
    rom_0_9_296 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[296]), .o_ld_data(acts_0_9_296));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_324)) 
    rom_0_9_324 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[324]), .o_ld_data(acts_0_9_324));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_325)) 
    rom_0_9_325 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[325]), .o_ld_data(acts_0_9_325));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_345)) 
    rom_0_9_345 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[345]), .o_ld_data(acts_0_9_345));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_350)) 
    rom_0_9_350 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[350]), .o_ld_data(acts_0_9_350));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_351)) 
    rom_0_9_351 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[351]), .o_ld_data(acts_0_9_351));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_355)) 
    rom_0_9_355 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[355]), .o_ld_data(acts_0_9_355));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_357)) 
    rom_0_9_357 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[357]), .o_ld_data(acts_0_9_357));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_373)) 
    rom_0_9_373 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[373]), .o_ld_data(acts_0_9_373));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_382)) 
    rom_0_9_382 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[382]), .o_ld_data(acts_0_9_382));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_383)) 
    rom_0_9_383 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[383]), .o_ld_data(acts_0_9_383));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_408)) 
    rom_0_9_408 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[408]), .o_ld_data(acts_0_9_408));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_436)) 
    rom_0_9_436 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[436]), .o_ld_data(acts_0_9_436));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_456)) 
    rom_0_9_456 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[456]), .o_ld_data(acts_0_9_456));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_489)) 
    rom_0_9_489 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[489]), .o_ld_data(acts_0_9_489));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_492)) 
    rom_0_9_492 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[492]), .o_ld_data(acts_0_9_492));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_495)) 
    rom_0_9_495 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[495]), .o_ld_data(acts_0_9_495));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_539)) 
    rom_0_9_539 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[539]), .o_ld_data(acts_0_9_539));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_590)) 
    rom_0_9_590 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[590]), .o_ld_data(acts_0_9_590));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_630)) 
    rom_0_9_630 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[630]), .o_ld_data(acts_0_9_630));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_631)) 
    rom_0_9_631 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[631]), .o_ld_data(acts_0_9_631));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_658)) 
    rom_0_9_658 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[658]), .o_ld_data(acts_0_9_658));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_679)) 
    rom_0_9_679 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[679]), .o_ld_data(acts_0_9_679));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_9_732)) 
    rom_0_9_732 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[732]), .o_ld_data(acts_0_9_732));

  // Stage 1
    assign s_0_9_1_0 = {{2{acts_0_9_156[5]}}, acts_0_9_156} + {{2{acts_0_9_157[5]}}, acts_0_9_157} + {{2{acts_0_9_177[5]}}, acts_0_9_177} + {{2{acts_0_9_204[5]}}, acts_0_9_204};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_0), .q(s_0_9_1_0_reg));

    assign s_0_9_1_1 = {{2{acts_0_9_231[5]}}, acts_0_9_231} + {{2{acts_0_9_232[5]}}, acts_0_9_232} + {{2{acts_0_9_244[5]}}, acts_0_9_244} + {{2{acts_0_9_296[5]}}, acts_0_9_296};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_1), .q(s_0_9_1_1_reg));

    assign s_0_9_1_2 = {{2{acts_0_9_324[5]}}, acts_0_9_324} + {{2{acts_0_9_325[5]}}, acts_0_9_325} + {{2{acts_0_9_345[5]}}, acts_0_9_345} + {{2{acts_0_9_350[5]}}, acts_0_9_350};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_2), .q(s_0_9_1_2_reg));

    assign s_0_9_1_3 = {{2{acts_0_9_351[5]}}, acts_0_9_351} + {{2{acts_0_9_355[5]}}, acts_0_9_355} + {{2{acts_0_9_357[5]}}, acts_0_9_357} + {{2{acts_0_9_373[5]}}, acts_0_9_373};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_3), .q(s_0_9_1_3_reg));

    assign s_0_9_1_4 = {{2{acts_0_9_382[5]}}, acts_0_9_382} + {{2{acts_0_9_383[5]}}, acts_0_9_383} + {{2{acts_0_9_408[5]}}, acts_0_9_408} + {{2{acts_0_9_436[5]}}, acts_0_9_436};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_4), .q(s_0_9_1_4_reg));

    assign s_0_9_1_5 = {{2{acts_0_9_456[5]}}, acts_0_9_456} + {{2{acts_0_9_489[5]}}, acts_0_9_489} + {{2{acts_0_9_492[5]}}, acts_0_9_492} + {{2{acts_0_9_495[5]}}, acts_0_9_495};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_5), .q(s_0_9_1_5_reg));

    assign s_0_9_1_6 = {{2{acts_0_9_539[5]}}, acts_0_9_539} + {{2{acts_0_9_590[5]}}, acts_0_9_590} + {{2{acts_0_9_630[5]}}, acts_0_9_630} + {{2{acts_0_9_631[5]}}, acts_0_9_631};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_6), .q(s_0_9_1_6_reg));

    assign s_0_9_1_7 = {{2{acts_0_9_658[5]}}, acts_0_9_658} + {{2{acts_0_9_679[5]}}, acts_0_9_679} + {{2{acts_0_9_732[5]}}, acts_0_9_732};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_7), .q(s_0_9_1_7_reg));

  // Stage 2
    assign s_0_9_2_0 = {{2{s_0_9_1_0_reg[7]}}, s_0_9_1_0_reg} + {{2{s_0_9_1_1_reg[7]}}, s_0_9_1_1_reg} + {{2{s_0_9_1_2_reg[7]}}, s_0_9_1_2_reg} + {{2{s_0_9_1_3_reg[7]}}, s_0_9_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_9_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_2_0), .q(s_0_9_2_0_reg));

    assign s_0_9_2_1 = {{2{s_0_9_1_4_reg[7]}}, s_0_9_1_4_reg} + {{2{s_0_9_1_5_reg[7]}}, s_0_9_1_5_reg} + {{2{s_0_9_1_6_reg[7]}}, s_0_9_1_6_reg} + {{2{s_0_9_1_7_reg[7]}}, s_0_9_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_9_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_2_1), .q(s_0_9_2_1_reg));

  // Stage 3
    assign s_0_9_3_0 = {{2{s_0_9_2_0_reg[9]}}, s_0_9_2_0_reg} + {{2{s_0_9_2_1_reg[9]}}, s_0_9_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_9_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_3_0), .q(s_0_9_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_9_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_9_3_0_reg[11]}}, s_0_9_3_0_reg}), .q(sum_0_9_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_9 (.i_data(sum_0_9_reg), .o_data(out_0_9_sat));


    // Layer 0, Node 10
      logic  [7:0] s_0_10_1_0;
    logic  [7:0] s_0_10_1_0_reg;
    logic [11:0] s_0_10_3_pipe;
    logic [13:0] sum_0_10;
    logic [13:0] sum_0_10_reg;
    logic [9:0] s_0_10_2_pipe;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_10_322)) 
    rom_0_10_322 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[322]), .o_ld_data(acts_0_10_322));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_10_351)) 
    rom_0_10_351 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[351]), .o_ld_data(acts_0_10_351));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_10_543)) 
    rom_0_10_543 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[543]), .o_ld_data(acts_0_10_543));

  // Stage 1
    assign s_0_10_1_0 = {{2{acts_0_10_322[5]}}, acts_0_10_322} + {{2{acts_0_10_351[5]}}, acts_0_10_351} + {{2{acts_0_10_543[5]}}, acts_0_10_543};
    registers #(.ARRAY_WIDTH(8)) r_0_10_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_10_1_0), .q(s_0_10_1_0_reg));

  // Stage 2
    registers #(.ARRAY_WIDTH(10)) reg_0_10_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_10_1_0_reg[7]}}, s_0_10_1_0_reg}), .q(s_0_10_2_pipe));

  // Stage 3
    registers #(.ARRAY_WIDTH(12)) reg_0_10_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_10_2_pipe[9]}},s_0_10_2_pipe}), .q(s_0_10_3_pipe));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_10_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_10_3_pipe[11]}},s_0_10_3_pipe}), .q(sum_0_10_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_10 (.i_data(sum_0_10_reg), .o_data(out_0_10_sat));


    // Layer 0, Node 11
      logic  [11:0] s_0_11_3_0;
    logic  [11:0] s_0_11_3_0_reg;
    logic  [7:0] s_0_11_1_0, s_0_11_1_1, s_0_11_1_2, s_0_11_1_3, s_0_11_1_4, s_0_11_1_5, s_0_11_1_6, s_0_11_1_7, s_0_11_1_8;
    logic  [7:0] s_0_11_1_0_reg, s_0_11_1_1_reg, s_0_11_1_2_reg, s_0_11_1_3_reg, s_0_11_1_4_reg, s_0_11_1_5_reg, s_0_11_1_6_reg, s_0_11_1_7_reg, s_0_11_1_8_reg;
    logic  [9:0] s_0_11_2_0, s_0_11_2_1, s_0_11_2_2;
    logic  [9:0] s_0_11_2_0_reg, s_0_11_2_1_reg, s_0_11_2_2_reg;
    logic [13:0] sum_0_11;
    logic [13:0] sum_0_11_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_155)) 
    rom_0_11_155 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[155]), .o_ld_data(acts_0_11_155));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_183)) 
    rom_0_11_183 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[183]), .o_ld_data(acts_0_11_183));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_184)) 
    rom_0_11_184 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[184]), .o_ld_data(acts_0_11_184));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_206)) 
    rom_0_11_206 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[206]), .o_ld_data(acts_0_11_206));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_210)) 
    rom_0_11_210 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[210]), .o_ld_data(acts_0_11_210));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_211)) 
    rom_0_11_211 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[211]), .o_ld_data(acts_0_11_211));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_235)) 
    rom_0_11_235 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[235]), .o_ld_data(acts_0_11_235));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_236)) 
    rom_0_11_236 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[236]), .o_ld_data(acts_0_11_236));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_238)) 
    rom_0_11_238 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[238]), .o_ld_data(acts_0_11_238));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_239)) 
    rom_0_11_239 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[239]), .o_ld_data(acts_0_11_239));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_263)) 
    rom_0_11_263 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[263]), .o_ld_data(acts_0_11_263));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_264)) 
    rom_0_11_264 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[264]), .o_ld_data(acts_0_11_264));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_266)) 
    rom_0_11_266 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[266]), .o_ld_data(acts_0_11_266));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_271)) 
    rom_0_11_271 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[271]), .o_ld_data(acts_0_11_271));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_289)) 
    rom_0_11_289 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[289]), .o_ld_data(acts_0_11_289));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_291)) 
    rom_0_11_291 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[291]), .o_ld_data(acts_0_11_291));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_294)) 
    rom_0_11_294 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[294]), .o_ld_data(acts_0_11_294));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_321)) 
    rom_0_11_321 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[321]), .o_ld_data(acts_0_11_321));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_322)) 
    rom_0_11_322 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[322]), .o_ld_data(acts_0_11_322));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_344)) 
    rom_0_11_344 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[344]), .o_ld_data(acts_0_11_344));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_345)) 
    rom_0_11_345 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[345]), .o_ld_data(acts_0_11_345));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_346)) 
    rom_0_11_346 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[346]), .o_ld_data(acts_0_11_346));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_347)) 
    rom_0_11_347 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[347]), .o_ld_data(acts_0_11_347));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_352)) 
    rom_0_11_352 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[352]), .o_ld_data(acts_0_11_352));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_371)) 
    rom_0_11_371 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[371]), .o_ld_data(acts_0_11_371));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_373)) 
    rom_0_11_373 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[373]), .o_ld_data(acts_0_11_373));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_376)) 
    rom_0_11_376 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[376]), .o_ld_data(acts_0_11_376));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_377)) 
    rom_0_11_377 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[377]), .o_ld_data(acts_0_11_377));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_400)) 
    rom_0_11_400 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[400]), .o_ld_data(acts_0_11_400));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_404)) 
    rom_0_11_404 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[404]), .o_ld_data(acts_0_11_404));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_461)) 
    rom_0_11_461 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[461]), .o_ld_data(acts_0_11_461));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_489)) 
    rom_0_11_489 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[489]), .o_ld_data(acts_0_11_489));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_496)) 
    rom_0_11_496 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[496]), .o_ld_data(acts_0_11_496));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_497)) 
    rom_0_11_497 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[497]), .o_ld_data(acts_0_11_497));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_11_657)) 
    rom_0_11_657 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[657]), .o_ld_data(acts_0_11_657));

  // Stage 1
    assign s_0_11_1_0 = {{2{acts_0_11_155[5]}}, acts_0_11_155} + {{2{acts_0_11_183[5]}}, acts_0_11_183} + {{2{acts_0_11_184[5]}}, acts_0_11_184} + {{2{acts_0_11_206[5]}}, acts_0_11_206};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_0), .q(s_0_11_1_0_reg));

    assign s_0_11_1_1 = {{2{acts_0_11_210[5]}}, acts_0_11_210} + {{2{acts_0_11_211[5]}}, acts_0_11_211} + {{2{acts_0_11_235[5]}}, acts_0_11_235} + {{2{acts_0_11_236[5]}}, acts_0_11_236};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_1), .q(s_0_11_1_1_reg));

    assign s_0_11_1_2 = {{2{acts_0_11_238[5]}}, acts_0_11_238} + {{2{acts_0_11_239[5]}}, acts_0_11_239} + {{2{acts_0_11_263[5]}}, acts_0_11_263} + {{2{acts_0_11_264[5]}}, acts_0_11_264};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_2), .q(s_0_11_1_2_reg));

    assign s_0_11_1_3 = {{2{acts_0_11_266[5]}}, acts_0_11_266} + {{2{acts_0_11_271[5]}}, acts_0_11_271} + {{2{acts_0_11_289[5]}}, acts_0_11_289} + {{2{acts_0_11_291[5]}}, acts_0_11_291};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_3), .q(s_0_11_1_3_reg));

    assign s_0_11_1_4 = {{2{acts_0_11_294[5]}}, acts_0_11_294} + {{2{acts_0_11_321[5]}}, acts_0_11_321} + {{2{acts_0_11_322[5]}}, acts_0_11_322} + {{2{acts_0_11_344[5]}}, acts_0_11_344};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_4), .q(s_0_11_1_4_reg));

    assign s_0_11_1_5 = {{2{acts_0_11_345[5]}}, acts_0_11_345} + {{2{acts_0_11_346[5]}}, acts_0_11_346} + {{2{acts_0_11_347[5]}}, acts_0_11_347} + {{2{acts_0_11_352[5]}}, acts_0_11_352};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_5), .q(s_0_11_1_5_reg));

    assign s_0_11_1_6 = {{2{acts_0_11_371[5]}}, acts_0_11_371} + {{2{acts_0_11_373[5]}}, acts_0_11_373} + {{2{acts_0_11_376[5]}}, acts_0_11_376} + {{2{acts_0_11_377[5]}}, acts_0_11_377};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_6), .q(s_0_11_1_6_reg));

    assign s_0_11_1_7 = {{2{acts_0_11_400[5]}}, acts_0_11_400} + {{2{acts_0_11_404[5]}}, acts_0_11_404} + {{2{acts_0_11_461[5]}}, acts_0_11_461} + {{2{acts_0_11_489[5]}}, acts_0_11_489};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_7), .q(s_0_11_1_7_reg));

    assign s_0_11_1_8 = {{2{acts_0_11_496[5]}}, acts_0_11_496} + {{2{acts_0_11_497[5]}}, acts_0_11_497} + {{2{acts_0_11_657[5]}}, acts_0_11_657};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_8), .q(s_0_11_1_8_reg));

  // Stage 2
    assign s_0_11_2_0 = {{2{s_0_11_1_0_reg[7]}}, s_0_11_1_0_reg} + {{2{s_0_11_1_1_reg[7]}}, s_0_11_1_1_reg} + {{2{s_0_11_1_2_reg[7]}}, s_0_11_1_2_reg} + {{2{s_0_11_1_3_reg[7]}}, s_0_11_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_11_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_2_0), .q(s_0_11_2_0_reg));

    assign s_0_11_2_1 = {{2{s_0_11_1_4_reg[7]}}, s_0_11_1_4_reg} + {{2{s_0_11_1_5_reg[7]}}, s_0_11_1_5_reg} + {{2{s_0_11_1_6_reg[7]}}, s_0_11_1_6_reg} + {{2{s_0_11_1_7_reg[7]}}, s_0_11_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_11_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_2_1), .q(s_0_11_2_1_reg));

    assign s_0_11_2_2 = {{2{s_0_11_1_8_reg[7]}}, s_0_11_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_11_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_2_2), .q(s_0_11_2_2_reg));

  // Stage 3
    assign s_0_11_3_0 = {{2{s_0_11_2_0_reg[9]}}, s_0_11_2_0_reg} + {{2{s_0_11_2_1_reg[9]}}, s_0_11_2_1_reg} + {{2{s_0_11_2_2_reg[9]}}, s_0_11_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_11_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_3_0), .q(s_0_11_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_11_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_11_3_0_reg[11]}}, s_0_11_3_0_reg}), .q(sum_0_11_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_11 (.i_data(sum_0_11_reg), .o_data(out_0_11_sat));


    // Layer 0, Node 12
      logic  [11:0] s_0_12_3_0;
    logic  [11:0] s_0_12_3_0_reg;
    logic  [7:0] s_0_12_1_0, s_0_12_1_1, s_0_12_1_2, s_0_12_1_3, s_0_12_1_4, s_0_12_1_5, s_0_12_1_6, s_0_12_1_7, s_0_12_1_8, s_0_12_1_9;
    logic  [7:0] s_0_12_1_0_reg, s_0_12_1_1_reg, s_0_12_1_2_reg, s_0_12_1_3_reg, s_0_12_1_4_reg, s_0_12_1_5_reg, s_0_12_1_6_reg, s_0_12_1_7_reg, s_0_12_1_8_reg, s_0_12_1_9_reg;
    logic  [9:0] s_0_12_2_0, s_0_12_2_1, s_0_12_2_2;
    logic  [9:0] s_0_12_2_0_reg, s_0_12_2_1_reg, s_0_12_2_2_reg;
    logic [13:0] sum_0_12;
    logic [13:0] sum_0_12_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_183)) 
    rom_0_12_183 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[183]), .o_ld_data(acts_0_12_183));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_205)) 
    rom_0_12_205 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[205]), .o_ld_data(acts_0_12_205));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_206)) 
    rom_0_12_206 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[206]), .o_ld_data(acts_0_12_206));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_232)) 
    rom_0_12_232 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[232]), .o_ld_data(acts_0_12_232));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_233)) 
    rom_0_12_233 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[233]), .o_ld_data(acts_0_12_233));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_235)) 
    rom_0_12_235 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[235]), .o_ld_data(acts_0_12_235));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_236)) 
    rom_0_12_236 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[236]), .o_ld_data(acts_0_12_236));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_264)) 
    rom_0_12_264 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[264]), .o_ld_data(acts_0_12_264));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_265)) 
    rom_0_12_265 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[265]), .o_ld_data(acts_0_12_265));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_269)) 
    rom_0_12_269 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[269]), .o_ld_data(acts_0_12_269));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_272)) 
    rom_0_12_272 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[272]), .o_ld_data(acts_0_12_272));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_288)) 
    rom_0_12_288 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[288]), .o_ld_data(acts_0_12_288));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_289)) 
    rom_0_12_289 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[289]), .o_ld_data(acts_0_12_289));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_290)) 
    rom_0_12_290 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[290]), .o_ld_data(acts_0_12_290));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_292)) 
    rom_0_12_292 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[292]), .o_ld_data(acts_0_12_292));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_293)) 
    rom_0_12_293 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[293]), .o_ld_data(acts_0_12_293));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_314)) 
    rom_0_12_314 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[314]), .o_ld_data(acts_0_12_314));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_315)) 
    rom_0_12_315 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[315]), .o_ld_data(acts_0_12_315));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_317)) 
    rom_0_12_317 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[317]), .o_ld_data(acts_0_12_317));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_318)) 
    rom_0_12_318 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[318]), .o_ld_data(acts_0_12_318));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_342)) 
    rom_0_12_342 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[342]), .o_ld_data(acts_0_12_342));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_344)) 
    rom_0_12_344 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[344]), .o_ld_data(acts_0_12_344));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_371)) 
    rom_0_12_371 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[371]), .o_ld_data(acts_0_12_371));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_372)) 
    rom_0_12_372 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[372]), .o_ld_data(acts_0_12_372));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_374)) 
    rom_0_12_374 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[374]), .o_ld_data(acts_0_12_374));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_378)) 
    rom_0_12_378 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[378]), .o_ld_data(acts_0_12_378));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_402)) 
    rom_0_12_402 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[402]), .o_ld_data(acts_0_12_402));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_429)) 
    rom_0_12_429 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[429]), .o_ld_data(acts_0_12_429));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_430)) 
    rom_0_12_430 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[430]), .o_ld_data(acts_0_12_430));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_435)) 
    rom_0_12_435 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[435]), .o_ld_data(acts_0_12_435));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_470)) 
    rom_0_12_470 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[470]), .o_ld_data(acts_0_12_470));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_511)) 
    rom_0_12_511 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[511]), .o_ld_data(acts_0_12_511));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_549)) 
    rom_0_12_549 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[549]), .o_ld_data(acts_0_12_549));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_580)) 
    rom_0_12_580 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[580]), .o_ld_data(acts_0_12_580));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_692)) 
    rom_0_12_692 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[692]), .o_ld_data(acts_0_12_692));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_693)) 
    rom_0_12_693 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[693]), .o_ld_data(acts_0_12_693));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_12_726)) 
    rom_0_12_726 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[726]), .o_ld_data(acts_0_12_726));

  // Stage 1
    assign s_0_12_1_0 = {{2{acts_0_12_183[5]}}, acts_0_12_183} + {{2{acts_0_12_205[5]}}, acts_0_12_205} + {{2{acts_0_12_206[5]}}, acts_0_12_206} + {{2{acts_0_12_232[5]}}, acts_0_12_232};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_0), .q(s_0_12_1_0_reg));

    assign s_0_12_1_1 = {{2{acts_0_12_233[5]}}, acts_0_12_233} + {{2{acts_0_12_235[5]}}, acts_0_12_235} + {{2{acts_0_12_236[5]}}, acts_0_12_236} + {{2{acts_0_12_264[5]}}, acts_0_12_264};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_1), .q(s_0_12_1_1_reg));

    assign s_0_12_1_2 = {{2{acts_0_12_265[5]}}, acts_0_12_265} + {{2{acts_0_12_269[5]}}, acts_0_12_269} + {{2{acts_0_12_272[5]}}, acts_0_12_272} + {{2{acts_0_12_288[5]}}, acts_0_12_288};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_2), .q(s_0_12_1_2_reg));

    assign s_0_12_1_3 = {{2{acts_0_12_289[5]}}, acts_0_12_289} + {{2{acts_0_12_290[5]}}, acts_0_12_290} + {{2{acts_0_12_292[5]}}, acts_0_12_292} + {{2{acts_0_12_293[5]}}, acts_0_12_293};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_3), .q(s_0_12_1_3_reg));

    assign s_0_12_1_4 = {{2{acts_0_12_314[5]}}, acts_0_12_314} + {{2{acts_0_12_315[5]}}, acts_0_12_315} + {{2{acts_0_12_317[5]}}, acts_0_12_317} + {{2{acts_0_12_318[5]}}, acts_0_12_318};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_4), .q(s_0_12_1_4_reg));

    assign s_0_12_1_5 = {{2{acts_0_12_342[5]}}, acts_0_12_342} + {{2{acts_0_12_344[5]}}, acts_0_12_344} + {{2{acts_0_12_371[5]}}, acts_0_12_371} + {{2{acts_0_12_372[5]}}, acts_0_12_372};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_5), .q(s_0_12_1_5_reg));

    assign s_0_12_1_6 = {{2{acts_0_12_374[5]}}, acts_0_12_374} + {{2{acts_0_12_378[5]}}, acts_0_12_378} + {{2{acts_0_12_402[5]}}, acts_0_12_402} + {{2{acts_0_12_429[5]}}, acts_0_12_429};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_6), .q(s_0_12_1_6_reg));

    assign s_0_12_1_7 = {{2{acts_0_12_430[5]}}, acts_0_12_430} + {{2{acts_0_12_435[5]}}, acts_0_12_435} + {{2{acts_0_12_470[5]}}, acts_0_12_470} + {{2{acts_0_12_511[5]}}, acts_0_12_511};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_7), .q(s_0_12_1_7_reg));

    assign s_0_12_1_8 = {{2{acts_0_12_549[5]}}, acts_0_12_549} + {{2{acts_0_12_580[5]}}, acts_0_12_580} + {{2{acts_0_12_692[5]}}, acts_0_12_692} + {{2{acts_0_12_693[5]}}, acts_0_12_693};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_8), .q(s_0_12_1_8_reg));

    assign s_0_12_1_9 = {{2{acts_0_12_726[5]}}, acts_0_12_726};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_9), .q(s_0_12_1_9_reg));

  // Stage 2
    assign s_0_12_2_0 = {{2{s_0_12_1_0_reg[7]}}, s_0_12_1_0_reg} + {{2{s_0_12_1_1_reg[7]}}, s_0_12_1_1_reg} + {{2{s_0_12_1_2_reg[7]}}, s_0_12_1_2_reg} + {{2{s_0_12_1_3_reg[7]}}, s_0_12_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_12_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_2_0), .q(s_0_12_2_0_reg));

    assign s_0_12_2_1 = {{2{s_0_12_1_4_reg[7]}}, s_0_12_1_4_reg} + {{2{s_0_12_1_5_reg[7]}}, s_0_12_1_5_reg} + {{2{s_0_12_1_6_reg[7]}}, s_0_12_1_6_reg} + {{2{s_0_12_1_7_reg[7]}}, s_0_12_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_12_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_2_1), .q(s_0_12_2_1_reg));

    assign s_0_12_2_2 = {{2{s_0_12_1_8_reg[7]}}, s_0_12_1_8_reg} + {{2{s_0_12_1_9_reg[7]}}, s_0_12_1_9_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_12_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_2_2), .q(s_0_12_2_2_reg));

  // Stage 3
    assign s_0_12_3_0 = {{2{s_0_12_2_0_reg[9]}}, s_0_12_2_0_reg} + {{2{s_0_12_2_1_reg[9]}}, s_0_12_2_1_reg} + {{2{s_0_12_2_2_reg[9]}}, s_0_12_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_12_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_3_0), .q(s_0_12_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_12_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_12_3_0_reg[11]}}, s_0_12_3_0_reg}), .q(sum_0_12_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_12 (.i_data(sum_0_12_reg), .o_data(out_0_12_sat));


    // Layer 0, Node 13
      logic  [11:0] s_0_13_3_0;
    logic  [11:0] s_0_13_3_0_reg;
    logic  [7:0] s_0_13_1_0, s_0_13_1_1, s_0_13_1_2, s_0_13_1_3, s_0_13_1_4, s_0_13_1_5, s_0_13_1_6, s_0_13_1_7;
    logic  [7:0] s_0_13_1_0_reg, s_0_13_1_1_reg, s_0_13_1_2_reg, s_0_13_1_3_reg, s_0_13_1_4_reg, s_0_13_1_5_reg, s_0_13_1_6_reg, s_0_13_1_7_reg;
    logic  [9:0] s_0_13_2_0, s_0_13_2_1;
    logic  [9:0] s_0_13_2_0_reg, s_0_13_2_1_reg;
    logic [13:0] sum_0_13;
    logic [13:0] sum_0_13_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_178)) 
    rom_0_13_178 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[178]), .o_ld_data(acts_0_13_178));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_179)) 
    rom_0_13_179 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[179]), .o_ld_data(acts_0_13_179));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_180)) 
    rom_0_13_180 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[180]), .o_ld_data(acts_0_13_180));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_233)) 
    rom_0_13_233 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[233]), .o_ld_data(acts_0_13_233));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_260)) 
    rom_0_13_260 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[260]), .o_ld_data(acts_0_13_260));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_269)) 
    rom_0_13_269 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[269]), .o_ld_data(acts_0_13_269));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_286)) 
    rom_0_13_286 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[286]), .o_ld_data(acts_0_13_286));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_293)) 
    rom_0_13_293 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[293]), .o_ld_data(acts_0_13_293));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_297)) 
    rom_0_13_297 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[297]), .o_ld_data(acts_0_13_297));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_302)) 
    rom_0_13_302 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[302]), .o_ld_data(acts_0_13_302));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_314)) 
    rom_0_13_314 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[314]), .o_ld_data(acts_0_13_314));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_318)) 
    rom_0_13_318 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[318]), .o_ld_data(acts_0_13_318));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_325)) 
    rom_0_13_325 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[325]), .o_ld_data(acts_0_13_325));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_331)) 
    rom_0_13_331 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[331]), .o_ld_data(acts_0_13_331));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_374)) 
    rom_0_13_374 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[374]), .o_ld_data(acts_0_13_374));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_378)) 
    rom_0_13_378 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[378]), .o_ld_data(acts_0_13_378));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_405)) 
    rom_0_13_405 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[405]), .o_ld_data(acts_0_13_405));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_408)) 
    rom_0_13_408 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[408]), .o_ld_data(acts_0_13_408));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_429)) 
    rom_0_13_429 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[429]), .o_ld_data(acts_0_13_429));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_430)) 
    rom_0_13_430 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[430]), .o_ld_data(acts_0_13_430));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_436)) 
    rom_0_13_436 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[436]), .o_ld_data(acts_0_13_436));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_463)) 
    rom_0_13_463 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[463]), .o_ld_data(acts_0_13_463));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_464)) 
    rom_0_13_464 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[464]), .o_ld_data(acts_0_13_464));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_490)) 
    rom_0_13_490 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[490]), .o_ld_data(acts_0_13_490));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_491)) 
    rom_0_13_491 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[491]), .o_ld_data(acts_0_13_491));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_540)) 
    rom_0_13_540 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[540]), .o_ld_data(acts_0_13_540));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_577)) 
    rom_0_13_577 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[577]), .o_ld_data(acts_0_13_577));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_655)) 
    rom_0_13_655 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[655]), .o_ld_data(acts_0_13_655));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_13_732)) 
    rom_0_13_732 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[732]), .o_ld_data(acts_0_13_732));

  // Stage 1
    assign s_0_13_1_0 = {{2{acts_0_13_178[5]}}, acts_0_13_178} + {{2{acts_0_13_179[5]}}, acts_0_13_179} + {{2{acts_0_13_180[5]}}, acts_0_13_180} + {{2{acts_0_13_233[5]}}, acts_0_13_233};
    registers #(.ARRAY_WIDTH(8)) r_0_13_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_1_0), .q(s_0_13_1_0_reg));

    assign s_0_13_1_1 = {{2{acts_0_13_260[5]}}, acts_0_13_260} + {{2{acts_0_13_269[5]}}, acts_0_13_269} + {{2{acts_0_13_286[5]}}, acts_0_13_286} + {{2{acts_0_13_293[5]}}, acts_0_13_293};
    registers #(.ARRAY_WIDTH(8)) r_0_13_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_1_1), .q(s_0_13_1_1_reg));

    assign s_0_13_1_2 = {{2{acts_0_13_297[5]}}, acts_0_13_297} + {{2{acts_0_13_302[5]}}, acts_0_13_302} + {{2{acts_0_13_314[5]}}, acts_0_13_314} + {{2{acts_0_13_318[5]}}, acts_0_13_318};
    registers #(.ARRAY_WIDTH(8)) r_0_13_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_1_2), .q(s_0_13_1_2_reg));

    assign s_0_13_1_3 = {{2{acts_0_13_325[5]}}, acts_0_13_325} + {{2{acts_0_13_331[5]}}, acts_0_13_331} + {{2{acts_0_13_374[5]}}, acts_0_13_374} + {{2{acts_0_13_378[5]}}, acts_0_13_378};
    registers #(.ARRAY_WIDTH(8)) r_0_13_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_1_3), .q(s_0_13_1_3_reg));

    assign s_0_13_1_4 = {{2{acts_0_13_405[5]}}, acts_0_13_405} + {{2{acts_0_13_408[5]}}, acts_0_13_408} + {{2{acts_0_13_429[5]}}, acts_0_13_429} + {{2{acts_0_13_430[5]}}, acts_0_13_430};
    registers #(.ARRAY_WIDTH(8)) r_0_13_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_1_4), .q(s_0_13_1_4_reg));

    assign s_0_13_1_5 = {{2{acts_0_13_436[5]}}, acts_0_13_436} + {{2{acts_0_13_463[5]}}, acts_0_13_463} + {{2{acts_0_13_464[5]}}, acts_0_13_464} + {{2{acts_0_13_490[5]}}, acts_0_13_490};
    registers #(.ARRAY_WIDTH(8)) r_0_13_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_1_5), .q(s_0_13_1_5_reg));

    assign s_0_13_1_6 = {{2{acts_0_13_491[5]}}, acts_0_13_491} + {{2{acts_0_13_540[5]}}, acts_0_13_540} + {{2{acts_0_13_577[5]}}, acts_0_13_577} + {{2{acts_0_13_655[5]}}, acts_0_13_655};
    registers #(.ARRAY_WIDTH(8)) r_0_13_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_1_6), .q(s_0_13_1_6_reg));

    assign s_0_13_1_7 = {{2{acts_0_13_732[5]}}, acts_0_13_732};
    registers #(.ARRAY_WIDTH(8)) r_0_13_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_1_7), .q(s_0_13_1_7_reg));

  // Stage 2
    assign s_0_13_2_0 = {{2{s_0_13_1_0_reg[7]}}, s_0_13_1_0_reg} + {{2{s_0_13_1_1_reg[7]}}, s_0_13_1_1_reg} + {{2{s_0_13_1_2_reg[7]}}, s_0_13_1_2_reg} + {{2{s_0_13_1_3_reg[7]}}, s_0_13_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_13_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_2_0), .q(s_0_13_2_0_reg));

    assign s_0_13_2_1 = {{2{s_0_13_1_4_reg[7]}}, s_0_13_1_4_reg} + {{2{s_0_13_1_5_reg[7]}}, s_0_13_1_5_reg} + {{2{s_0_13_1_6_reg[7]}}, s_0_13_1_6_reg} + {{2{s_0_13_1_7_reg[7]}}, s_0_13_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_13_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_2_1), .q(s_0_13_2_1_reg));

  // Stage 3
    assign s_0_13_3_0 = {{2{s_0_13_2_0_reg[9]}}, s_0_13_2_0_reg} + {{2{s_0_13_2_1_reg[9]}}, s_0_13_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_13_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_3_0), .q(s_0_13_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_13_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_13_3_0_reg[11]}}, s_0_13_3_0_reg}), .q(sum_0_13_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_13 (.i_data(sum_0_13_reg), .o_data(out_0_13_sat));


    // Layer 0, Node 14
      logic  [11:0] s_0_14_3_0;
    logic  [11:0] s_0_14_3_0_reg;
    logic  [7:0] s_0_14_1_0, s_0_14_1_1, s_0_14_1_2, s_0_14_1_3, s_0_14_1_4, s_0_14_1_5, s_0_14_1_6, s_0_14_1_7, s_0_14_1_8, s_0_14_1_9, s_0_14_1_10, s_0_14_1_11, s_0_14_1_12;
    logic  [7:0] s_0_14_1_0_reg, s_0_14_1_1_reg, s_0_14_1_2_reg, s_0_14_1_3_reg, s_0_14_1_4_reg, s_0_14_1_5_reg, s_0_14_1_6_reg, s_0_14_1_7_reg, s_0_14_1_8_reg, s_0_14_1_9_reg, s_0_14_1_10_reg, s_0_14_1_11_reg, s_0_14_1_12_reg;
    logic  [9:0] s_0_14_2_0, s_0_14_2_1, s_0_14_2_2, s_0_14_2_3;
    logic  [9:0] s_0_14_2_0_reg, s_0_14_2_1_reg, s_0_14_2_2_reg, s_0_14_2_3_reg;
    logic [13:0] sum_0_14;
    logic [13:0] sum_0_14_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_127)) 
    rom_0_14_127 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[127]), .o_ld_data(acts_0_14_127));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_128)) 
    rom_0_14_128 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[128]), .o_ld_data(acts_0_14_128));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_155)) 
    rom_0_14_155 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[155]), .o_ld_data(acts_0_14_155));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_158)) 
    rom_0_14_158 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[158]), .o_ld_data(acts_0_14_158));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_188)) 
    rom_0_14_188 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[188]), .o_ld_data(acts_0_14_188));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_377)) 
    rom_0_14_377 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[377]), .o_ld_data(acts_0_14_377));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_385)) 
    rom_0_14_385 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[385]), .o_ld_data(acts_0_14_385));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_386)) 
    rom_0_14_386 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[386]), .o_ld_data(acts_0_14_386));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_411)) 
    rom_0_14_411 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[411]), .o_ld_data(acts_0_14_411));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_412)) 
    rom_0_14_412 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[412]), .o_ld_data(acts_0_14_412));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_413)) 
    rom_0_14_413 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[413]), .o_ld_data(acts_0_14_413));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_414)) 
    rom_0_14_414 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[414]), .o_ld_data(acts_0_14_414));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_432)) 
    rom_0_14_432 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[432]), .o_ld_data(acts_0_14_432));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_435)) 
    rom_0_14_435 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[435]), .o_ld_data(acts_0_14_435));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_437)) 
    rom_0_14_437 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[437]), .o_ld_data(acts_0_14_437));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_438)) 
    rom_0_14_438 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[438]), .o_ld_data(acts_0_14_438));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_439)) 
    rom_0_14_439 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[439]), .o_ld_data(acts_0_14_439));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_440)) 
    rom_0_14_440 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[440]), .o_ld_data(acts_0_14_440));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_460)) 
    rom_0_14_460 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[460]), .o_ld_data(acts_0_14_460));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_462)) 
    rom_0_14_462 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[462]), .o_ld_data(acts_0_14_462));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_463)) 
    rom_0_14_463 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[463]), .o_ld_data(acts_0_14_463));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_465)) 
    rom_0_14_465 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[465]), .o_ld_data(acts_0_14_465));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_467)) 
    rom_0_14_467 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[467]), .o_ld_data(acts_0_14_467));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_469)) 
    rom_0_14_469 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[469]), .o_ld_data(acts_0_14_469));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_488)) 
    rom_0_14_488 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[488]), .o_ld_data(acts_0_14_488));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_490)) 
    rom_0_14_490 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[490]), .o_ld_data(acts_0_14_490));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_491)) 
    rom_0_14_491 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[491]), .o_ld_data(acts_0_14_491));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_492)) 
    rom_0_14_492 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[492]), .o_ld_data(acts_0_14_492));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_494)) 
    rom_0_14_494 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[494]), .o_ld_data(acts_0_14_494));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_495)) 
    rom_0_14_495 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[495]), .o_ld_data(acts_0_14_495));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_514)) 
    rom_0_14_514 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[514]), .o_ld_data(acts_0_14_514));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_515)) 
    rom_0_14_515 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[515]), .o_ld_data(acts_0_14_515));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_518)) 
    rom_0_14_518 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[518]), .o_ld_data(acts_0_14_518));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_519)) 
    rom_0_14_519 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[519]), .o_ld_data(acts_0_14_519));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_541)) 
    rom_0_14_541 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[541]), .o_ld_data(acts_0_14_541));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_542)) 
    rom_0_14_542 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[542]), .o_ld_data(acts_0_14_542));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_546)) 
    rom_0_14_546 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[546]), .o_ld_data(acts_0_14_546));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_554)) 
    rom_0_14_554 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[554]), .o_ld_data(acts_0_14_554));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_568)) 
    rom_0_14_568 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[568]), .o_ld_data(acts_0_14_568));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_569)) 
    rom_0_14_569 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[569]), .o_ld_data(acts_0_14_569));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_578)) 
    rom_0_14_578 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[578]), .o_ld_data(acts_0_14_578));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_579)) 
    rom_0_14_579 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[579]), .o_ld_data(acts_0_14_579));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_580)) 
    rom_0_14_580 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[580]), .o_ld_data(acts_0_14_580));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_582)) 
    rom_0_14_582 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[582]), .o_ld_data(acts_0_14_582));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_594)) 
    rom_0_14_594 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[594]), .o_ld_data(acts_0_14_594));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_595)) 
    rom_0_14_595 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[595]), .o_ld_data(acts_0_14_595));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_597)) 
    rom_0_14_597 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[597]), .o_ld_data(acts_0_14_597));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_602)) 
    rom_0_14_602 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[602]), .o_ld_data(acts_0_14_602));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_609)) 
    rom_0_14_609 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[609]), .o_ld_data(acts_0_14_609));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_639)) 
    rom_0_14_639 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[639]), .o_ld_data(acts_0_14_639));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_652)) 
    rom_0_14_652 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[652]), .o_ld_data(acts_0_14_652));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_14_654)) 
    rom_0_14_654 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[654]), .o_ld_data(acts_0_14_654));

  // Stage 1
    assign s_0_14_1_0 = {{2{acts_0_14_127[5]}}, acts_0_14_127} + {{2{acts_0_14_128[5]}}, acts_0_14_128} + {{2{acts_0_14_155[5]}}, acts_0_14_155} + {{2{acts_0_14_158[5]}}, acts_0_14_158};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_0), .q(s_0_14_1_0_reg));

    assign s_0_14_1_1 = {{2{acts_0_14_188[5]}}, acts_0_14_188} + {{2{acts_0_14_377[5]}}, acts_0_14_377} + {{2{acts_0_14_385[5]}}, acts_0_14_385} + {{2{acts_0_14_386[5]}}, acts_0_14_386};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_1), .q(s_0_14_1_1_reg));

    assign s_0_14_1_2 = {{2{acts_0_14_411[5]}}, acts_0_14_411} + {{2{acts_0_14_412[5]}}, acts_0_14_412} + {{2{acts_0_14_413[5]}}, acts_0_14_413} + {{2{acts_0_14_414[5]}}, acts_0_14_414};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_2), .q(s_0_14_1_2_reg));

    assign s_0_14_1_3 = {{2{acts_0_14_432[5]}}, acts_0_14_432} + {{2{acts_0_14_435[5]}}, acts_0_14_435} + {{2{acts_0_14_437[5]}}, acts_0_14_437} + {{2{acts_0_14_438[5]}}, acts_0_14_438};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_3), .q(s_0_14_1_3_reg));

    assign s_0_14_1_4 = {{2{acts_0_14_439[5]}}, acts_0_14_439} + {{2{acts_0_14_440[5]}}, acts_0_14_440} + {{2{acts_0_14_460[5]}}, acts_0_14_460} + {{2{acts_0_14_462[5]}}, acts_0_14_462};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_4), .q(s_0_14_1_4_reg));

    assign s_0_14_1_5 = {{2{acts_0_14_463[5]}}, acts_0_14_463} + {{2{acts_0_14_465[5]}}, acts_0_14_465} + {{2{acts_0_14_467[5]}}, acts_0_14_467} + {{2{acts_0_14_469[5]}}, acts_0_14_469};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_5), .q(s_0_14_1_5_reg));

    assign s_0_14_1_6 = {{2{acts_0_14_488[5]}}, acts_0_14_488} + {{2{acts_0_14_490[5]}}, acts_0_14_490} + {{2{acts_0_14_491[5]}}, acts_0_14_491} + {{2{acts_0_14_492[5]}}, acts_0_14_492};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_6), .q(s_0_14_1_6_reg));

    assign s_0_14_1_7 = {{2{acts_0_14_494[5]}}, acts_0_14_494} + {{2{acts_0_14_495[5]}}, acts_0_14_495} + {{2{acts_0_14_514[5]}}, acts_0_14_514} + {{2{acts_0_14_515[5]}}, acts_0_14_515};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_7), .q(s_0_14_1_7_reg));

    assign s_0_14_1_8 = {{2{acts_0_14_518[5]}}, acts_0_14_518} + {{2{acts_0_14_519[5]}}, acts_0_14_519} + {{2{acts_0_14_541[5]}}, acts_0_14_541} + {{2{acts_0_14_542[5]}}, acts_0_14_542};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_8), .q(s_0_14_1_8_reg));

    assign s_0_14_1_9 = {{2{acts_0_14_546[5]}}, acts_0_14_546} + {{2{acts_0_14_554[5]}}, acts_0_14_554} + {{2{acts_0_14_568[5]}}, acts_0_14_568} + {{2{acts_0_14_569[5]}}, acts_0_14_569};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_9), .q(s_0_14_1_9_reg));

    assign s_0_14_1_10 = {{2{acts_0_14_578[5]}}, acts_0_14_578} + {{2{acts_0_14_579[5]}}, acts_0_14_579} + {{2{acts_0_14_580[5]}}, acts_0_14_580} + {{2{acts_0_14_582[5]}}, acts_0_14_582};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_10), .q(s_0_14_1_10_reg));

    assign s_0_14_1_11 = {{2{acts_0_14_594[5]}}, acts_0_14_594} + {{2{acts_0_14_595[5]}}, acts_0_14_595} + {{2{acts_0_14_597[5]}}, acts_0_14_597} + {{2{acts_0_14_602[5]}}, acts_0_14_602};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_11), .q(s_0_14_1_11_reg));

    assign s_0_14_1_12 = {{2{acts_0_14_609[5]}}, acts_0_14_609} + {{2{acts_0_14_639[5]}}, acts_0_14_639} + {{2{acts_0_14_652[5]}}, acts_0_14_652} + {{2{acts_0_14_654[5]}}, acts_0_14_654};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_12), .q(s_0_14_1_12_reg));

  // Stage 2
    assign s_0_14_2_0 = {{2{s_0_14_1_0_reg[7]}}, s_0_14_1_0_reg} + {{2{s_0_14_1_1_reg[7]}}, s_0_14_1_1_reg} + {{2{s_0_14_1_2_reg[7]}}, s_0_14_1_2_reg} + {{2{s_0_14_1_3_reg[7]}}, s_0_14_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_14_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_2_0), .q(s_0_14_2_0_reg));

    assign s_0_14_2_1 = {{2{s_0_14_1_4_reg[7]}}, s_0_14_1_4_reg} + {{2{s_0_14_1_5_reg[7]}}, s_0_14_1_5_reg} + {{2{s_0_14_1_6_reg[7]}}, s_0_14_1_6_reg} + {{2{s_0_14_1_7_reg[7]}}, s_0_14_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_14_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_2_1), .q(s_0_14_2_1_reg));

    assign s_0_14_2_2 = {{2{s_0_14_1_8_reg[7]}}, s_0_14_1_8_reg} + {{2{s_0_14_1_9_reg[7]}}, s_0_14_1_9_reg} + {{2{s_0_14_1_10_reg[7]}}, s_0_14_1_10_reg} + {{2{s_0_14_1_11_reg[7]}}, s_0_14_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_14_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_2_2), .q(s_0_14_2_2_reg));

    assign s_0_14_2_3 = {{2{s_0_14_1_12_reg[7]}}, s_0_14_1_12_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_14_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_2_3), .q(s_0_14_2_3_reg));

  // Stage 3
    assign s_0_14_3_0 = {{2{s_0_14_2_0_reg[9]}}, s_0_14_2_0_reg} + {{2{s_0_14_2_1_reg[9]}}, s_0_14_2_1_reg} + {{2{s_0_14_2_2_reg[9]}}, s_0_14_2_2_reg} + {{2{s_0_14_2_3_reg[9]}}, s_0_14_2_3_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_14_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_3_0), .q(s_0_14_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_14_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_14_3_0_reg[11]}}, s_0_14_3_0_reg}), .q(sum_0_14_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_14 (.i_data(sum_0_14_reg), .o_data(out_0_14_sat));


    // Layer 0, Node 15
      logic  [11:0] s_0_15_3_0;
    logic  [11:0] s_0_15_3_0_reg;
    logic  [7:0] s_0_15_1_0, s_0_15_1_1, s_0_15_1_2, s_0_15_1_3, s_0_15_1_4, s_0_15_1_5, s_0_15_1_6, s_0_15_1_7;
    logic  [7:0] s_0_15_1_0_reg, s_0_15_1_1_reg, s_0_15_1_2_reg, s_0_15_1_3_reg, s_0_15_1_4_reg, s_0_15_1_5_reg, s_0_15_1_6_reg, s_0_15_1_7_reg;
    logic  [9:0] s_0_15_2_0, s_0_15_2_1;
    logic  [9:0] s_0_15_2_0_reg, s_0_15_2_1_reg;
    logic [13:0] sum_0_15;
    logic [13:0] sum_0_15_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_73)) 
    rom_0_15_73 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[73]), .o_ld_data(acts_0_15_73));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_96)) 
    rom_0_15_96 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[96]), .o_ld_data(acts_0_15_96));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_119)) 
    rom_0_15_119 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[119]), .o_ld_data(acts_0_15_119));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_148)) 
    rom_0_15_148 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[148]), .o_ld_data(acts_0_15_148));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_162)) 
    rom_0_15_162 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[162]), .o_ld_data(acts_0_15_162));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_212)) 
    rom_0_15_212 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[212]), .o_ld_data(acts_0_15_212));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_244)) 
    rom_0_15_244 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[244]), .o_ld_data(acts_0_15_244));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_248)) 
    rom_0_15_248 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[248]), .o_ld_data(acts_0_15_248));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_254)) 
    rom_0_15_254 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[254]), .o_ld_data(acts_0_15_254));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_300)) 
    rom_0_15_300 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[300]), .o_ld_data(acts_0_15_300));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_304)) 
    rom_0_15_304 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[304]), .o_ld_data(acts_0_15_304));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_314)) 
    rom_0_15_314 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[314]), .o_ld_data(acts_0_15_314));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_328)) 
    rom_0_15_328 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[328]), .o_ld_data(acts_0_15_328));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_370)) 
    rom_0_15_370 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[370]), .o_ld_data(acts_0_15_370));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_385)) 
    rom_0_15_385 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[385]), .o_ld_data(acts_0_15_385));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_414)) 
    rom_0_15_414 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[414]), .o_ld_data(acts_0_15_414));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_426)) 
    rom_0_15_426 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[426]), .o_ld_data(acts_0_15_426));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_452)) 
    rom_0_15_452 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[452]), .o_ld_data(acts_0_15_452));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_455)) 
    rom_0_15_455 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[455]), .o_ld_data(acts_0_15_455));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_457)) 
    rom_0_15_457 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[457]), .o_ld_data(acts_0_15_457));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_548)) 
    rom_0_15_548 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[548]), .o_ld_data(acts_0_15_548));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_610)) 
    rom_0_15_610 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[610]), .o_ld_data(acts_0_15_610));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_664)) 
    rom_0_15_664 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[664]), .o_ld_data(acts_0_15_664));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_679)) 
    rom_0_15_679 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[679]), .o_ld_data(acts_0_15_679));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_682)) 
    rom_0_15_682 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[682]), .o_ld_data(acts_0_15_682));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_691)) 
    rom_0_15_691 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[691]), .o_ld_data(acts_0_15_691));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_705)) 
    rom_0_15_705 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[705]), .o_ld_data(acts_0_15_705));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_714)) 
    rom_0_15_714 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[714]), .o_ld_data(acts_0_15_714));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_716)) 
    rom_0_15_716 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[716]), .o_ld_data(acts_0_15_716));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_717)) 
    rom_0_15_717 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[717]), .o_ld_data(acts_0_15_717));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_15_766)) 
    rom_0_15_766 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[766]), .o_ld_data(acts_0_15_766));

  // Stage 1
    assign s_0_15_1_0 = {{2{acts_0_15_73[5]}}, acts_0_15_73} + {{2{acts_0_15_96[5]}}, acts_0_15_96} + {{2{acts_0_15_119[5]}}, acts_0_15_119} + {{2{acts_0_15_148[5]}}, acts_0_15_148};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_0), .q(s_0_15_1_0_reg));

    assign s_0_15_1_1 = {{2{acts_0_15_162[5]}}, acts_0_15_162} + {{2{acts_0_15_212[5]}}, acts_0_15_212} + {{2{acts_0_15_244[5]}}, acts_0_15_244} + {{2{acts_0_15_248[5]}}, acts_0_15_248};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_1), .q(s_0_15_1_1_reg));

    assign s_0_15_1_2 = {{2{acts_0_15_254[5]}}, acts_0_15_254} + {{2{acts_0_15_300[5]}}, acts_0_15_300} + {{2{acts_0_15_304[5]}}, acts_0_15_304} + {{2{acts_0_15_314[5]}}, acts_0_15_314};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_2), .q(s_0_15_1_2_reg));

    assign s_0_15_1_3 = {{2{acts_0_15_328[5]}}, acts_0_15_328} + {{2{acts_0_15_370[5]}}, acts_0_15_370} + {{2{acts_0_15_385[5]}}, acts_0_15_385} + {{2{acts_0_15_414[5]}}, acts_0_15_414};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_3), .q(s_0_15_1_3_reg));

    assign s_0_15_1_4 = {{2{acts_0_15_426[5]}}, acts_0_15_426} + {{2{acts_0_15_452[5]}}, acts_0_15_452} + {{2{acts_0_15_455[5]}}, acts_0_15_455} + {{2{acts_0_15_457[5]}}, acts_0_15_457};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_4), .q(s_0_15_1_4_reg));

    assign s_0_15_1_5 = {{2{acts_0_15_548[5]}}, acts_0_15_548} + {{2{acts_0_15_610[5]}}, acts_0_15_610} + {{2{acts_0_15_664[5]}}, acts_0_15_664} + {{2{acts_0_15_679[5]}}, acts_0_15_679};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_5), .q(s_0_15_1_5_reg));

    assign s_0_15_1_6 = {{2{acts_0_15_682[5]}}, acts_0_15_682} + {{2{acts_0_15_691[5]}}, acts_0_15_691} + {{2{acts_0_15_705[5]}}, acts_0_15_705} + {{2{acts_0_15_714[5]}}, acts_0_15_714};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_6), .q(s_0_15_1_6_reg));

    assign s_0_15_1_7 = {{2{acts_0_15_716[5]}}, acts_0_15_716} + {{2{acts_0_15_717[5]}}, acts_0_15_717} + {{2{acts_0_15_766[5]}}, acts_0_15_766};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_7), .q(s_0_15_1_7_reg));

  // Stage 2
    assign s_0_15_2_0 = {{2{s_0_15_1_0_reg[7]}}, s_0_15_1_0_reg} + {{2{s_0_15_1_1_reg[7]}}, s_0_15_1_1_reg} + {{2{s_0_15_1_2_reg[7]}}, s_0_15_1_2_reg} + {{2{s_0_15_1_3_reg[7]}}, s_0_15_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_15_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_2_0), .q(s_0_15_2_0_reg));

    assign s_0_15_2_1 = {{2{s_0_15_1_4_reg[7]}}, s_0_15_1_4_reg} + {{2{s_0_15_1_5_reg[7]}}, s_0_15_1_5_reg} + {{2{s_0_15_1_6_reg[7]}}, s_0_15_1_6_reg} + {{2{s_0_15_1_7_reg[7]}}, s_0_15_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_15_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_2_1), .q(s_0_15_2_1_reg));

  // Stage 3
    assign s_0_15_3_0 = {{2{s_0_15_2_0_reg[9]}}, s_0_15_2_0_reg} + {{2{s_0_15_2_1_reg[9]}}, s_0_15_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_15_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_3_0), .q(s_0_15_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_15_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_15_3_0_reg[11]}}, s_0_15_3_0_reg}), .q(sum_0_15_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_15 (.i_data(sum_0_15_reg), .o_data(out_0_15_sat));


    // Layer 0, Node 16
      logic  [11:0] s_0_16_3_0;
    logic  [11:0] s_0_16_3_0_reg;
    logic  [7:0] s_0_16_1_0, s_0_16_1_1, s_0_16_1_2, s_0_16_1_3, s_0_16_1_4, s_0_16_1_5, s_0_16_1_6, s_0_16_1_7, s_0_16_1_8, s_0_16_1_9, s_0_16_1_10;
    logic  [7:0] s_0_16_1_0_reg, s_0_16_1_1_reg, s_0_16_1_2_reg, s_0_16_1_3_reg, s_0_16_1_4_reg, s_0_16_1_5_reg, s_0_16_1_6_reg, s_0_16_1_7_reg, s_0_16_1_8_reg, s_0_16_1_9_reg, s_0_16_1_10_reg;
    logic  [9:0] s_0_16_2_0, s_0_16_2_1, s_0_16_2_2;
    logic  [9:0] s_0_16_2_0_reg, s_0_16_2_1_reg, s_0_16_2_2_reg;
    logic [13:0] sum_0_16;
    logic [13:0] sum_0_16_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_12)) 
    rom_0_16_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_16_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_23)) 
    rom_0_16_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_16_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_29)) 
    rom_0_16_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_16_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_75)) 
    rom_0_16_75 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[75]), .o_ld_data(acts_0_16_75));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_80)) 
    rom_0_16_80 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[80]), .o_ld_data(acts_0_16_80));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_112)) 
    rom_0_16_112 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[112]), .o_ld_data(acts_0_16_112));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_117)) 
    rom_0_16_117 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[117]), .o_ld_data(acts_0_16_117));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_134)) 
    rom_0_16_134 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[134]), .o_ld_data(acts_0_16_134));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_135)) 
    rom_0_16_135 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[135]), .o_ld_data(acts_0_16_135));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_158)) 
    rom_0_16_158 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[158]), .o_ld_data(acts_0_16_158));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_203)) 
    rom_0_16_203 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[203]), .o_ld_data(acts_0_16_203));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_208)) 
    rom_0_16_208 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[208]), .o_ld_data(acts_0_16_208));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_256)) 
    rom_0_16_256 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[256]), .o_ld_data(acts_0_16_256));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_257)) 
    rom_0_16_257 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[257]), .o_ld_data(acts_0_16_257));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_271)) 
    rom_0_16_271 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[271]), .o_ld_data(acts_0_16_271));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_305)) 
    rom_0_16_305 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[305]), .o_ld_data(acts_0_16_305));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_312)) 
    rom_0_16_312 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[312]), .o_ld_data(acts_0_16_312));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_320)) 
    rom_0_16_320 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[320]), .o_ld_data(acts_0_16_320));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_328)) 
    rom_0_16_328 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[328]), .o_ld_data(acts_0_16_328));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_416)) 
    rom_0_16_416 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[416]), .o_ld_data(acts_0_16_416));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_443)) 
    rom_0_16_443 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[443]), .o_ld_data(acts_0_16_443));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_447)) 
    rom_0_16_447 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[447]), .o_ld_data(acts_0_16_447));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_458)) 
    rom_0_16_458 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[458]), .o_ld_data(acts_0_16_458));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_463)) 
    rom_0_16_463 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[463]), .o_ld_data(acts_0_16_463));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_501)) 
    rom_0_16_501 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[501]), .o_ld_data(acts_0_16_501));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_561)) 
    rom_0_16_561 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[561]), .o_ld_data(acts_0_16_561));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_584)) 
    rom_0_16_584 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[584]), .o_ld_data(acts_0_16_584));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_601)) 
    rom_0_16_601 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[601]), .o_ld_data(acts_0_16_601));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_608)) 
    rom_0_16_608 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[608]), .o_ld_data(acts_0_16_608));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_613)) 
    rom_0_16_613 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[613]), .o_ld_data(acts_0_16_613));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_636)) 
    rom_0_16_636 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[636]), .o_ld_data(acts_0_16_636));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_644)) 
    rom_0_16_644 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[644]), .o_ld_data(acts_0_16_644));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_669)) 
    rom_0_16_669 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[669]), .o_ld_data(acts_0_16_669));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_673)) 
    rom_0_16_673 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[673]), .o_ld_data(acts_0_16_673));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_690)) 
    rom_0_16_690 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[690]), .o_ld_data(acts_0_16_690));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_703)) 
    rom_0_16_703 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[703]), .o_ld_data(acts_0_16_703));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_714)) 
    rom_0_16_714 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[714]), .o_ld_data(acts_0_16_714));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_728)) 
    rom_0_16_728 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[728]), .o_ld_data(acts_0_16_728));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_737)) 
    rom_0_16_737 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[737]), .o_ld_data(acts_0_16_737));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_758)) 
    rom_0_16_758 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[758]), .o_ld_data(acts_0_16_758));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_16_767)) 
    rom_0_16_767 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[767]), .o_ld_data(acts_0_16_767));

  // Stage 1
    assign s_0_16_1_0 = {{2{acts_0_16_12[5]}}, acts_0_16_12} + {{2{acts_0_16_23[5]}}, acts_0_16_23} + {{2{acts_0_16_29[5]}}, acts_0_16_29} + {{2{acts_0_16_75[5]}}, acts_0_16_75};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_0), .q(s_0_16_1_0_reg));

    assign s_0_16_1_1 = {{2{acts_0_16_80[5]}}, acts_0_16_80} + {{2{acts_0_16_112[5]}}, acts_0_16_112} + {{2{acts_0_16_117[5]}}, acts_0_16_117} + {{2{acts_0_16_134[5]}}, acts_0_16_134};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_1), .q(s_0_16_1_1_reg));

    assign s_0_16_1_2 = {{2{acts_0_16_135[5]}}, acts_0_16_135} + {{2{acts_0_16_158[5]}}, acts_0_16_158} + {{2{acts_0_16_203[5]}}, acts_0_16_203} + {{2{acts_0_16_208[5]}}, acts_0_16_208};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_2), .q(s_0_16_1_2_reg));

    assign s_0_16_1_3 = {{2{acts_0_16_256[5]}}, acts_0_16_256} + {{2{acts_0_16_257[5]}}, acts_0_16_257} + {{2{acts_0_16_271[5]}}, acts_0_16_271} + {{2{acts_0_16_305[5]}}, acts_0_16_305};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_3), .q(s_0_16_1_3_reg));

    assign s_0_16_1_4 = {{2{acts_0_16_312[5]}}, acts_0_16_312} + {{2{acts_0_16_320[5]}}, acts_0_16_320} + {{2{acts_0_16_328[5]}}, acts_0_16_328} + {{2{acts_0_16_416[5]}}, acts_0_16_416};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_4), .q(s_0_16_1_4_reg));

    assign s_0_16_1_5 = {{2{acts_0_16_443[5]}}, acts_0_16_443} + {{2{acts_0_16_447[5]}}, acts_0_16_447} + {{2{acts_0_16_458[5]}}, acts_0_16_458} + {{2{acts_0_16_463[5]}}, acts_0_16_463};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_5), .q(s_0_16_1_5_reg));

    assign s_0_16_1_6 = {{2{acts_0_16_501[5]}}, acts_0_16_501} + {{2{acts_0_16_561[5]}}, acts_0_16_561} + {{2{acts_0_16_584[5]}}, acts_0_16_584} + {{2{acts_0_16_601[5]}}, acts_0_16_601};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_6), .q(s_0_16_1_6_reg));

    assign s_0_16_1_7 = {{2{acts_0_16_608[5]}}, acts_0_16_608} + {{2{acts_0_16_613[5]}}, acts_0_16_613} + {{2{acts_0_16_636[5]}}, acts_0_16_636} + {{2{acts_0_16_644[5]}}, acts_0_16_644};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_7), .q(s_0_16_1_7_reg));

    assign s_0_16_1_8 = {{2{acts_0_16_669[5]}}, acts_0_16_669} + {{2{acts_0_16_673[5]}}, acts_0_16_673} + {{2{acts_0_16_690[5]}}, acts_0_16_690} + {{2{acts_0_16_703[5]}}, acts_0_16_703};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_8), .q(s_0_16_1_8_reg));

    assign s_0_16_1_9 = {{2{acts_0_16_714[5]}}, acts_0_16_714} + {{2{acts_0_16_728[5]}}, acts_0_16_728} + {{2{acts_0_16_737[5]}}, acts_0_16_737} + {{2{acts_0_16_758[5]}}, acts_0_16_758};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_9), .q(s_0_16_1_9_reg));

    assign s_0_16_1_10 = {{2{acts_0_16_767[5]}}, acts_0_16_767};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_10), .q(s_0_16_1_10_reg));

  // Stage 2
    assign s_0_16_2_0 = {{2{s_0_16_1_0_reg[7]}}, s_0_16_1_0_reg} + {{2{s_0_16_1_1_reg[7]}}, s_0_16_1_1_reg} + {{2{s_0_16_1_2_reg[7]}}, s_0_16_1_2_reg} + {{2{s_0_16_1_3_reg[7]}}, s_0_16_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_16_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_2_0), .q(s_0_16_2_0_reg));

    assign s_0_16_2_1 = {{2{s_0_16_1_4_reg[7]}}, s_0_16_1_4_reg} + {{2{s_0_16_1_5_reg[7]}}, s_0_16_1_5_reg} + {{2{s_0_16_1_6_reg[7]}}, s_0_16_1_6_reg} + {{2{s_0_16_1_7_reg[7]}}, s_0_16_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_16_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_2_1), .q(s_0_16_2_1_reg));

    assign s_0_16_2_2 = {{2{s_0_16_1_8_reg[7]}}, s_0_16_1_8_reg} + {{2{s_0_16_1_9_reg[7]}}, s_0_16_1_9_reg} + {{2{s_0_16_1_10_reg[7]}}, s_0_16_1_10_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_16_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_2_2), .q(s_0_16_2_2_reg));

  // Stage 3
    assign s_0_16_3_0 = {{2{s_0_16_2_0_reg[9]}}, s_0_16_2_0_reg} + {{2{s_0_16_2_1_reg[9]}}, s_0_16_2_1_reg} + {{2{s_0_16_2_2_reg[9]}}, s_0_16_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_16_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_3_0), .q(s_0_16_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_16_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_16_3_0_reg[11]}}, s_0_16_3_0_reg}), .q(sum_0_16_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_16 (.i_data(sum_0_16_reg), .o_data(out_0_16_sat));


    // Layer 0, Node 17
      logic  [11:0] s_0_17_3_0;
    logic  [11:0] s_0_17_3_0_reg;
    logic  [7:0] s_0_17_1_0, s_0_17_1_1, s_0_17_1_2, s_0_17_1_3, s_0_17_1_4, s_0_17_1_5, s_0_17_1_6, s_0_17_1_7;
    logic  [7:0] s_0_17_1_0_reg, s_0_17_1_1_reg, s_0_17_1_2_reg, s_0_17_1_3_reg, s_0_17_1_4_reg, s_0_17_1_5_reg, s_0_17_1_6_reg, s_0_17_1_7_reg;
    logic  [9:0] s_0_17_2_0, s_0_17_2_1;
    logic  [9:0] s_0_17_2_0_reg, s_0_17_2_1_reg;
    logic [13:0] sum_0_17;
    logic [13:0] sum_0_17_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_4)) 
    rom_0_17_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_17_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_12)) 
    rom_0_17_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_17_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_40)) 
    rom_0_17_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_17_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_41)) 
    rom_0_17_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[41]), .o_ld_data(acts_0_17_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_43)) 
    rom_0_17_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[43]), .o_ld_data(acts_0_17_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_52)) 
    rom_0_17_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[52]), .o_ld_data(acts_0_17_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_67)) 
    rom_0_17_67 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[67]), .o_ld_data(acts_0_17_67));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_142)) 
    rom_0_17_142 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[142]), .o_ld_data(acts_0_17_142));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_171)) 
    rom_0_17_171 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[171]), .o_ld_data(acts_0_17_171));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_199)) 
    rom_0_17_199 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[199]), .o_ld_data(acts_0_17_199));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_226)) 
    rom_0_17_226 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[226]), .o_ld_data(acts_0_17_226));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_249)) 
    rom_0_17_249 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[249]), .o_ld_data(acts_0_17_249));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_276)) 
    rom_0_17_276 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[276]), .o_ld_data(acts_0_17_276));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_280)) 
    rom_0_17_280 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[280]), .o_ld_data(acts_0_17_280));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_347)) 
    rom_0_17_347 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[347]), .o_ld_data(acts_0_17_347));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_354)) 
    rom_0_17_354 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[354]), .o_ld_data(acts_0_17_354));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_390)) 
    rom_0_17_390 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[390]), .o_ld_data(acts_0_17_390));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_421)) 
    rom_0_17_421 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[421]), .o_ld_data(acts_0_17_421));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_448)) 
    rom_0_17_448 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[448]), .o_ld_data(acts_0_17_448));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_485)) 
    rom_0_17_485 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[485]), .o_ld_data(acts_0_17_485));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_490)) 
    rom_0_17_490 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[490]), .o_ld_data(acts_0_17_490));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_505)) 
    rom_0_17_505 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[505]), .o_ld_data(acts_0_17_505));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_518)) 
    rom_0_17_518 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[518]), .o_ld_data(acts_0_17_518));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_529)) 
    rom_0_17_529 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[529]), .o_ld_data(acts_0_17_529));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_546)) 
    rom_0_17_546 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[546]), .o_ld_data(acts_0_17_546));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_583)) 
    rom_0_17_583 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[583]), .o_ld_data(acts_0_17_583));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_702)) 
    rom_0_17_702 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[702]), .o_ld_data(acts_0_17_702));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_703)) 
    rom_0_17_703 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[703]), .o_ld_data(acts_0_17_703));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_704)) 
    rom_0_17_704 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[704]), .o_ld_data(acts_0_17_704));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_715)) 
    rom_0_17_715 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[715]), .o_ld_data(acts_0_17_715));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_743)) 
    rom_0_17_743 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[743]), .o_ld_data(acts_0_17_743));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_17_770)) 
    rom_0_17_770 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[770]), .o_ld_data(acts_0_17_770));

  // Stage 1
    assign s_0_17_1_0 = {{2{acts_0_17_4[5]}}, acts_0_17_4} + {{2{acts_0_17_12[5]}}, acts_0_17_12} + {{2{acts_0_17_40[5]}}, acts_0_17_40} + {{2{acts_0_17_41[5]}}, acts_0_17_41};
    registers #(.ARRAY_WIDTH(8)) r_0_17_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_1_0), .q(s_0_17_1_0_reg));

    assign s_0_17_1_1 = {{2{acts_0_17_43[5]}}, acts_0_17_43} + {{2{acts_0_17_52[5]}}, acts_0_17_52} + {{2{acts_0_17_67[5]}}, acts_0_17_67} + {{2{acts_0_17_142[5]}}, acts_0_17_142};
    registers #(.ARRAY_WIDTH(8)) r_0_17_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_1_1), .q(s_0_17_1_1_reg));

    assign s_0_17_1_2 = {{2{acts_0_17_171[5]}}, acts_0_17_171} + {{2{acts_0_17_199[5]}}, acts_0_17_199} + {{2{acts_0_17_226[5]}}, acts_0_17_226} + {{2{acts_0_17_249[5]}}, acts_0_17_249};
    registers #(.ARRAY_WIDTH(8)) r_0_17_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_1_2), .q(s_0_17_1_2_reg));

    assign s_0_17_1_3 = {{2{acts_0_17_276[5]}}, acts_0_17_276} + {{2{acts_0_17_280[5]}}, acts_0_17_280} + {{2{acts_0_17_347[5]}}, acts_0_17_347} + {{2{acts_0_17_354[5]}}, acts_0_17_354};
    registers #(.ARRAY_WIDTH(8)) r_0_17_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_1_3), .q(s_0_17_1_3_reg));

    assign s_0_17_1_4 = {{2{acts_0_17_390[5]}}, acts_0_17_390} + {{2{acts_0_17_421[5]}}, acts_0_17_421} + {{2{acts_0_17_448[5]}}, acts_0_17_448} + {{2{acts_0_17_485[5]}}, acts_0_17_485};
    registers #(.ARRAY_WIDTH(8)) r_0_17_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_1_4), .q(s_0_17_1_4_reg));

    assign s_0_17_1_5 = {{2{acts_0_17_490[5]}}, acts_0_17_490} + {{2{acts_0_17_505[5]}}, acts_0_17_505} + {{2{acts_0_17_518[5]}}, acts_0_17_518} + {{2{acts_0_17_529[5]}}, acts_0_17_529};
    registers #(.ARRAY_WIDTH(8)) r_0_17_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_1_5), .q(s_0_17_1_5_reg));

    assign s_0_17_1_6 = {{2{acts_0_17_546[5]}}, acts_0_17_546} + {{2{acts_0_17_583[5]}}, acts_0_17_583} + {{2{acts_0_17_702[5]}}, acts_0_17_702} + {{2{acts_0_17_703[5]}}, acts_0_17_703};
    registers #(.ARRAY_WIDTH(8)) r_0_17_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_1_6), .q(s_0_17_1_6_reg));

    assign s_0_17_1_7 = {{2{acts_0_17_704[5]}}, acts_0_17_704} + {{2{acts_0_17_715[5]}}, acts_0_17_715} + {{2{acts_0_17_743[5]}}, acts_0_17_743} + {{2{acts_0_17_770[5]}}, acts_0_17_770};
    registers #(.ARRAY_WIDTH(8)) r_0_17_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_1_7), .q(s_0_17_1_7_reg));

  // Stage 2
    assign s_0_17_2_0 = {{2{s_0_17_1_0_reg[7]}}, s_0_17_1_0_reg} + {{2{s_0_17_1_1_reg[7]}}, s_0_17_1_1_reg} + {{2{s_0_17_1_2_reg[7]}}, s_0_17_1_2_reg} + {{2{s_0_17_1_3_reg[7]}}, s_0_17_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_17_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_2_0), .q(s_0_17_2_0_reg));

    assign s_0_17_2_1 = {{2{s_0_17_1_4_reg[7]}}, s_0_17_1_4_reg} + {{2{s_0_17_1_5_reg[7]}}, s_0_17_1_5_reg} + {{2{s_0_17_1_6_reg[7]}}, s_0_17_1_6_reg} + {{2{s_0_17_1_7_reg[7]}}, s_0_17_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_17_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_2_1), .q(s_0_17_2_1_reg));

  // Stage 3
    assign s_0_17_3_0 = {{2{s_0_17_2_0_reg[9]}}, s_0_17_2_0_reg} + {{2{s_0_17_2_1_reg[9]}}, s_0_17_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_17_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_3_0), .q(s_0_17_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_17_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_17_3_0_reg[11]}}, s_0_17_3_0_reg}), .q(sum_0_17_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_17 (.i_data(sum_0_17_reg), .o_data(out_0_17_sat));


    // Layer 0, Node 18
      logic  [11:0] s_0_18_3_0;
    logic  [11:0] s_0_18_3_0_reg;
    logic  [7:0] s_0_18_1_0, s_0_18_1_1, s_0_18_1_2, s_0_18_1_3, s_0_18_1_4, s_0_18_1_5, s_0_18_1_6;
    logic  [7:0] s_0_18_1_0_reg, s_0_18_1_1_reg, s_0_18_1_2_reg, s_0_18_1_3_reg, s_0_18_1_4_reg, s_0_18_1_5_reg, s_0_18_1_6_reg;
    logic  [9:0] s_0_18_2_0, s_0_18_2_1;
    logic  [9:0] s_0_18_2_0_reg, s_0_18_2_1_reg;
    logic [13:0] sum_0_18;
    logic [13:0] sum_0_18_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_71)) 
    rom_0_18_71 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[71]), .o_ld_data(acts_0_18_71));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_131)) 
    rom_0_18_131 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[131]), .o_ld_data(acts_0_18_131));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_157)) 
    rom_0_18_157 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[157]), .o_ld_data(acts_0_18_157));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_158)) 
    rom_0_18_158 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[158]), .o_ld_data(acts_0_18_158));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_184)) 
    rom_0_18_184 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[184]), .o_ld_data(acts_0_18_184));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_238)) 
    rom_0_18_238 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[238]), .o_ld_data(acts_0_18_238));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_239)) 
    rom_0_18_239 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[239]), .o_ld_data(acts_0_18_239));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_240)) 
    rom_0_18_240 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[240]), .o_ld_data(acts_0_18_240));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_241)) 
    rom_0_18_241 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[241]), .o_ld_data(acts_0_18_241));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_242)) 
    rom_0_18_242 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[242]), .o_ld_data(acts_0_18_242));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_244)) 
    rom_0_18_244 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[244]), .o_ld_data(acts_0_18_244));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_245)) 
    rom_0_18_245 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[245]), .o_ld_data(acts_0_18_245));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_265)) 
    rom_0_18_265 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[265]), .o_ld_data(acts_0_18_265));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_267)) 
    rom_0_18_267 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[267]), .o_ld_data(acts_0_18_267));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_269)) 
    rom_0_18_269 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[269]), .o_ld_data(acts_0_18_269));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_270)) 
    rom_0_18_270 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[270]), .o_ld_data(acts_0_18_270));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_271)) 
    rom_0_18_271 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[271]), .o_ld_data(acts_0_18_271));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_322)) 
    rom_0_18_322 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[322]), .o_ld_data(acts_0_18_322));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_324)) 
    rom_0_18_324 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[324]), .o_ld_data(acts_0_18_324));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_325)) 
    rom_0_18_325 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[325]), .o_ld_data(acts_0_18_325));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_326)) 
    rom_0_18_326 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[326]), .o_ld_data(acts_0_18_326));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_353)) 
    rom_0_18_353 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[353]), .o_ld_data(acts_0_18_353));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_488)) 
    rom_0_18_488 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[488]), .o_ld_data(acts_0_18_488));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_489)) 
    rom_0_18_489 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[489]), .o_ld_data(acts_0_18_489));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_18_740)) 
    rom_0_18_740 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[740]), .o_ld_data(acts_0_18_740));

  // Stage 1
    assign s_0_18_1_0 = {{2{acts_0_18_71[5]}}, acts_0_18_71} + {{2{acts_0_18_131[5]}}, acts_0_18_131} + {{2{acts_0_18_157[5]}}, acts_0_18_157} + {{2{acts_0_18_158[5]}}, acts_0_18_158};
    registers #(.ARRAY_WIDTH(8)) r_0_18_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_1_0), .q(s_0_18_1_0_reg));

    assign s_0_18_1_1 = {{2{acts_0_18_184[5]}}, acts_0_18_184} + {{2{acts_0_18_238[5]}}, acts_0_18_238} + {{2{acts_0_18_239[5]}}, acts_0_18_239} + {{2{acts_0_18_240[5]}}, acts_0_18_240};
    registers #(.ARRAY_WIDTH(8)) r_0_18_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_1_1), .q(s_0_18_1_1_reg));

    assign s_0_18_1_2 = {{2{acts_0_18_241[5]}}, acts_0_18_241} + {{2{acts_0_18_242[5]}}, acts_0_18_242} + {{2{acts_0_18_244[5]}}, acts_0_18_244} + {{2{acts_0_18_245[5]}}, acts_0_18_245};
    registers #(.ARRAY_WIDTH(8)) r_0_18_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_1_2), .q(s_0_18_1_2_reg));

    assign s_0_18_1_3 = {{2{acts_0_18_265[5]}}, acts_0_18_265} + {{2{acts_0_18_267[5]}}, acts_0_18_267} + {{2{acts_0_18_269[5]}}, acts_0_18_269} + {{2{acts_0_18_270[5]}}, acts_0_18_270};
    registers #(.ARRAY_WIDTH(8)) r_0_18_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_1_3), .q(s_0_18_1_3_reg));

    assign s_0_18_1_4 = {{2{acts_0_18_271[5]}}, acts_0_18_271} + {{2{acts_0_18_322[5]}}, acts_0_18_322} + {{2{acts_0_18_324[5]}}, acts_0_18_324} + {{2{acts_0_18_325[5]}}, acts_0_18_325};
    registers #(.ARRAY_WIDTH(8)) r_0_18_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_1_4), .q(s_0_18_1_4_reg));

    assign s_0_18_1_5 = {{2{acts_0_18_326[5]}}, acts_0_18_326} + {{2{acts_0_18_353[5]}}, acts_0_18_353} + {{2{acts_0_18_488[5]}}, acts_0_18_488} + {{2{acts_0_18_489[5]}}, acts_0_18_489};
    registers #(.ARRAY_WIDTH(8)) r_0_18_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_1_5), .q(s_0_18_1_5_reg));

    assign s_0_18_1_6 = {{2{acts_0_18_740[5]}}, acts_0_18_740};
    registers #(.ARRAY_WIDTH(8)) r_0_18_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_1_6), .q(s_0_18_1_6_reg));

  // Stage 2
    assign s_0_18_2_0 = {{2{s_0_18_1_0_reg[7]}}, s_0_18_1_0_reg} + {{2{s_0_18_1_1_reg[7]}}, s_0_18_1_1_reg} + {{2{s_0_18_1_2_reg[7]}}, s_0_18_1_2_reg} + {{2{s_0_18_1_3_reg[7]}}, s_0_18_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_18_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_2_0), .q(s_0_18_2_0_reg));

    assign s_0_18_2_1 = {{2{s_0_18_1_4_reg[7]}}, s_0_18_1_4_reg} + {{2{s_0_18_1_5_reg[7]}}, s_0_18_1_5_reg} + {{2{s_0_18_1_6_reg[7]}}, s_0_18_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_18_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_2_1), .q(s_0_18_2_1_reg));

  // Stage 3
    assign s_0_18_3_0 = {{2{s_0_18_2_0_reg[9]}}, s_0_18_2_0_reg} + {{2{s_0_18_2_1_reg[9]}}, s_0_18_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_18_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_3_0), .q(s_0_18_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_18_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_18_3_0_reg[11]}}, s_0_18_3_0_reg}), .q(sum_0_18_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_18 (.i_data(sum_0_18_reg), .o_data(out_0_18_sat));


    // Layer 0, Node 19
      logic  [11:0] s_0_19_3_0;
    logic  [11:0] s_0_19_3_0_reg;
    logic  [7:0] s_0_19_1_0, s_0_19_1_1, s_0_19_1_2, s_0_19_1_3, s_0_19_1_4, s_0_19_1_5, s_0_19_1_6, s_0_19_1_7, s_0_19_1_8;
    logic  [7:0] s_0_19_1_0_reg, s_0_19_1_1_reg, s_0_19_1_2_reg, s_0_19_1_3_reg, s_0_19_1_4_reg, s_0_19_1_5_reg, s_0_19_1_6_reg, s_0_19_1_7_reg, s_0_19_1_8_reg;
    logic  [9:0] s_0_19_2_0, s_0_19_2_1, s_0_19_2_2;
    logic  [9:0] s_0_19_2_0_reg, s_0_19_2_1_reg, s_0_19_2_2_reg;
    logic [13:0] sum_0_19;
    logic [13:0] sum_0_19_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_245)) 
    rom_0_19_245 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[245]), .o_ld_data(acts_0_19_245));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_260)) 
    rom_0_19_260 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[260]), .o_ld_data(acts_0_19_260));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_321)) 
    rom_0_19_321 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[321]), .o_ld_data(acts_0_19_321));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_330)) 
    rom_0_19_330 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[330]), .o_ld_data(acts_0_19_330));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_359)) 
    rom_0_19_359 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[359]), .o_ld_data(acts_0_19_359));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_386)) 
    rom_0_19_386 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[386]), .o_ld_data(acts_0_19_386));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_387)) 
    rom_0_19_387 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[387]), .o_ld_data(acts_0_19_387));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_407)) 
    rom_0_19_407 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[407]), .o_ld_data(acts_0_19_407));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_411)) 
    rom_0_19_411 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[411]), .o_ld_data(acts_0_19_411));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_412)) 
    rom_0_19_412 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[412]), .o_ld_data(acts_0_19_412));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_414)) 
    rom_0_19_414 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[414]), .o_ld_data(acts_0_19_414));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_417)) 
    rom_0_19_417 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[417]), .o_ld_data(acts_0_19_417));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_428)) 
    rom_0_19_428 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[428]), .o_ld_data(acts_0_19_428));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_439)) 
    rom_0_19_439 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[439]), .o_ld_data(acts_0_19_439));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_461)) 
    rom_0_19_461 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[461]), .o_ld_data(acts_0_19_461));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_488)) 
    rom_0_19_488 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[488]), .o_ld_data(acts_0_19_488));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_489)) 
    rom_0_19_489 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[489]), .o_ld_data(acts_0_19_489));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_490)) 
    rom_0_19_490 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[490]), .o_ld_data(acts_0_19_490));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_493)) 
    rom_0_19_493 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[493]), .o_ld_data(acts_0_19_493));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_573)) 
    rom_0_19_573 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[573]), .o_ld_data(acts_0_19_573));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_574)) 
    rom_0_19_574 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[574]), .o_ld_data(acts_0_19_574));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_575)) 
    rom_0_19_575 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[575]), .o_ld_data(acts_0_19_575));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_595)) 
    rom_0_19_595 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[595]), .o_ld_data(acts_0_19_595));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_600)) 
    rom_0_19_600 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[600]), .o_ld_data(acts_0_19_600));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_601)) 
    rom_0_19_601 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[601]), .o_ld_data(acts_0_19_601));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_602)) 
    rom_0_19_602 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[602]), .o_ld_data(acts_0_19_602));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_625)) 
    rom_0_19_625 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[625]), .o_ld_data(acts_0_19_625));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_628)) 
    rom_0_19_628 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[628]), .o_ld_data(acts_0_19_628));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_629)) 
    rom_0_19_629 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[629]), .o_ld_data(acts_0_19_629));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_653)) 
    rom_0_19_653 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[653]), .o_ld_data(acts_0_19_653));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_655)) 
    rom_0_19_655 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[655]), .o_ld_data(acts_0_19_655));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_656)) 
    rom_0_19_656 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[656]), .o_ld_data(acts_0_19_656));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_657)) 
    rom_0_19_657 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[657]), .o_ld_data(acts_0_19_657));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_682)) 
    rom_0_19_682 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[682]), .o_ld_data(acts_0_19_682));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_19_751)) 
    rom_0_19_751 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[751]), .o_ld_data(acts_0_19_751));

  // Stage 1
    assign s_0_19_1_0 = {{2{acts_0_19_245[5]}}, acts_0_19_245} + {{2{acts_0_19_260[5]}}, acts_0_19_260} + {{2{acts_0_19_321[5]}}, acts_0_19_321} + {{2{acts_0_19_330[5]}}, acts_0_19_330};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_0), .q(s_0_19_1_0_reg));

    assign s_0_19_1_1 = {{2{acts_0_19_359[5]}}, acts_0_19_359} + {{2{acts_0_19_386[5]}}, acts_0_19_386} + {{2{acts_0_19_387[5]}}, acts_0_19_387} + {{2{acts_0_19_407[5]}}, acts_0_19_407};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_1), .q(s_0_19_1_1_reg));

    assign s_0_19_1_2 = {{2{acts_0_19_411[5]}}, acts_0_19_411} + {{2{acts_0_19_412[5]}}, acts_0_19_412} + {{2{acts_0_19_414[5]}}, acts_0_19_414} + {{2{acts_0_19_417[5]}}, acts_0_19_417};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_2), .q(s_0_19_1_2_reg));

    assign s_0_19_1_3 = {{2{acts_0_19_428[5]}}, acts_0_19_428} + {{2{acts_0_19_439[5]}}, acts_0_19_439} + {{2{acts_0_19_461[5]}}, acts_0_19_461} + {{2{acts_0_19_488[5]}}, acts_0_19_488};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_3), .q(s_0_19_1_3_reg));

    assign s_0_19_1_4 = {{2{acts_0_19_489[5]}}, acts_0_19_489} + {{2{acts_0_19_490[5]}}, acts_0_19_490} + {{2{acts_0_19_493[5]}}, acts_0_19_493} + {{2{acts_0_19_573[5]}}, acts_0_19_573};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_4), .q(s_0_19_1_4_reg));

    assign s_0_19_1_5 = {{2{acts_0_19_574[5]}}, acts_0_19_574} + {{2{acts_0_19_575[5]}}, acts_0_19_575} + {{2{acts_0_19_595[5]}}, acts_0_19_595} + {{2{acts_0_19_600[5]}}, acts_0_19_600};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_5), .q(s_0_19_1_5_reg));

    assign s_0_19_1_6 = {{2{acts_0_19_601[5]}}, acts_0_19_601} + {{2{acts_0_19_602[5]}}, acts_0_19_602} + {{2{acts_0_19_625[5]}}, acts_0_19_625} + {{2{acts_0_19_628[5]}}, acts_0_19_628};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_6), .q(s_0_19_1_6_reg));

    assign s_0_19_1_7 = {{2{acts_0_19_629[5]}}, acts_0_19_629} + {{2{acts_0_19_653[5]}}, acts_0_19_653} + {{2{acts_0_19_655[5]}}, acts_0_19_655} + {{2{acts_0_19_656[5]}}, acts_0_19_656};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_7), .q(s_0_19_1_7_reg));

    assign s_0_19_1_8 = {{2{acts_0_19_657[5]}}, acts_0_19_657} + {{2{acts_0_19_682[5]}}, acts_0_19_682} + {{2{acts_0_19_751[5]}}, acts_0_19_751};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_8), .q(s_0_19_1_8_reg));

  // Stage 2
    assign s_0_19_2_0 = {{2{s_0_19_1_0_reg[7]}}, s_0_19_1_0_reg} + {{2{s_0_19_1_1_reg[7]}}, s_0_19_1_1_reg} + {{2{s_0_19_1_2_reg[7]}}, s_0_19_1_2_reg} + {{2{s_0_19_1_3_reg[7]}}, s_0_19_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_19_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_2_0), .q(s_0_19_2_0_reg));

    assign s_0_19_2_1 = {{2{s_0_19_1_4_reg[7]}}, s_0_19_1_4_reg} + {{2{s_0_19_1_5_reg[7]}}, s_0_19_1_5_reg} + {{2{s_0_19_1_6_reg[7]}}, s_0_19_1_6_reg} + {{2{s_0_19_1_7_reg[7]}}, s_0_19_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_19_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_2_1), .q(s_0_19_2_1_reg));

    assign s_0_19_2_2 = {{2{s_0_19_1_8_reg[7]}}, s_0_19_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_19_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_2_2), .q(s_0_19_2_2_reg));

  // Stage 3
    assign s_0_19_3_0 = {{2{s_0_19_2_0_reg[9]}}, s_0_19_2_0_reg} + {{2{s_0_19_2_1_reg[9]}}, s_0_19_2_1_reg} + {{2{s_0_19_2_2_reg[9]}}, s_0_19_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_19_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_3_0), .q(s_0_19_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_19_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_19_3_0_reg[11]}}, s_0_19_3_0_reg}), .q(sum_0_19_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_19 (.i_data(sum_0_19_reg), .o_data(out_0_19_sat));


    // Layer 0, Node 20
      logic  [11:0] s_0_20_3_0;
    logic  [11:0] s_0_20_3_0_reg;
    logic  [7:0] s_0_20_1_0, s_0_20_1_1, s_0_20_1_2, s_0_20_1_3, s_0_20_1_4, s_0_20_1_5, s_0_20_1_6, s_0_20_1_7, s_0_20_1_8;
    logic  [7:0] s_0_20_1_0_reg, s_0_20_1_1_reg, s_0_20_1_2_reg, s_0_20_1_3_reg, s_0_20_1_4_reg, s_0_20_1_5_reg, s_0_20_1_6_reg, s_0_20_1_7_reg, s_0_20_1_8_reg;
    logic  [9:0] s_0_20_2_0, s_0_20_2_1, s_0_20_2_2;
    logic  [9:0] s_0_20_2_0_reg, s_0_20_2_1_reg, s_0_20_2_2_reg;
    logic [13:0] sum_0_20;
    logic [13:0] sum_0_20_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_123)) 
    rom_0_20_123 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[123]), .o_ld_data(acts_0_20_123));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_124)) 
    rom_0_20_124 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[124]), .o_ld_data(acts_0_20_124));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_125)) 
    rom_0_20_125 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[125]), .o_ld_data(acts_0_20_125));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_127)) 
    rom_0_20_127 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[127]), .o_ld_data(acts_0_20_127));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_128)) 
    rom_0_20_128 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[128]), .o_ld_data(acts_0_20_128));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_158)) 
    rom_0_20_158 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[158]), .o_ld_data(acts_0_20_158));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_179)) 
    rom_0_20_179 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[179]), .o_ld_data(acts_0_20_179));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_180)) 
    rom_0_20_180 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[180]), .o_ld_data(acts_0_20_180));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_204)) 
    rom_0_20_204 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[204]), .o_ld_data(acts_0_20_204));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_206)) 
    rom_0_20_206 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[206]), .o_ld_data(acts_0_20_206));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_207)) 
    rom_0_20_207 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[207]), .o_ld_data(acts_0_20_207));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_208)) 
    rom_0_20_208 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[208]), .o_ld_data(acts_0_20_208));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_233)) 
    rom_0_20_233 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[233]), .o_ld_data(acts_0_20_233));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_235)) 
    rom_0_20_235 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[235]), .o_ld_data(acts_0_20_235));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_239)) 
    rom_0_20_239 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[239]), .o_ld_data(acts_0_20_239));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_240)) 
    rom_0_20_240 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[240]), .o_ld_data(acts_0_20_240));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_241)) 
    rom_0_20_241 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[241]), .o_ld_data(acts_0_20_241));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_259)) 
    rom_0_20_259 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[259]), .o_ld_data(acts_0_20_259));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_261)) 
    rom_0_20_261 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[261]), .o_ld_data(acts_0_20_261));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_272)) 
    rom_0_20_272 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[272]), .o_ld_data(acts_0_20_272));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_314)) 
    rom_0_20_314 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[314]), .o_ld_data(acts_0_20_314));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_320)) 
    rom_0_20_320 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[320]), .o_ld_data(acts_0_20_320));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_323)) 
    rom_0_20_323 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[323]), .o_ld_data(acts_0_20_323));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_327)) 
    rom_0_20_327 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[327]), .o_ld_data(acts_0_20_327));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_329)) 
    rom_0_20_329 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[329]), .o_ld_data(acts_0_20_329));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_344)) 
    rom_0_20_344 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[344]), .o_ld_data(acts_0_20_344));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_347)) 
    rom_0_20_347 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[347]), .o_ld_data(acts_0_20_347));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_348)) 
    rom_0_20_348 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[348]), .o_ld_data(acts_0_20_348));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_350)) 
    rom_0_20_350 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[350]), .o_ld_data(acts_0_20_350));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_405)) 
    rom_0_20_405 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[405]), .o_ld_data(acts_0_20_405));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_462)) 
    rom_0_20_462 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[462]), .o_ld_data(acts_0_20_462));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_516)) 
    rom_0_20_516 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[516]), .o_ld_data(acts_0_20_516));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_544)) 
    rom_0_20_544 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[544]), .o_ld_data(acts_0_20_544));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_593)) 
    rom_0_20_593 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[593]), .o_ld_data(acts_0_20_593));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_654)) 
    rom_0_20_654 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[654]), .o_ld_data(acts_0_20_654));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_20_732)) 
    rom_0_20_732 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[732]), .o_ld_data(acts_0_20_732));

  // Stage 1
    assign s_0_20_1_0 = {{2{acts_0_20_123[5]}}, acts_0_20_123} + {{2{acts_0_20_124[5]}}, acts_0_20_124} + {{2{acts_0_20_125[5]}}, acts_0_20_125} + {{2{acts_0_20_127[5]}}, acts_0_20_127};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_0), .q(s_0_20_1_0_reg));

    assign s_0_20_1_1 = {{2{acts_0_20_128[5]}}, acts_0_20_128} + {{2{acts_0_20_158[5]}}, acts_0_20_158} + {{2{acts_0_20_179[5]}}, acts_0_20_179} + {{2{acts_0_20_180[5]}}, acts_0_20_180};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_1), .q(s_0_20_1_1_reg));

    assign s_0_20_1_2 = {{2{acts_0_20_204[5]}}, acts_0_20_204} + {{2{acts_0_20_206[5]}}, acts_0_20_206} + {{2{acts_0_20_207[5]}}, acts_0_20_207} + {{2{acts_0_20_208[5]}}, acts_0_20_208};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_2), .q(s_0_20_1_2_reg));

    assign s_0_20_1_3 = {{2{acts_0_20_233[5]}}, acts_0_20_233} + {{2{acts_0_20_235[5]}}, acts_0_20_235} + {{2{acts_0_20_239[5]}}, acts_0_20_239} + {{2{acts_0_20_240[5]}}, acts_0_20_240};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_3), .q(s_0_20_1_3_reg));

    assign s_0_20_1_4 = {{2{acts_0_20_241[5]}}, acts_0_20_241} + {{2{acts_0_20_259[5]}}, acts_0_20_259} + {{2{acts_0_20_261[5]}}, acts_0_20_261} + {{2{acts_0_20_272[5]}}, acts_0_20_272};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_4), .q(s_0_20_1_4_reg));

    assign s_0_20_1_5 = {{2{acts_0_20_314[5]}}, acts_0_20_314} + {{2{acts_0_20_320[5]}}, acts_0_20_320} + {{2{acts_0_20_323[5]}}, acts_0_20_323} + {{2{acts_0_20_327[5]}}, acts_0_20_327};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_5), .q(s_0_20_1_5_reg));

    assign s_0_20_1_6 = {{2{acts_0_20_329[5]}}, acts_0_20_329} + {{2{acts_0_20_344[5]}}, acts_0_20_344} + {{2{acts_0_20_347[5]}}, acts_0_20_347} + {{2{acts_0_20_348[5]}}, acts_0_20_348};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_6), .q(s_0_20_1_6_reg));

    assign s_0_20_1_7 = {{2{acts_0_20_350[5]}}, acts_0_20_350} + {{2{acts_0_20_405[5]}}, acts_0_20_405} + {{2{acts_0_20_462[5]}}, acts_0_20_462} + {{2{acts_0_20_516[5]}}, acts_0_20_516};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_7), .q(s_0_20_1_7_reg));

    assign s_0_20_1_8 = {{2{acts_0_20_544[5]}}, acts_0_20_544} + {{2{acts_0_20_593[5]}}, acts_0_20_593} + {{2{acts_0_20_654[5]}}, acts_0_20_654} + {{2{acts_0_20_732[5]}}, acts_0_20_732};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_8), .q(s_0_20_1_8_reg));

  // Stage 2
    assign s_0_20_2_0 = {{2{s_0_20_1_0_reg[7]}}, s_0_20_1_0_reg} + {{2{s_0_20_1_1_reg[7]}}, s_0_20_1_1_reg} + {{2{s_0_20_1_2_reg[7]}}, s_0_20_1_2_reg} + {{2{s_0_20_1_3_reg[7]}}, s_0_20_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_20_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_2_0), .q(s_0_20_2_0_reg));

    assign s_0_20_2_1 = {{2{s_0_20_1_4_reg[7]}}, s_0_20_1_4_reg} + {{2{s_0_20_1_5_reg[7]}}, s_0_20_1_5_reg} + {{2{s_0_20_1_6_reg[7]}}, s_0_20_1_6_reg} + {{2{s_0_20_1_7_reg[7]}}, s_0_20_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_20_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_2_1), .q(s_0_20_2_1_reg));

    assign s_0_20_2_2 = {{2{s_0_20_1_8_reg[7]}}, s_0_20_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_20_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_2_2), .q(s_0_20_2_2_reg));

  // Stage 3
    assign s_0_20_3_0 = {{2{s_0_20_2_0_reg[9]}}, s_0_20_2_0_reg} + {{2{s_0_20_2_1_reg[9]}}, s_0_20_2_1_reg} + {{2{s_0_20_2_2_reg[9]}}, s_0_20_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_20_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_3_0), .q(s_0_20_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_20_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_20_3_0_reg[11]}}, s_0_20_3_0_reg}), .q(sum_0_20_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_20 (.i_data(sum_0_20_reg), .o_data(out_0_20_sat));


    // Layer 0, Node 21
      logic  [11:0] s_0_21_3_0;
    logic  [11:0] s_0_21_3_0_reg;
    logic  [7:0] s_0_21_1_0, s_0_21_1_1, s_0_21_1_2, s_0_21_1_3, s_0_21_1_4, s_0_21_1_5;
    logic  [7:0] s_0_21_1_0_reg, s_0_21_1_1_reg, s_0_21_1_2_reg, s_0_21_1_3_reg, s_0_21_1_4_reg, s_0_21_1_5_reg;
    logic  [9:0] s_0_21_2_0, s_0_21_2_1;
    logic  [9:0] s_0_21_2_0_reg, s_0_21_2_1_reg;
    logic [13:0] sum_0_21;
    logic [13:0] sum_0_21_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_152)) 
    rom_0_21_152 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[152]), .o_ld_data(acts_0_21_152));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_180)) 
    rom_0_21_180 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[180]), .o_ld_data(acts_0_21_180));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_181)) 
    rom_0_21_181 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[181]), .o_ld_data(acts_0_21_181));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_208)) 
    rom_0_21_208 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[208]), .o_ld_data(acts_0_21_208));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_236)) 
    rom_0_21_236 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[236]), .o_ld_data(acts_0_21_236));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_239)) 
    rom_0_21_239 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[239]), .o_ld_data(acts_0_21_239));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_251)) 
    rom_0_21_251 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[251]), .o_ld_data(acts_0_21_251));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_264)) 
    rom_0_21_264 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[264]), .o_ld_data(acts_0_21_264));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_265)) 
    rom_0_21_265 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[265]), .o_ld_data(acts_0_21_265));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_292)) 
    rom_0_21_292 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[292]), .o_ld_data(acts_0_21_292));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_293)) 
    rom_0_21_293 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[293]), .o_ld_data(acts_0_21_293));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_298)) 
    rom_0_21_298 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[298]), .o_ld_data(acts_0_21_298));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_320)) 
    rom_0_21_320 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[320]), .o_ld_data(acts_0_21_320));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_404)) 
    rom_0_21_404 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[404]), .o_ld_data(acts_0_21_404));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_429)) 
    rom_0_21_429 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[429]), .o_ld_data(acts_0_21_429));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_430)) 
    rom_0_21_430 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[430]), .o_ld_data(acts_0_21_430));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_444)) 
    rom_0_21_444 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[444]), .o_ld_data(acts_0_21_444));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_472)) 
    rom_0_21_472 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[472]), .o_ld_data(acts_0_21_472));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_482)) 
    rom_0_21_482 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[482]), .o_ld_data(acts_0_21_482));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_483)) 
    rom_0_21_483 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[483]), .o_ld_data(acts_0_21_483));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_485)) 
    rom_0_21_485 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[485]), .o_ld_data(acts_0_21_485));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_567)) 
    rom_0_21_567 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[567]), .o_ld_data(acts_0_21_567));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_601)) 
    rom_0_21_601 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[601]), .o_ld_data(acts_0_21_601));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_21_682)) 
    rom_0_21_682 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[682]), .o_ld_data(acts_0_21_682));

  // Stage 1
    assign s_0_21_1_0 = {{2{acts_0_21_152[5]}}, acts_0_21_152} + {{2{acts_0_21_180[5]}}, acts_0_21_180} + {{2{acts_0_21_181[5]}}, acts_0_21_181} + {{2{acts_0_21_208[5]}}, acts_0_21_208};
    registers #(.ARRAY_WIDTH(8)) r_0_21_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_1_0), .q(s_0_21_1_0_reg));

    assign s_0_21_1_1 = {{2{acts_0_21_236[5]}}, acts_0_21_236} + {{2{acts_0_21_239[5]}}, acts_0_21_239} + {{2{acts_0_21_251[5]}}, acts_0_21_251} + {{2{acts_0_21_264[5]}}, acts_0_21_264};
    registers #(.ARRAY_WIDTH(8)) r_0_21_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_1_1), .q(s_0_21_1_1_reg));

    assign s_0_21_1_2 = {{2{acts_0_21_265[5]}}, acts_0_21_265} + {{2{acts_0_21_292[5]}}, acts_0_21_292} + {{2{acts_0_21_293[5]}}, acts_0_21_293} + {{2{acts_0_21_298[5]}}, acts_0_21_298};
    registers #(.ARRAY_WIDTH(8)) r_0_21_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_1_2), .q(s_0_21_1_2_reg));

    assign s_0_21_1_3 = {{2{acts_0_21_320[5]}}, acts_0_21_320} + {{2{acts_0_21_404[5]}}, acts_0_21_404} + {{2{acts_0_21_429[5]}}, acts_0_21_429} + {{2{acts_0_21_430[5]}}, acts_0_21_430};
    registers #(.ARRAY_WIDTH(8)) r_0_21_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_1_3), .q(s_0_21_1_3_reg));

    assign s_0_21_1_4 = {{2{acts_0_21_444[5]}}, acts_0_21_444} + {{2{acts_0_21_472[5]}}, acts_0_21_472} + {{2{acts_0_21_482[5]}}, acts_0_21_482} + {{2{acts_0_21_483[5]}}, acts_0_21_483};
    registers #(.ARRAY_WIDTH(8)) r_0_21_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_1_4), .q(s_0_21_1_4_reg));

    assign s_0_21_1_5 = {{2{acts_0_21_485[5]}}, acts_0_21_485} + {{2{acts_0_21_567[5]}}, acts_0_21_567} + {{2{acts_0_21_601[5]}}, acts_0_21_601} + {{2{acts_0_21_682[5]}}, acts_0_21_682};
    registers #(.ARRAY_WIDTH(8)) r_0_21_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_1_5), .q(s_0_21_1_5_reg));

  // Stage 2
    assign s_0_21_2_0 = {{2{s_0_21_1_0_reg[7]}}, s_0_21_1_0_reg} + {{2{s_0_21_1_1_reg[7]}}, s_0_21_1_1_reg} + {{2{s_0_21_1_2_reg[7]}}, s_0_21_1_2_reg} + {{2{s_0_21_1_3_reg[7]}}, s_0_21_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_21_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_2_0), .q(s_0_21_2_0_reg));

    assign s_0_21_2_1 = {{2{s_0_21_1_4_reg[7]}}, s_0_21_1_4_reg} + {{2{s_0_21_1_5_reg[7]}}, s_0_21_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_21_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_2_1), .q(s_0_21_2_1_reg));

  // Stage 3
    assign s_0_21_3_0 = {{2{s_0_21_2_0_reg[9]}}, s_0_21_2_0_reg} + {{2{s_0_21_2_1_reg[9]}}, s_0_21_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_21_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_3_0), .q(s_0_21_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_21_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_21_3_0_reg[11]}}, s_0_21_3_0_reg}), .q(sum_0_21_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_21 (.i_data(sum_0_21_reg), .o_data(out_0_21_sat));


    // Layer 0, Node 22
      logic  [11:0] s_0_22_3_0;
    logic  [11:0] s_0_22_3_0_reg;
    logic  [7:0] s_0_22_1_0, s_0_22_1_1, s_0_22_1_2, s_0_22_1_3, s_0_22_1_4, s_0_22_1_5, s_0_22_1_6, s_0_22_1_7;
    logic  [7:0] s_0_22_1_0_reg, s_0_22_1_1_reg, s_0_22_1_2_reg, s_0_22_1_3_reg, s_0_22_1_4_reg, s_0_22_1_5_reg, s_0_22_1_6_reg, s_0_22_1_7_reg;
    logic  [9:0] s_0_22_2_0, s_0_22_2_1;
    logic  [9:0] s_0_22_2_0_reg, s_0_22_2_1_reg;
    logic [13:0] sum_0_22;
    logic [13:0] sum_0_22_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_157)) 
    rom_0_22_157 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[157]), .o_ld_data(acts_0_22_157));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_158)) 
    rom_0_22_158 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[158]), .o_ld_data(acts_0_22_158));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_182)) 
    rom_0_22_182 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[182]), .o_ld_data(acts_0_22_182));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_185)) 
    rom_0_22_185 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[185]), .o_ld_data(acts_0_22_185));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_186)) 
    rom_0_22_186 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[186]), .o_ld_data(acts_0_22_186));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_209)) 
    rom_0_22_209 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[209]), .o_ld_data(acts_0_22_209));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_210)) 
    rom_0_22_210 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[210]), .o_ld_data(acts_0_22_210));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_213)) 
    rom_0_22_213 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[213]), .o_ld_data(acts_0_22_213));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_232)) 
    rom_0_22_232 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[232]), .o_ld_data(acts_0_22_232));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_237)) 
    rom_0_22_237 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[237]), .o_ld_data(acts_0_22_237));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_238)) 
    rom_0_22_238 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[238]), .o_ld_data(acts_0_22_238));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_240)) 
    rom_0_22_240 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[240]), .o_ld_data(acts_0_22_240));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_241)) 
    rom_0_22_241 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[241]), .o_ld_data(acts_0_22_241));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_265)) 
    rom_0_22_265 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[265]), .o_ld_data(acts_0_22_265));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_266)) 
    rom_0_22_266 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[266]), .o_ld_data(acts_0_22_266));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_268)) 
    rom_0_22_268 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[268]), .o_ld_data(acts_0_22_268));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_269)) 
    rom_0_22_269 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[269]), .o_ld_data(acts_0_22_269));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_291)) 
    rom_0_22_291 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[291]), .o_ld_data(acts_0_22_291));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_292)) 
    rom_0_22_292 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[292]), .o_ld_data(acts_0_22_292));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_293)) 
    rom_0_22_293 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[293]), .o_ld_data(acts_0_22_293));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_296)) 
    rom_0_22_296 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[296]), .o_ld_data(acts_0_22_296));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_319)) 
    rom_0_22_319 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[319]), .o_ld_data(acts_0_22_319));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_320)) 
    rom_0_22_320 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[320]), .o_ld_data(acts_0_22_320));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_324)) 
    rom_0_22_324 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[324]), .o_ld_data(acts_0_22_324));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_348)) 
    rom_0_22_348 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[348]), .o_ld_data(acts_0_22_348));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_351)) 
    rom_0_22_351 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[351]), .o_ld_data(acts_0_22_351));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_382)) 
    rom_0_22_382 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[382]), .o_ld_data(acts_0_22_382));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_397)) 
    rom_0_22_397 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[397]), .o_ld_data(acts_0_22_397));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_407)) 
    rom_0_22_407 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[407]), .o_ld_data(acts_0_22_407));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_433)) 
    rom_0_22_433 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[433]), .o_ld_data(acts_0_22_433));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_488)) 
    rom_0_22_488 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[488]), .o_ld_data(acts_0_22_488));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_22_634)) 
    rom_0_22_634 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[634]), .o_ld_data(acts_0_22_634));

  // Stage 1
    assign s_0_22_1_0 = {{2{acts_0_22_157[5]}}, acts_0_22_157} + {{2{acts_0_22_158[5]}}, acts_0_22_158} + {{2{acts_0_22_182[5]}}, acts_0_22_182} + {{2{acts_0_22_185[5]}}, acts_0_22_185};
    registers #(.ARRAY_WIDTH(8)) r_0_22_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_1_0), .q(s_0_22_1_0_reg));

    assign s_0_22_1_1 = {{2{acts_0_22_186[5]}}, acts_0_22_186} + {{2{acts_0_22_209[5]}}, acts_0_22_209} + {{2{acts_0_22_210[5]}}, acts_0_22_210} + {{2{acts_0_22_213[5]}}, acts_0_22_213};
    registers #(.ARRAY_WIDTH(8)) r_0_22_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_1_1), .q(s_0_22_1_1_reg));

    assign s_0_22_1_2 = {{2{acts_0_22_232[5]}}, acts_0_22_232} + {{2{acts_0_22_237[5]}}, acts_0_22_237} + {{2{acts_0_22_238[5]}}, acts_0_22_238} + {{2{acts_0_22_240[5]}}, acts_0_22_240};
    registers #(.ARRAY_WIDTH(8)) r_0_22_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_1_2), .q(s_0_22_1_2_reg));

    assign s_0_22_1_3 = {{2{acts_0_22_241[5]}}, acts_0_22_241} + {{2{acts_0_22_265[5]}}, acts_0_22_265} + {{2{acts_0_22_266[5]}}, acts_0_22_266} + {{2{acts_0_22_268[5]}}, acts_0_22_268};
    registers #(.ARRAY_WIDTH(8)) r_0_22_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_1_3), .q(s_0_22_1_3_reg));

    assign s_0_22_1_4 = {{2{acts_0_22_269[5]}}, acts_0_22_269} + {{2{acts_0_22_291[5]}}, acts_0_22_291} + {{2{acts_0_22_292[5]}}, acts_0_22_292} + {{2{acts_0_22_293[5]}}, acts_0_22_293};
    registers #(.ARRAY_WIDTH(8)) r_0_22_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_1_4), .q(s_0_22_1_4_reg));

    assign s_0_22_1_5 = {{2{acts_0_22_296[5]}}, acts_0_22_296} + {{2{acts_0_22_319[5]}}, acts_0_22_319} + {{2{acts_0_22_320[5]}}, acts_0_22_320} + {{2{acts_0_22_324[5]}}, acts_0_22_324};
    registers #(.ARRAY_WIDTH(8)) r_0_22_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_1_5), .q(s_0_22_1_5_reg));

    assign s_0_22_1_6 = {{2{acts_0_22_348[5]}}, acts_0_22_348} + {{2{acts_0_22_351[5]}}, acts_0_22_351} + {{2{acts_0_22_382[5]}}, acts_0_22_382} + {{2{acts_0_22_397[5]}}, acts_0_22_397};
    registers #(.ARRAY_WIDTH(8)) r_0_22_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_1_6), .q(s_0_22_1_6_reg));

    assign s_0_22_1_7 = {{2{acts_0_22_407[5]}}, acts_0_22_407} + {{2{acts_0_22_433[5]}}, acts_0_22_433} + {{2{acts_0_22_488[5]}}, acts_0_22_488} + {{2{acts_0_22_634[5]}}, acts_0_22_634};
    registers #(.ARRAY_WIDTH(8)) r_0_22_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_1_7), .q(s_0_22_1_7_reg));

  // Stage 2
    assign s_0_22_2_0 = {{2{s_0_22_1_0_reg[7]}}, s_0_22_1_0_reg} + {{2{s_0_22_1_1_reg[7]}}, s_0_22_1_1_reg} + {{2{s_0_22_1_2_reg[7]}}, s_0_22_1_2_reg} + {{2{s_0_22_1_3_reg[7]}}, s_0_22_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_22_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_2_0), .q(s_0_22_2_0_reg));

    assign s_0_22_2_1 = {{2{s_0_22_1_4_reg[7]}}, s_0_22_1_4_reg} + {{2{s_0_22_1_5_reg[7]}}, s_0_22_1_5_reg} + {{2{s_0_22_1_6_reg[7]}}, s_0_22_1_6_reg} + {{2{s_0_22_1_7_reg[7]}}, s_0_22_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_22_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_2_1), .q(s_0_22_2_1_reg));

  // Stage 3
    assign s_0_22_3_0 = {{2{s_0_22_2_0_reg[9]}}, s_0_22_2_0_reg} + {{2{s_0_22_2_1_reg[9]}}, s_0_22_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_22_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_3_0), .q(s_0_22_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_22_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_22_3_0_reg[11]}}, s_0_22_3_0_reg}), .q(sum_0_22_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_22 (.i_data(sum_0_22_reg), .o_data(out_0_22_sat));


    // Layer 0, Node 23
      logic  [11:0] s_0_23_3_0;
    logic  [11:0] s_0_23_3_0_reg;
    logic  [7:0] s_0_23_1_0, s_0_23_1_1, s_0_23_1_2, s_0_23_1_3, s_0_23_1_4, s_0_23_1_5, s_0_23_1_6, s_0_23_1_7, s_0_23_1_8, s_0_23_1_9;
    logic  [7:0] s_0_23_1_0_reg, s_0_23_1_1_reg, s_0_23_1_2_reg, s_0_23_1_3_reg, s_0_23_1_4_reg, s_0_23_1_5_reg, s_0_23_1_6_reg, s_0_23_1_7_reg, s_0_23_1_8_reg, s_0_23_1_9_reg;
    logic  [9:0] s_0_23_2_0, s_0_23_2_1, s_0_23_2_2;
    logic  [9:0] s_0_23_2_0_reg, s_0_23_2_1_reg, s_0_23_2_2_reg;
    logic [13:0] sum_0_23;
    logic [13:0] sum_0_23_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_93)) 
    rom_0_23_93 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[93]), .o_ld_data(acts_0_23_93));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_117)) 
    rom_0_23_117 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[117]), .o_ld_data(acts_0_23_117));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_269)) 
    rom_0_23_269 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[269]), .o_ld_data(acts_0_23_269));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_297)) 
    rom_0_23_297 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[297]), .o_ld_data(acts_0_23_297));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_312)) 
    rom_0_23_312 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[312]), .o_ld_data(acts_0_23_312));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_324)) 
    rom_0_23_324 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[324]), .o_ld_data(acts_0_23_324));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_325)) 
    rom_0_23_325 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[325]), .o_ld_data(acts_0_23_325));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_326)) 
    rom_0_23_326 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[326]), .o_ld_data(acts_0_23_326));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_352)) 
    rom_0_23_352 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[352]), .o_ld_data(acts_0_23_352));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_355)) 
    rom_0_23_355 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[355]), .o_ld_data(acts_0_23_355));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_356)) 
    rom_0_23_356 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[356]), .o_ld_data(acts_0_23_356));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_381)) 
    rom_0_23_381 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[381]), .o_ld_data(acts_0_23_381));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_382)) 
    rom_0_23_382 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[382]), .o_ld_data(acts_0_23_382));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_383)) 
    rom_0_23_383 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[383]), .o_ld_data(acts_0_23_383));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_409)) 
    rom_0_23_409 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[409]), .o_ld_data(acts_0_23_409));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_410)) 
    rom_0_23_410 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[410]), .o_ld_data(acts_0_23_410));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_411)) 
    rom_0_23_411 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[411]), .o_ld_data(acts_0_23_411));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_436)) 
    rom_0_23_436 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[436]), .o_ld_data(acts_0_23_436));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_437)) 
    rom_0_23_437 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[437]), .o_ld_data(acts_0_23_437));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_438)) 
    rom_0_23_438 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[438]), .o_ld_data(acts_0_23_438));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_439)) 
    rom_0_23_439 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[439]), .o_ld_data(acts_0_23_439));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_461)) 
    rom_0_23_461 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[461]), .o_ld_data(acts_0_23_461));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_464)) 
    rom_0_23_464 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[464]), .o_ld_data(acts_0_23_464));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_465)) 
    rom_0_23_465 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[465]), .o_ld_data(acts_0_23_465));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_483)) 
    rom_0_23_483 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[483]), .o_ld_data(acts_0_23_483));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_491)) 
    rom_0_23_491 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[491]), .o_ld_data(acts_0_23_491));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_492)) 
    rom_0_23_492 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[492]), .o_ld_data(acts_0_23_492));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_493)) 
    rom_0_23_493 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[493]), .o_ld_data(acts_0_23_493));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_520)) 
    rom_0_23_520 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[520]), .o_ld_data(acts_0_23_520));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_539)) 
    rom_0_23_539 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[539]), .o_ld_data(acts_0_23_539));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_555)) 
    rom_0_23_555 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[555]), .o_ld_data(acts_0_23_555));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_564)) 
    rom_0_23_564 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[564]), .o_ld_data(acts_0_23_564));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_567)) 
    rom_0_23_567 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[567]), .o_ld_data(acts_0_23_567));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_568)) 
    rom_0_23_568 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[568]), .o_ld_data(acts_0_23_568));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_592)) 
    rom_0_23_592 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[592]), .o_ld_data(acts_0_23_592));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_647)) 
    rom_0_23_647 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[647]), .o_ld_data(acts_0_23_647));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_706)) 
    rom_0_23_706 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[706]), .o_ld_data(acts_0_23_706));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_23_721)) 
    rom_0_23_721 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[721]), .o_ld_data(acts_0_23_721));

  // Stage 1
    assign s_0_23_1_0 = {{2{acts_0_23_93[5]}}, acts_0_23_93} + {{2{acts_0_23_117[5]}}, acts_0_23_117} + {{2{acts_0_23_269[5]}}, acts_0_23_269} + {{2{acts_0_23_297[5]}}, acts_0_23_297};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_0), .q(s_0_23_1_0_reg));

    assign s_0_23_1_1 = {{2{acts_0_23_312[5]}}, acts_0_23_312} + {{2{acts_0_23_324[5]}}, acts_0_23_324} + {{2{acts_0_23_325[5]}}, acts_0_23_325} + {{2{acts_0_23_326[5]}}, acts_0_23_326};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_1), .q(s_0_23_1_1_reg));

    assign s_0_23_1_2 = {{2{acts_0_23_352[5]}}, acts_0_23_352} + {{2{acts_0_23_355[5]}}, acts_0_23_355} + {{2{acts_0_23_356[5]}}, acts_0_23_356} + {{2{acts_0_23_381[5]}}, acts_0_23_381};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_2), .q(s_0_23_1_2_reg));

    assign s_0_23_1_3 = {{2{acts_0_23_382[5]}}, acts_0_23_382} + {{2{acts_0_23_383[5]}}, acts_0_23_383} + {{2{acts_0_23_409[5]}}, acts_0_23_409} + {{2{acts_0_23_410[5]}}, acts_0_23_410};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_3), .q(s_0_23_1_3_reg));

    assign s_0_23_1_4 = {{2{acts_0_23_411[5]}}, acts_0_23_411} + {{2{acts_0_23_436[5]}}, acts_0_23_436} + {{2{acts_0_23_437[5]}}, acts_0_23_437} + {{2{acts_0_23_438[5]}}, acts_0_23_438};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_4), .q(s_0_23_1_4_reg));

    assign s_0_23_1_5 = {{2{acts_0_23_439[5]}}, acts_0_23_439} + {{2{acts_0_23_461[5]}}, acts_0_23_461} + {{2{acts_0_23_464[5]}}, acts_0_23_464} + {{2{acts_0_23_465[5]}}, acts_0_23_465};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_5), .q(s_0_23_1_5_reg));

    assign s_0_23_1_6 = {{2{acts_0_23_483[5]}}, acts_0_23_483} + {{2{acts_0_23_491[5]}}, acts_0_23_491} + {{2{acts_0_23_492[5]}}, acts_0_23_492} + {{2{acts_0_23_493[5]}}, acts_0_23_493};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_6), .q(s_0_23_1_6_reg));

    assign s_0_23_1_7 = {{2{acts_0_23_520[5]}}, acts_0_23_520} + {{2{acts_0_23_539[5]}}, acts_0_23_539} + {{2{acts_0_23_555[5]}}, acts_0_23_555} + {{2{acts_0_23_564[5]}}, acts_0_23_564};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_7), .q(s_0_23_1_7_reg));

    assign s_0_23_1_8 = {{2{acts_0_23_567[5]}}, acts_0_23_567} + {{2{acts_0_23_568[5]}}, acts_0_23_568} + {{2{acts_0_23_592[5]}}, acts_0_23_592} + {{2{acts_0_23_647[5]}}, acts_0_23_647};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_8), .q(s_0_23_1_8_reg));

    assign s_0_23_1_9 = {{2{acts_0_23_706[5]}}, acts_0_23_706} + {{2{acts_0_23_721[5]}}, acts_0_23_721};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_9), .q(s_0_23_1_9_reg));

  // Stage 2
    assign s_0_23_2_0 = {{2{s_0_23_1_0_reg[7]}}, s_0_23_1_0_reg} + {{2{s_0_23_1_1_reg[7]}}, s_0_23_1_1_reg} + {{2{s_0_23_1_2_reg[7]}}, s_0_23_1_2_reg} + {{2{s_0_23_1_3_reg[7]}}, s_0_23_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_23_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_2_0), .q(s_0_23_2_0_reg));

    assign s_0_23_2_1 = {{2{s_0_23_1_4_reg[7]}}, s_0_23_1_4_reg} + {{2{s_0_23_1_5_reg[7]}}, s_0_23_1_5_reg} + {{2{s_0_23_1_6_reg[7]}}, s_0_23_1_6_reg} + {{2{s_0_23_1_7_reg[7]}}, s_0_23_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_23_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_2_1), .q(s_0_23_2_1_reg));

    assign s_0_23_2_2 = {{2{s_0_23_1_8_reg[7]}}, s_0_23_1_8_reg} + {{2{s_0_23_1_9_reg[7]}}, s_0_23_1_9_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_23_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_2_2), .q(s_0_23_2_2_reg));

  // Stage 3
    assign s_0_23_3_0 = {{2{s_0_23_2_0_reg[9]}}, s_0_23_2_0_reg} + {{2{s_0_23_2_1_reg[9]}}, s_0_23_2_1_reg} + {{2{s_0_23_2_2_reg[9]}}, s_0_23_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_23_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_3_0), .q(s_0_23_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_23_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_23_3_0_reg[11]}}, s_0_23_3_0_reg}), .q(sum_0_23_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_23 (.i_data(sum_0_23_reg), .o_data(out_0_23_sat));


    // Layer 0, Node 24
      logic  [11:0] s_0_24_3_0;
    logic  [11:0] s_0_24_3_0_reg;
    logic  [7:0] s_0_24_1_0, s_0_24_1_1, s_0_24_1_2, s_0_24_1_3, s_0_24_1_4, s_0_24_1_5, s_0_24_1_6, s_0_24_1_7;
    logic  [7:0] s_0_24_1_0_reg, s_0_24_1_1_reg, s_0_24_1_2_reg, s_0_24_1_3_reg, s_0_24_1_4_reg, s_0_24_1_5_reg, s_0_24_1_6_reg, s_0_24_1_7_reg;
    logic  [9:0] s_0_24_2_0, s_0_24_2_1;
    logic  [9:0] s_0_24_2_0_reg, s_0_24_2_1_reg;
    logic [13:0] sum_0_24;
    logic [13:0] sum_0_24_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_98)) 
    rom_0_24_98 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[98]), .o_ld_data(acts_0_24_98));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_127)) 
    rom_0_24_127 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[127]), .o_ld_data(acts_0_24_127));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_150)) 
    rom_0_24_150 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[150]), .o_ld_data(acts_0_24_150));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_177)) 
    rom_0_24_177 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[177]), .o_ld_data(acts_0_24_177));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_179)) 
    rom_0_24_179 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[179]), .o_ld_data(acts_0_24_179));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_181)) 
    rom_0_24_181 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[181]), .o_ld_data(acts_0_24_181));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_182)) 
    rom_0_24_182 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[182]), .o_ld_data(acts_0_24_182));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_206)) 
    rom_0_24_206 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[206]), .o_ld_data(acts_0_24_206));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_211)) 
    rom_0_24_211 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[211]), .o_ld_data(acts_0_24_211));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_235)) 
    rom_0_24_235 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[235]), .o_ld_data(acts_0_24_235));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_236)) 
    rom_0_24_236 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[236]), .o_ld_data(acts_0_24_236));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_237)) 
    rom_0_24_237 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[237]), .o_ld_data(acts_0_24_237));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_238)) 
    rom_0_24_238 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[238]), .o_ld_data(acts_0_24_238));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_291)) 
    rom_0_24_291 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[291]), .o_ld_data(acts_0_24_291));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_292)) 
    rom_0_24_292 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[292]), .o_ld_data(acts_0_24_292));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_318)) 
    rom_0_24_318 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[318]), .o_ld_data(acts_0_24_318));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_319)) 
    rom_0_24_319 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[319]), .o_ld_data(acts_0_24_319));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_320)) 
    rom_0_24_320 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[320]), .o_ld_data(acts_0_24_320));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_322)) 
    rom_0_24_322 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[322]), .o_ld_data(acts_0_24_322));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_343)) 
    rom_0_24_343 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[343]), .o_ld_data(acts_0_24_343));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_344)) 
    rom_0_24_344 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[344]), .o_ld_data(acts_0_24_344));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_345)) 
    rom_0_24_345 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[345]), .o_ld_data(acts_0_24_345));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_346)) 
    rom_0_24_346 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[346]), .o_ld_data(acts_0_24_346));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_347)) 
    rom_0_24_347 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[347]), .o_ld_data(acts_0_24_347));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_369)) 
    rom_0_24_369 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[369]), .o_ld_data(acts_0_24_369));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_370)) 
    rom_0_24_370 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[370]), .o_ld_data(acts_0_24_370));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_397)) 
    rom_0_24_397 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[397]), .o_ld_data(acts_0_24_397));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_428)) 
    rom_0_24_428 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[428]), .o_ld_data(acts_0_24_428));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_24_639)) 
    rom_0_24_639 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[639]), .o_ld_data(acts_0_24_639));

  // Stage 1
    assign s_0_24_1_0 = {{2{acts_0_24_98[5]}}, acts_0_24_98} + {{2{acts_0_24_127[5]}}, acts_0_24_127} + {{2{acts_0_24_150[5]}}, acts_0_24_150} + {{2{acts_0_24_177[5]}}, acts_0_24_177};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_0), .q(s_0_24_1_0_reg));

    assign s_0_24_1_1 = {{2{acts_0_24_179[5]}}, acts_0_24_179} + {{2{acts_0_24_181[5]}}, acts_0_24_181} + {{2{acts_0_24_182[5]}}, acts_0_24_182} + {{2{acts_0_24_206[5]}}, acts_0_24_206};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_1), .q(s_0_24_1_1_reg));

    assign s_0_24_1_2 = {{2{acts_0_24_211[5]}}, acts_0_24_211} + {{2{acts_0_24_235[5]}}, acts_0_24_235} + {{2{acts_0_24_236[5]}}, acts_0_24_236} + {{2{acts_0_24_237[5]}}, acts_0_24_237};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_2), .q(s_0_24_1_2_reg));

    assign s_0_24_1_3 = {{2{acts_0_24_238[5]}}, acts_0_24_238} + {{2{acts_0_24_291[5]}}, acts_0_24_291} + {{2{acts_0_24_292[5]}}, acts_0_24_292} + {{2{acts_0_24_318[5]}}, acts_0_24_318};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_3), .q(s_0_24_1_3_reg));

    assign s_0_24_1_4 = {{2{acts_0_24_319[5]}}, acts_0_24_319} + {{2{acts_0_24_320[5]}}, acts_0_24_320} + {{2{acts_0_24_322[5]}}, acts_0_24_322} + {{2{acts_0_24_343[5]}}, acts_0_24_343};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_4), .q(s_0_24_1_4_reg));

    assign s_0_24_1_5 = {{2{acts_0_24_344[5]}}, acts_0_24_344} + {{2{acts_0_24_345[5]}}, acts_0_24_345} + {{2{acts_0_24_346[5]}}, acts_0_24_346} + {{2{acts_0_24_347[5]}}, acts_0_24_347};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_5), .q(s_0_24_1_5_reg));

    assign s_0_24_1_6 = {{2{acts_0_24_369[5]}}, acts_0_24_369} + {{2{acts_0_24_370[5]}}, acts_0_24_370} + {{2{acts_0_24_397[5]}}, acts_0_24_397} + {{2{acts_0_24_428[5]}}, acts_0_24_428};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_6), .q(s_0_24_1_6_reg));

    assign s_0_24_1_7 = {{2{acts_0_24_639[5]}}, acts_0_24_639};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_7), .q(s_0_24_1_7_reg));

  // Stage 2
    assign s_0_24_2_0 = {{2{s_0_24_1_0_reg[7]}}, s_0_24_1_0_reg} + {{2{s_0_24_1_1_reg[7]}}, s_0_24_1_1_reg} + {{2{s_0_24_1_2_reg[7]}}, s_0_24_1_2_reg} + {{2{s_0_24_1_3_reg[7]}}, s_0_24_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_24_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_2_0), .q(s_0_24_2_0_reg));

    assign s_0_24_2_1 = {{2{s_0_24_1_4_reg[7]}}, s_0_24_1_4_reg} + {{2{s_0_24_1_5_reg[7]}}, s_0_24_1_5_reg} + {{2{s_0_24_1_6_reg[7]}}, s_0_24_1_6_reg} + {{2{s_0_24_1_7_reg[7]}}, s_0_24_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_24_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_2_1), .q(s_0_24_2_1_reg));

  // Stage 3
    assign s_0_24_3_0 = {{2{s_0_24_2_0_reg[9]}}, s_0_24_2_0_reg} + {{2{s_0_24_2_1_reg[9]}}, s_0_24_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_24_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_3_0), .q(s_0_24_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_24_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_24_3_0_reg[11]}}, s_0_24_3_0_reg}), .q(sum_0_24_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_24 (.i_data(sum_0_24_reg), .o_data(out_0_24_sat));


    // Layer 0, Node 25
      logic  [11:0] s_0_25_3_0;
    logic  [11:0] s_0_25_3_0_reg;
    logic  [7:0] s_0_25_1_0, s_0_25_1_1, s_0_25_1_2, s_0_25_1_3, s_0_25_1_4, s_0_25_1_5, s_0_25_1_6;
    logic  [7:0] s_0_25_1_0_reg, s_0_25_1_1_reg, s_0_25_1_2_reg, s_0_25_1_3_reg, s_0_25_1_4_reg, s_0_25_1_5_reg, s_0_25_1_6_reg;
    logic  [9:0] s_0_25_2_0, s_0_25_2_1;
    logic  [9:0] s_0_25_2_0_reg, s_0_25_2_1_reg;
    logic [13:0] sum_0_25;
    logic [13:0] sum_0_25_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_127)) 
    rom_0_25_127 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[127]), .o_ld_data(acts_0_25_127));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_128)) 
    rom_0_25_128 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[128]), .o_ld_data(acts_0_25_128));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_177)) 
    rom_0_25_177 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[177]), .o_ld_data(acts_0_25_177));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_179)) 
    rom_0_25_179 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[179]), .o_ld_data(acts_0_25_179));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_206)) 
    rom_0_25_206 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[206]), .o_ld_data(acts_0_25_206));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_207)) 
    rom_0_25_207 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[207]), .o_ld_data(acts_0_25_207));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_208)) 
    rom_0_25_208 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[208]), .o_ld_data(acts_0_25_208));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_209)) 
    rom_0_25_209 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[209]), .o_ld_data(acts_0_25_209));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_210)) 
    rom_0_25_210 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[210]), .o_ld_data(acts_0_25_210));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_211)) 
    rom_0_25_211 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[211]), .o_ld_data(acts_0_25_211));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_212)) 
    rom_0_25_212 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[212]), .o_ld_data(acts_0_25_212));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_213)) 
    rom_0_25_213 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[213]), .o_ld_data(acts_0_25_213));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_236)) 
    rom_0_25_236 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[236]), .o_ld_data(acts_0_25_236));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_237)) 
    rom_0_25_237 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[237]), .o_ld_data(acts_0_25_237));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_238)) 
    rom_0_25_238 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[238]), .o_ld_data(acts_0_25_238));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_240)) 
    rom_0_25_240 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[240]), .o_ld_data(acts_0_25_240));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_291)) 
    rom_0_25_291 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[291]), .o_ld_data(acts_0_25_291));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_322)) 
    rom_0_25_322 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[322]), .o_ld_data(acts_0_25_322));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_463)) 
    rom_0_25_463 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[463]), .o_ld_data(acts_0_25_463));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_466)) 
    rom_0_25_466 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[466]), .o_ld_data(acts_0_25_466));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_492)) 
    rom_0_25_492 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[492]), .o_ld_data(acts_0_25_492));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_493)) 
    rom_0_25_493 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[493]), .o_ld_data(acts_0_25_493));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_518)) 
    rom_0_25_518 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[518]), .o_ld_data(acts_0_25_518));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_659)) 
    rom_0_25_659 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[659]), .o_ld_data(acts_0_25_659));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_679)) 
    rom_0_25_679 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[679]), .o_ld_data(acts_0_25_679));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_25_712)) 
    rom_0_25_712 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[712]), .o_ld_data(acts_0_25_712));

  // Stage 1
    assign s_0_25_1_0 = {{2{acts_0_25_127[5]}}, acts_0_25_127} + {{2{acts_0_25_128[5]}}, acts_0_25_128} + {{2{acts_0_25_177[5]}}, acts_0_25_177} + {{2{acts_0_25_179[5]}}, acts_0_25_179};
    registers #(.ARRAY_WIDTH(8)) r_0_25_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_1_0), .q(s_0_25_1_0_reg));

    assign s_0_25_1_1 = {{2{acts_0_25_206[5]}}, acts_0_25_206} + {{2{acts_0_25_207[5]}}, acts_0_25_207} + {{2{acts_0_25_208[5]}}, acts_0_25_208} + {{2{acts_0_25_209[5]}}, acts_0_25_209};
    registers #(.ARRAY_WIDTH(8)) r_0_25_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_1_1), .q(s_0_25_1_1_reg));

    assign s_0_25_1_2 = {{2{acts_0_25_210[5]}}, acts_0_25_210} + {{2{acts_0_25_211[5]}}, acts_0_25_211} + {{2{acts_0_25_212[5]}}, acts_0_25_212} + {{2{acts_0_25_213[5]}}, acts_0_25_213};
    registers #(.ARRAY_WIDTH(8)) r_0_25_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_1_2), .q(s_0_25_1_2_reg));

    assign s_0_25_1_3 = {{2{acts_0_25_236[5]}}, acts_0_25_236} + {{2{acts_0_25_237[5]}}, acts_0_25_237} + {{2{acts_0_25_238[5]}}, acts_0_25_238} + {{2{acts_0_25_240[5]}}, acts_0_25_240};
    registers #(.ARRAY_WIDTH(8)) r_0_25_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_1_3), .q(s_0_25_1_3_reg));

    assign s_0_25_1_4 = {{2{acts_0_25_291[5]}}, acts_0_25_291} + {{2{acts_0_25_322[5]}}, acts_0_25_322} + {{2{acts_0_25_463[5]}}, acts_0_25_463} + {{2{acts_0_25_466[5]}}, acts_0_25_466};
    registers #(.ARRAY_WIDTH(8)) r_0_25_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_1_4), .q(s_0_25_1_4_reg));

    assign s_0_25_1_5 = {{2{acts_0_25_492[5]}}, acts_0_25_492} + {{2{acts_0_25_493[5]}}, acts_0_25_493} + {{2{acts_0_25_518[5]}}, acts_0_25_518} + {{2{acts_0_25_659[5]}}, acts_0_25_659};
    registers #(.ARRAY_WIDTH(8)) r_0_25_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_1_5), .q(s_0_25_1_5_reg));

    assign s_0_25_1_6 = {{2{acts_0_25_679[5]}}, acts_0_25_679} + {{2{acts_0_25_712[5]}}, acts_0_25_712};
    registers #(.ARRAY_WIDTH(8)) r_0_25_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_1_6), .q(s_0_25_1_6_reg));

  // Stage 2
    assign s_0_25_2_0 = {{2{s_0_25_1_0_reg[7]}}, s_0_25_1_0_reg} + {{2{s_0_25_1_1_reg[7]}}, s_0_25_1_1_reg} + {{2{s_0_25_1_2_reg[7]}}, s_0_25_1_2_reg} + {{2{s_0_25_1_3_reg[7]}}, s_0_25_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_25_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_2_0), .q(s_0_25_2_0_reg));

    assign s_0_25_2_1 = {{2{s_0_25_1_4_reg[7]}}, s_0_25_1_4_reg} + {{2{s_0_25_1_5_reg[7]}}, s_0_25_1_5_reg} + {{2{s_0_25_1_6_reg[7]}}, s_0_25_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_25_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_2_1), .q(s_0_25_2_1_reg));

  // Stage 3
    assign s_0_25_3_0 = {{2{s_0_25_2_0_reg[9]}}, s_0_25_2_0_reg} + {{2{s_0_25_2_1_reg[9]}}, s_0_25_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_25_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_3_0), .q(s_0_25_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_25_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_25_3_0_reg[11]}}, s_0_25_3_0_reg}), .q(sum_0_25_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_25 (.i_data(sum_0_25_reg), .o_data(out_0_25_sat));


    // Layer 0, Node 26
      logic  [11:0] s_0_26_3_0;
    logic  [11:0] s_0_26_3_0_reg;
    logic  [7:0] s_0_26_1_0, s_0_26_1_1, s_0_26_1_2, s_0_26_1_3, s_0_26_1_4, s_0_26_1_5, s_0_26_1_6, s_0_26_1_7;
    logic  [7:0] s_0_26_1_0_reg, s_0_26_1_1_reg, s_0_26_1_2_reg, s_0_26_1_3_reg, s_0_26_1_4_reg, s_0_26_1_5_reg, s_0_26_1_6_reg, s_0_26_1_7_reg;
    logic  [9:0] s_0_26_2_0, s_0_26_2_1;
    logic  [9:0] s_0_26_2_0_reg, s_0_26_2_1_reg;
    logic [13:0] sum_0_26;
    logic [13:0] sum_0_26_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_163)) 
    rom_0_26_163 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[163]), .o_ld_data(acts_0_26_163));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_185)) 
    rom_0_26_185 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[185]), .o_ld_data(acts_0_26_185));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_190)) 
    rom_0_26_190 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[190]), .o_ld_data(acts_0_26_190));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_210)) 
    rom_0_26_210 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[210]), .o_ld_data(acts_0_26_210));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_211)) 
    rom_0_26_211 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[211]), .o_ld_data(acts_0_26_211));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_212)) 
    rom_0_26_212 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[212]), .o_ld_data(acts_0_26_212));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_213)) 
    rom_0_26_213 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[213]), .o_ld_data(acts_0_26_213));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_214)) 
    rom_0_26_214 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[214]), .o_ld_data(acts_0_26_214));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_215)) 
    rom_0_26_215 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[215]), .o_ld_data(acts_0_26_215));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_240)) 
    rom_0_26_240 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[240]), .o_ld_data(acts_0_26_240));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_267)) 
    rom_0_26_267 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[267]), .o_ld_data(acts_0_26_267));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_268)) 
    rom_0_26_268 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[268]), .o_ld_data(acts_0_26_268));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_269)) 
    rom_0_26_269 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[269]), .o_ld_data(acts_0_26_269));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_292)) 
    rom_0_26_292 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[292]), .o_ld_data(acts_0_26_292));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_295)) 
    rom_0_26_295 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[295]), .o_ld_data(acts_0_26_295));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_296)) 
    rom_0_26_296 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[296]), .o_ld_data(acts_0_26_296));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_297)) 
    rom_0_26_297 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[297]), .o_ld_data(acts_0_26_297));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_298)) 
    rom_0_26_298 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[298]), .o_ld_data(acts_0_26_298));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_299)) 
    rom_0_26_299 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[299]), .o_ld_data(acts_0_26_299));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_300)) 
    rom_0_26_300 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[300]), .o_ld_data(acts_0_26_300));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_301)) 
    rom_0_26_301 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[301]), .o_ld_data(acts_0_26_301));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_302)) 
    rom_0_26_302 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[302]), .o_ld_data(acts_0_26_302));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_303)) 
    rom_0_26_303 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[303]), .o_ld_data(acts_0_26_303));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_328)) 
    rom_0_26_328 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[328]), .o_ld_data(acts_0_26_328));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_330)) 
    rom_0_26_330 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[330]), .o_ld_data(acts_0_26_330));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_331)) 
    rom_0_26_331 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[331]), .o_ld_data(acts_0_26_331));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_408)) 
    rom_0_26_408 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[408]), .o_ld_data(acts_0_26_408));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_439)) 
    rom_0_26_439 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[439]), .o_ld_data(acts_0_26_439));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_571)) 
    rom_0_26_571 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[571]), .o_ld_data(acts_0_26_571));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_26_575)) 
    rom_0_26_575 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[575]), .o_ld_data(acts_0_26_575));

  // Stage 1
    assign s_0_26_1_0 = {{2{acts_0_26_163[5]}}, acts_0_26_163} + {{2{acts_0_26_185[5]}}, acts_0_26_185} + {{2{acts_0_26_190[5]}}, acts_0_26_190} + {{2{acts_0_26_210[5]}}, acts_0_26_210};
    registers #(.ARRAY_WIDTH(8)) r_0_26_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_1_0), .q(s_0_26_1_0_reg));

    assign s_0_26_1_1 = {{2{acts_0_26_211[5]}}, acts_0_26_211} + {{2{acts_0_26_212[5]}}, acts_0_26_212} + {{2{acts_0_26_213[5]}}, acts_0_26_213} + {{2{acts_0_26_214[5]}}, acts_0_26_214};
    registers #(.ARRAY_WIDTH(8)) r_0_26_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_1_1), .q(s_0_26_1_1_reg));

    assign s_0_26_1_2 = {{2{acts_0_26_215[5]}}, acts_0_26_215} + {{2{acts_0_26_240[5]}}, acts_0_26_240} + {{2{acts_0_26_267[5]}}, acts_0_26_267} + {{2{acts_0_26_268[5]}}, acts_0_26_268};
    registers #(.ARRAY_WIDTH(8)) r_0_26_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_1_2), .q(s_0_26_1_2_reg));

    assign s_0_26_1_3 = {{2{acts_0_26_269[5]}}, acts_0_26_269} + {{2{acts_0_26_292[5]}}, acts_0_26_292} + {{2{acts_0_26_295[5]}}, acts_0_26_295} + {{2{acts_0_26_296[5]}}, acts_0_26_296};
    registers #(.ARRAY_WIDTH(8)) r_0_26_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_1_3), .q(s_0_26_1_3_reg));

    assign s_0_26_1_4 = {{2{acts_0_26_297[5]}}, acts_0_26_297} + {{2{acts_0_26_298[5]}}, acts_0_26_298} + {{2{acts_0_26_299[5]}}, acts_0_26_299} + {{2{acts_0_26_300[5]}}, acts_0_26_300};
    registers #(.ARRAY_WIDTH(8)) r_0_26_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_1_4), .q(s_0_26_1_4_reg));

    assign s_0_26_1_5 = {{2{acts_0_26_301[5]}}, acts_0_26_301} + {{2{acts_0_26_302[5]}}, acts_0_26_302} + {{2{acts_0_26_303[5]}}, acts_0_26_303} + {{2{acts_0_26_328[5]}}, acts_0_26_328};
    registers #(.ARRAY_WIDTH(8)) r_0_26_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_1_5), .q(s_0_26_1_5_reg));

    assign s_0_26_1_6 = {{2{acts_0_26_330[5]}}, acts_0_26_330} + {{2{acts_0_26_331[5]}}, acts_0_26_331} + {{2{acts_0_26_408[5]}}, acts_0_26_408} + {{2{acts_0_26_439[5]}}, acts_0_26_439};
    registers #(.ARRAY_WIDTH(8)) r_0_26_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_1_6), .q(s_0_26_1_6_reg));

    assign s_0_26_1_7 = {{2{acts_0_26_571[5]}}, acts_0_26_571} + {{2{acts_0_26_575[5]}}, acts_0_26_575};
    registers #(.ARRAY_WIDTH(8)) r_0_26_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_1_7), .q(s_0_26_1_7_reg));

  // Stage 2
    assign s_0_26_2_0 = {{2{s_0_26_1_0_reg[7]}}, s_0_26_1_0_reg} + {{2{s_0_26_1_1_reg[7]}}, s_0_26_1_1_reg} + {{2{s_0_26_1_2_reg[7]}}, s_0_26_1_2_reg} + {{2{s_0_26_1_3_reg[7]}}, s_0_26_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_26_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_2_0), .q(s_0_26_2_0_reg));

    assign s_0_26_2_1 = {{2{s_0_26_1_4_reg[7]}}, s_0_26_1_4_reg} + {{2{s_0_26_1_5_reg[7]}}, s_0_26_1_5_reg} + {{2{s_0_26_1_6_reg[7]}}, s_0_26_1_6_reg} + {{2{s_0_26_1_7_reg[7]}}, s_0_26_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_26_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_2_1), .q(s_0_26_2_1_reg));

  // Stage 3
    assign s_0_26_3_0 = {{2{s_0_26_2_0_reg[9]}}, s_0_26_2_0_reg} + {{2{s_0_26_2_1_reg[9]}}, s_0_26_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_26_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_3_0), .q(s_0_26_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_26_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_26_3_0_reg[11]}}, s_0_26_3_0_reg}), .q(sum_0_26_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_26 (.i_data(sum_0_26_reg), .o_data(out_0_26_sat));


    // Layer 0, Node 27
      logic  [11:0] s_0_27_3_0;
    logic  [11:0] s_0_27_3_0_reg;
    logic  [7:0] s_0_27_1_0, s_0_27_1_1, s_0_27_1_2, s_0_27_1_3, s_0_27_1_4, s_0_27_1_5, s_0_27_1_6, s_0_27_1_7, s_0_27_1_8, s_0_27_1_9, s_0_27_1_10;
    logic  [7:0] s_0_27_1_0_reg, s_0_27_1_1_reg, s_0_27_1_2_reg, s_0_27_1_3_reg, s_0_27_1_4_reg, s_0_27_1_5_reg, s_0_27_1_6_reg, s_0_27_1_7_reg, s_0_27_1_8_reg, s_0_27_1_9_reg, s_0_27_1_10_reg;
    logic  [9:0] s_0_27_2_0, s_0_27_2_1, s_0_27_2_2;
    logic  [9:0] s_0_27_2_0_reg, s_0_27_2_1_reg, s_0_27_2_2_reg;
    logic [13:0] sum_0_27;
    logic [13:0] sum_0_27_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_42)) 
    rom_0_27_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[42]), .o_ld_data(acts_0_27_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_50)) 
    rom_0_27_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[50]), .o_ld_data(acts_0_27_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_56)) 
    rom_0_27_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[56]), .o_ld_data(acts_0_27_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_83)) 
    rom_0_27_83 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[83]), .o_ld_data(acts_0_27_83));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_212)) 
    rom_0_27_212 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[212]), .o_ld_data(acts_0_27_212));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_219)) 
    rom_0_27_219 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[219]), .o_ld_data(acts_0_27_219));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_223)) 
    rom_0_27_223 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[223]), .o_ld_data(acts_0_27_223));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_307)) 
    rom_0_27_307 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[307]), .o_ld_data(acts_0_27_307));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_310)) 
    rom_0_27_310 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[310]), .o_ld_data(acts_0_27_310));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_319)) 
    rom_0_27_319 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[319]), .o_ld_data(acts_0_27_319));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_323)) 
    rom_0_27_323 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[323]), .o_ld_data(acts_0_27_323));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_337)) 
    rom_0_27_337 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[337]), .o_ld_data(acts_0_27_337));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_339)) 
    rom_0_27_339 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[339]), .o_ld_data(acts_0_27_339));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_347)) 
    rom_0_27_347 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[347]), .o_ld_data(acts_0_27_347));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_356)) 
    rom_0_27_356 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[356]), .o_ld_data(acts_0_27_356));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_378)) 
    rom_0_27_378 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[378]), .o_ld_data(acts_0_27_378));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_390)) 
    rom_0_27_390 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[390]), .o_ld_data(acts_0_27_390));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_393)) 
    rom_0_27_393 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[393]), .o_ld_data(acts_0_27_393));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_416)) 
    rom_0_27_416 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[416]), .o_ld_data(acts_0_27_416));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_430)) 
    rom_0_27_430 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[430]), .o_ld_data(acts_0_27_430));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_436)) 
    rom_0_27_436 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[436]), .o_ld_data(acts_0_27_436));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_463)) 
    rom_0_27_463 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[463]), .o_ld_data(acts_0_27_463));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_464)) 
    rom_0_27_464 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[464]), .o_ld_data(acts_0_27_464));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_468)) 
    rom_0_27_468 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[468]), .o_ld_data(acts_0_27_468));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_491)) 
    rom_0_27_491 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[491]), .o_ld_data(acts_0_27_491));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_499)) 
    rom_0_27_499 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[499]), .o_ld_data(acts_0_27_499));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_508)) 
    rom_0_27_508 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[508]), .o_ld_data(acts_0_27_508));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_514)) 
    rom_0_27_514 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[514]), .o_ld_data(acts_0_27_514));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_537)) 
    rom_0_27_537 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[537]), .o_ld_data(acts_0_27_537));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_553)) 
    rom_0_27_553 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[553]), .o_ld_data(acts_0_27_553));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_578)) 
    rom_0_27_578 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[578]), .o_ld_data(acts_0_27_578));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_579)) 
    rom_0_27_579 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[579]), .o_ld_data(acts_0_27_579));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_591)) 
    rom_0_27_591 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[591]), .o_ld_data(acts_0_27_591));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_600)) 
    rom_0_27_600 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[600]), .o_ld_data(acts_0_27_600));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_622)) 
    rom_0_27_622 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[622]), .o_ld_data(acts_0_27_622));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_648)) 
    rom_0_27_648 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[648]), .o_ld_data(acts_0_27_648));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_691)) 
    rom_0_27_691 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[691]), .o_ld_data(acts_0_27_691));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_698)) 
    rom_0_27_698 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[698]), .o_ld_data(acts_0_27_698));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_705)) 
    rom_0_27_705 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[705]), .o_ld_data(acts_0_27_705));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_720)) 
    rom_0_27_720 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[720]), .o_ld_data(acts_0_27_720));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_748)) 
    rom_0_27_748 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[748]), .o_ld_data(acts_0_27_748));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_756)) 
    rom_0_27_756 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[756]), .o_ld_data(acts_0_27_756));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_776)) 
    rom_0_27_776 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[776]), .o_ld_data(acts_0_27_776));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_27_779)) 
    rom_0_27_779 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[779]), .o_ld_data(acts_0_27_779));

  // Stage 1
    assign s_0_27_1_0 = {{2{acts_0_27_42[5]}}, acts_0_27_42} + {{2{acts_0_27_50[5]}}, acts_0_27_50} + {{2{acts_0_27_56[5]}}, acts_0_27_56} + {{2{acts_0_27_83[5]}}, acts_0_27_83};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_0), .q(s_0_27_1_0_reg));

    assign s_0_27_1_1 = {{2{acts_0_27_212[5]}}, acts_0_27_212} + {{2{acts_0_27_219[5]}}, acts_0_27_219} + {{2{acts_0_27_223[5]}}, acts_0_27_223} + {{2{acts_0_27_307[5]}}, acts_0_27_307};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_1), .q(s_0_27_1_1_reg));

    assign s_0_27_1_2 = {{2{acts_0_27_310[5]}}, acts_0_27_310} + {{2{acts_0_27_319[5]}}, acts_0_27_319} + {{2{acts_0_27_323[5]}}, acts_0_27_323} + {{2{acts_0_27_337[5]}}, acts_0_27_337};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_2), .q(s_0_27_1_2_reg));

    assign s_0_27_1_3 = {{2{acts_0_27_339[5]}}, acts_0_27_339} + {{2{acts_0_27_347[5]}}, acts_0_27_347} + {{2{acts_0_27_356[5]}}, acts_0_27_356} + {{2{acts_0_27_378[5]}}, acts_0_27_378};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_3), .q(s_0_27_1_3_reg));

    assign s_0_27_1_4 = {{2{acts_0_27_390[5]}}, acts_0_27_390} + {{2{acts_0_27_393[5]}}, acts_0_27_393} + {{2{acts_0_27_416[5]}}, acts_0_27_416} + {{2{acts_0_27_430[5]}}, acts_0_27_430};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_4), .q(s_0_27_1_4_reg));

    assign s_0_27_1_5 = {{2{acts_0_27_436[5]}}, acts_0_27_436} + {{2{acts_0_27_463[5]}}, acts_0_27_463} + {{2{acts_0_27_464[5]}}, acts_0_27_464} + {{2{acts_0_27_468[5]}}, acts_0_27_468};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_5), .q(s_0_27_1_5_reg));

    assign s_0_27_1_6 = {{2{acts_0_27_491[5]}}, acts_0_27_491} + {{2{acts_0_27_499[5]}}, acts_0_27_499} + {{2{acts_0_27_508[5]}}, acts_0_27_508} + {{2{acts_0_27_514[5]}}, acts_0_27_514};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_6), .q(s_0_27_1_6_reg));

    assign s_0_27_1_7 = {{2{acts_0_27_537[5]}}, acts_0_27_537} + {{2{acts_0_27_553[5]}}, acts_0_27_553} + {{2{acts_0_27_578[5]}}, acts_0_27_578} + {{2{acts_0_27_579[5]}}, acts_0_27_579};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_7), .q(s_0_27_1_7_reg));

    assign s_0_27_1_8 = {{2{acts_0_27_591[5]}}, acts_0_27_591} + {{2{acts_0_27_600[5]}}, acts_0_27_600} + {{2{acts_0_27_622[5]}}, acts_0_27_622} + {{2{acts_0_27_648[5]}}, acts_0_27_648};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_8), .q(s_0_27_1_8_reg));

    assign s_0_27_1_9 = {{2{acts_0_27_691[5]}}, acts_0_27_691} + {{2{acts_0_27_698[5]}}, acts_0_27_698} + {{2{acts_0_27_705[5]}}, acts_0_27_705} + {{2{acts_0_27_720[5]}}, acts_0_27_720};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_9), .q(s_0_27_1_9_reg));

    assign s_0_27_1_10 = {{2{acts_0_27_748[5]}}, acts_0_27_748} + {{2{acts_0_27_756[5]}}, acts_0_27_756} + {{2{acts_0_27_776[5]}}, acts_0_27_776} + {{2{acts_0_27_779[5]}}, acts_0_27_779};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_10), .q(s_0_27_1_10_reg));

  // Stage 2
    assign s_0_27_2_0 = {{2{s_0_27_1_0_reg[7]}}, s_0_27_1_0_reg} + {{2{s_0_27_1_1_reg[7]}}, s_0_27_1_1_reg} + {{2{s_0_27_1_2_reg[7]}}, s_0_27_1_2_reg} + {{2{s_0_27_1_3_reg[7]}}, s_0_27_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_27_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_2_0), .q(s_0_27_2_0_reg));

    assign s_0_27_2_1 = {{2{s_0_27_1_4_reg[7]}}, s_0_27_1_4_reg} + {{2{s_0_27_1_5_reg[7]}}, s_0_27_1_5_reg} + {{2{s_0_27_1_6_reg[7]}}, s_0_27_1_6_reg} + {{2{s_0_27_1_7_reg[7]}}, s_0_27_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_27_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_2_1), .q(s_0_27_2_1_reg));

    assign s_0_27_2_2 = {{2{s_0_27_1_8_reg[7]}}, s_0_27_1_8_reg} + {{2{s_0_27_1_9_reg[7]}}, s_0_27_1_9_reg} + {{2{s_0_27_1_10_reg[7]}}, s_0_27_1_10_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_27_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_2_2), .q(s_0_27_2_2_reg));

  // Stage 3
    assign s_0_27_3_0 = {{2{s_0_27_2_0_reg[9]}}, s_0_27_2_0_reg} + {{2{s_0_27_2_1_reg[9]}}, s_0_27_2_1_reg} + {{2{s_0_27_2_2_reg[9]}}, s_0_27_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_27_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_3_0), .q(s_0_27_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_27_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_27_3_0_reg[11]}}, s_0_27_3_0_reg}), .q(sum_0_27_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_27 (.i_data(sum_0_27_reg), .o_data(out_0_27_sat));


    // Layer 0, Node 28
      logic  [11:0] s_0_28_3_0;
    logic  [11:0] s_0_28_3_0_reg;
    logic  [7:0] s_0_28_1_0, s_0_28_1_1, s_0_28_1_2, s_0_28_1_3, s_0_28_1_4, s_0_28_1_5, s_0_28_1_6, s_0_28_1_7, s_0_28_1_8, s_0_28_1_9, s_0_28_1_10, s_0_28_1_11, s_0_28_1_12, s_0_28_1_13, s_0_28_1_14;
    logic  [7:0] s_0_28_1_0_reg, s_0_28_1_1_reg, s_0_28_1_2_reg, s_0_28_1_3_reg, s_0_28_1_4_reg, s_0_28_1_5_reg, s_0_28_1_6_reg, s_0_28_1_7_reg, s_0_28_1_8_reg, s_0_28_1_9_reg, s_0_28_1_10_reg, s_0_28_1_11_reg, s_0_28_1_12_reg, s_0_28_1_13_reg, s_0_28_1_14_reg;
    logic  [9:0] s_0_28_2_0, s_0_28_2_1, s_0_28_2_2, s_0_28_2_3;
    logic  [9:0] s_0_28_2_0_reg, s_0_28_2_1_reg, s_0_28_2_2_reg, s_0_28_2_3_reg;
    logic [13:0] sum_0_28;
    logic [13:0] sum_0_28_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_2)) 
    rom_0_28_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_28_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_6)) 
    rom_0_28_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_28_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_17)) 
    rom_0_28_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_28_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_39)) 
    rom_0_28_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_28_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_42)) 
    rom_0_28_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[42]), .o_ld_data(acts_0_28_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_46)) 
    rom_0_28_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[46]), .o_ld_data(acts_0_28_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_83)) 
    rom_0_28_83 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[83]), .o_ld_data(acts_0_28_83));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_106)) 
    rom_0_28_106 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[106]), .o_ld_data(acts_0_28_106));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_110)) 
    rom_0_28_110 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[110]), .o_ld_data(acts_0_28_110));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_111)) 
    rom_0_28_111 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[111]), .o_ld_data(acts_0_28_111));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_112)) 
    rom_0_28_112 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[112]), .o_ld_data(acts_0_28_112));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_127)) 
    rom_0_28_127 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[127]), .o_ld_data(acts_0_28_127));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_137)) 
    rom_0_28_137 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[137]), .o_ld_data(acts_0_28_137));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_165)) 
    rom_0_28_165 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[165]), .o_ld_data(acts_0_28_165));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_167)) 
    rom_0_28_167 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[167]), .o_ld_data(acts_0_28_167));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_200)) 
    rom_0_28_200 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[200]), .o_ld_data(acts_0_28_200));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_262)) 
    rom_0_28_262 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[262]), .o_ld_data(acts_0_28_262));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_276)) 
    rom_0_28_276 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[276]), .o_ld_data(acts_0_28_276));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_277)) 
    rom_0_28_277 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[277]), .o_ld_data(acts_0_28_277));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_298)) 
    rom_0_28_298 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[298]), .o_ld_data(acts_0_28_298));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_310)) 
    rom_0_28_310 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[310]), .o_ld_data(acts_0_28_310));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_360)) 
    rom_0_28_360 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[360]), .o_ld_data(acts_0_28_360));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_361)) 
    rom_0_28_361 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[361]), .o_ld_data(acts_0_28_361));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_362)) 
    rom_0_28_362 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[362]), .o_ld_data(acts_0_28_362));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_410)) 
    rom_0_28_410 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[410]), .o_ld_data(acts_0_28_410));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_444)) 
    rom_0_28_444 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[444]), .o_ld_data(acts_0_28_444));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_449)) 
    rom_0_28_449 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[449]), .o_ld_data(acts_0_28_449));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_468)) 
    rom_0_28_468 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[468]), .o_ld_data(acts_0_28_468));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_477)) 
    rom_0_28_477 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[477]), .o_ld_data(acts_0_28_477));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_480)) 
    rom_0_28_480 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[480]), .o_ld_data(acts_0_28_480));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_497)) 
    rom_0_28_497 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[497]), .o_ld_data(acts_0_28_497));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_516)) 
    rom_0_28_516 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[516]), .o_ld_data(acts_0_28_516));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_532)) 
    rom_0_28_532 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[532]), .o_ld_data(acts_0_28_532));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_535)) 
    rom_0_28_535 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[535]), .o_ld_data(acts_0_28_535));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_546)) 
    rom_0_28_546 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[546]), .o_ld_data(acts_0_28_546));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_574)) 
    rom_0_28_574 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[574]), .o_ld_data(acts_0_28_574));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_575)) 
    rom_0_28_575 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[575]), .o_ld_data(acts_0_28_575));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_609)) 
    rom_0_28_609 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[609]), .o_ld_data(acts_0_28_609));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_618)) 
    rom_0_28_618 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[618]), .o_ld_data(acts_0_28_618));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_635)) 
    rom_0_28_635 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[635]), .o_ld_data(acts_0_28_635));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_636)) 
    rom_0_28_636 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[636]), .o_ld_data(acts_0_28_636));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_641)) 
    rom_0_28_641 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[641]), .o_ld_data(acts_0_28_641));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_643)) 
    rom_0_28_643 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[643]), .o_ld_data(acts_0_28_643));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_644)) 
    rom_0_28_644 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[644]), .o_ld_data(acts_0_28_644));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_650)) 
    rom_0_28_650 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[650]), .o_ld_data(acts_0_28_650));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_658)) 
    rom_0_28_658 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[658]), .o_ld_data(acts_0_28_658));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_659)) 
    rom_0_28_659 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[659]), .o_ld_data(acts_0_28_659));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_660)) 
    rom_0_28_660 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[660]), .o_ld_data(acts_0_28_660));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_661)) 
    rom_0_28_661 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[661]), .o_ld_data(acts_0_28_661));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_662)) 
    rom_0_28_662 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[662]), .o_ld_data(acts_0_28_662));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_677)) 
    rom_0_28_677 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[677]), .o_ld_data(acts_0_28_677));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_684)) 
    rom_0_28_684 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[684]), .o_ld_data(acts_0_28_684));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_685)) 
    rom_0_28_685 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[685]), .o_ld_data(acts_0_28_685));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_730)) 
    rom_0_28_730 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[730]), .o_ld_data(acts_0_28_730));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_747)) 
    rom_0_28_747 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[747]), .o_ld_data(acts_0_28_747));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_750)) 
    rom_0_28_750 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[750]), .o_ld_data(acts_0_28_750));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_752)) 
    rom_0_28_752 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[752]), .o_ld_data(acts_0_28_752));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_772)) 
    rom_0_28_772 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[772]), .o_ld_data(acts_0_28_772));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_28_778)) 
    rom_0_28_778 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[778]), .o_ld_data(acts_0_28_778));

  // Stage 1
    assign s_0_28_1_0 = {{2{acts_0_28_2[5]}}, acts_0_28_2} + {{2{acts_0_28_6[5]}}, acts_0_28_6} + {{2{acts_0_28_17[5]}}, acts_0_28_17} + {{2{acts_0_28_39[5]}}, acts_0_28_39};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_0), .q(s_0_28_1_0_reg));

    assign s_0_28_1_1 = {{2{acts_0_28_42[5]}}, acts_0_28_42} + {{2{acts_0_28_46[5]}}, acts_0_28_46} + {{2{acts_0_28_83[5]}}, acts_0_28_83} + {{2{acts_0_28_106[5]}}, acts_0_28_106};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_1), .q(s_0_28_1_1_reg));

    assign s_0_28_1_2 = {{2{acts_0_28_110[5]}}, acts_0_28_110} + {{2{acts_0_28_111[5]}}, acts_0_28_111} + {{2{acts_0_28_112[5]}}, acts_0_28_112} + {{2{acts_0_28_127[5]}}, acts_0_28_127};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_2), .q(s_0_28_1_2_reg));

    assign s_0_28_1_3 = {{2{acts_0_28_137[5]}}, acts_0_28_137} + {{2{acts_0_28_165[5]}}, acts_0_28_165} + {{2{acts_0_28_167[5]}}, acts_0_28_167} + {{2{acts_0_28_200[5]}}, acts_0_28_200};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_3), .q(s_0_28_1_3_reg));

    assign s_0_28_1_4 = {{2{acts_0_28_262[5]}}, acts_0_28_262} + {{2{acts_0_28_276[5]}}, acts_0_28_276} + {{2{acts_0_28_277[5]}}, acts_0_28_277} + {{2{acts_0_28_298[5]}}, acts_0_28_298};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_4), .q(s_0_28_1_4_reg));

    assign s_0_28_1_5 = {{2{acts_0_28_310[5]}}, acts_0_28_310} + {{2{acts_0_28_360[5]}}, acts_0_28_360} + {{2{acts_0_28_361[5]}}, acts_0_28_361} + {{2{acts_0_28_362[5]}}, acts_0_28_362};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_5), .q(s_0_28_1_5_reg));

    assign s_0_28_1_6 = {{2{acts_0_28_410[5]}}, acts_0_28_410} + {{2{acts_0_28_444[5]}}, acts_0_28_444} + {{2{acts_0_28_449[5]}}, acts_0_28_449} + {{2{acts_0_28_468[5]}}, acts_0_28_468};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_6), .q(s_0_28_1_6_reg));

    assign s_0_28_1_7 = {{2{acts_0_28_477[5]}}, acts_0_28_477} + {{2{acts_0_28_480[5]}}, acts_0_28_480} + {{2{acts_0_28_497[5]}}, acts_0_28_497} + {{2{acts_0_28_516[5]}}, acts_0_28_516};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_7), .q(s_0_28_1_7_reg));

    assign s_0_28_1_8 = {{2{acts_0_28_532[5]}}, acts_0_28_532} + {{2{acts_0_28_535[5]}}, acts_0_28_535} + {{2{acts_0_28_546[5]}}, acts_0_28_546} + {{2{acts_0_28_574[5]}}, acts_0_28_574};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_8), .q(s_0_28_1_8_reg));

    assign s_0_28_1_9 = {{2{acts_0_28_575[5]}}, acts_0_28_575} + {{2{acts_0_28_609[5]}}, acts_0_28_609} + {{2{acts_0_28_618[5]}}, acts_0_28_618} + {{2{acts_0_28_635[5]}}, acts_0_28_635};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_9), .q(s_0_28_1_9_reg));

    assign s_0_28_1_10 = {{2{acts_0_28_636[5]}}, acts_0_28_636} + {{2{acts_0_28_641[5]}}, acts_0_28_641} + {{2{acts_0_28_643[5]}}, acts_0_28_643} + {{2{acts_0_28_644[5]}}, acts_0_28_644};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_10), .q(s_0_28_1_10_reg));

    assign s_0_28_1_11 = {{2{acts_0_28_650[5]}}, acts_0_28_650} + {{2{acts_0_28_658[5]}}, acts_0_28_658} + {{2{acts_0_28_659[5]}}, acts_0_28_659} + {{2{acts_0_28_660[5]}}, acts_0_28_660};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_11), .q(s_0_28_1_11_reg));

    assign s_0_28_1_12 = {{2{acts_0_28_661[5]}}, acts_0_28_661} + {{2{acts_0_28_662[5]}}, acts_0_28_662} + {{2{acts_0_28_677[5]}}, acts_0_28_677} + {{2{acts_0_28_684[5]}}, acts_0_28_684};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_12), .q(s_0_28_1_12_reg));

    assign s_0_28_1_13 = {{2{acts_0_28_685[5]}}, acts_0_28_685} + {{2{acts_0_28_730[5]}}, acts_0_28_730} + {{2{acts_0_28_747[5]}}, acts_0_28_747} + {{2{acts_0_28_750[5]}}, acts_0_28_750};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_13), .q(s_0_28_1_13_reg));

    assign s_0_28_1_14 = {{2{acts_0_28_752[5]}}, acts_0_28_752} + {{2{acts_0_28_772[5]}}, acts_0_28_772} + {{2{acts_0_28_778[5]}}, acts_0_28_778};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_14), .q(s_0_28_1_14_reg));

  // Stage 2
    assign s_0_28_2_0 = {{2{s_0_28_1_0_reg[7]}}, s_0_28_1_0_reg} + {{2{s_0_28_1_1_reg[7]}}, s_0_28_1_1_reg} + {{2{s_0_28_1_2_reg[7]}}, s_0_28_1_2_reg} + {{2{s_0_28_1_3_reg[7]}}, s_0_28_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_28_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_2_0), .q(s_0_28_2_0_reg));

    assign s_0_28_2_1 = {{2{s_0_28_1_4_reg[7]}}, s_0_28_1_4_reg} + {{2{s_0_28_1_5_reg[7]}}, s_0_28_1_5_reg} + {{2{s_0_28_1_6_reg[7]}}, s_0_28_1_6_reg} + {{2{s_0_28_1_7_reg[7]}}, s_0_28_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_28_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_2_1), .q(s_0_28_2_1_reg));

    assign s_0_28_2_2 = {{2{s_0_28_1_8_reg[7]}}, s_0_28_1_8_reg} + {{2{s_0_28_1_9_reg[7]}}, s_0_28_1_9_reg} + {{2{s_0_28_1_10_reg[7]}}, s_0_28_1_10_reg} + {{2{s_0_28_1_11_reg[7]}}, s_0_28_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_28_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_2_2), .q(s_0_28_2_2_reg));

    assign s_0_28_2_3 = {{2{s_0_28_1_12_reg[7]}}, s_0_28_1_12_reg} + {{2{s_0_28_1_13_reg[7]}}, s_0_28_1_13_reg} + {{2{s_0_28_1_14_reg[7]}}, s_0_28_1_14_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_28_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_2_3), .q(s_0_28_2_3_reg));

  // Stage 3
    assign s_0_28_3_0 = {{2{s_0_28_2_0_reg[9]}}, s_0_28_2_0_reg} + {{2{s_0_28_2_1_reg[9]}}, s_0_28_2_1_reg} + {{2{s_0_28_2_2_reg[9]}}, s_0_28_2_2_reg} + {{2{s_0_28_2_3_reg[9]}}, s_0_28_2_3_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_28_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_3_0), .q(s_0_28_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_28_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_28_3_0_reg[11]}}, s_0_28_3_0_reg}), .q(sum_0_28_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_28 (.i_data(sum_0_28_reg), .o_data(out_0_28_sat));


    // Layer 0, Node 29
      logic  [11:0] s_0_29_3_0;
    logic  [11:0] s_0_29_3_0_reg;
    logic  [7:0] s_0_29_1_0, s_0_29_1_1, s_0_29_1_2, s_0_29_1_3, s_0_29_1_4, s_0_29_1_5, s_0_29_1_6, s_0_29_1_7;
    logic  [7:0] s_0_29_1_0_reg, s_0_29_1_1_reg, s_0_29_1_2_reg, s_0_29_1_3_reg, s_0_29_1_4_reg, s_0_29_1_5_reg, s_0_29_1_6_reg, s_0_29_1_7_reg;
    logic  [9:0] s_0_29_2_0, s_0_29_2_1;
    logic  [9:0] s_0_29_2_0_reg, s_0_29_2_1_reg;
    logic [13:0] sum_0_29;
    logic [13:0] sum_0_29_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_173)) 
    rom_0_29_173 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[173]), .o_ld_data(acts_0_29_173));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_183)) 
    rom_0_29_183 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[183]), .o_ld_data(acts_0_29_183));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_184)) 
    rom_0_29_184 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[184]), .o_ld_data(acts_0_29_184));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_211)) 
    rom_0_29_211 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[211]), .o_ld_data(acts_0_29_211));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_212)) 
    rom_0_29_212 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[212]), .o_ld_data(acts_0_29_212));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_215)) 
    rom_0_29_215 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[215]), .o_ld_data(acts_0_29_215));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_239)) 
    rom_0_29_239 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[239]), .o_ld_data(acts_0_29_239));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_266)) 
    rom_0_29_266 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[266]), .o_ld_data(acts_0_29_266));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_267)) 
    rom_0_29_267 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[267]), .o_ld_data(acts_0_29_267));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_333)) 
    rom_0_29_333 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[333]), .o_ld_data(acts_0_29_333));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_351)) 
    rom_0_29_351 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[351]), .o_ld_data(acts_0_29_351));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_380)) 
    rom_0_29_380 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[380]), .o_ld_data(acts_0_29_380));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_381)) 
    rom_0_29_381 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[381]), .o_ld_data(acts_0_29_381));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_410)) 
    rom_0_29_410 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[410]), .o_ld_data(acts_0_29_410));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_411)) 
    rom_0_29_411 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[411]), .o_ld_data(acts_0_29_411));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_432)) 
    rom_0_29_432 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[432]), .o_ld_data(acts_0_29_432));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_440)) 
    rom_0_29_440 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[440]), .o_ld_data(acts_0_29_440));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_460)) 
    rom_0_29_460 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[460]), .o_ld_data(acts_0_29_460));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_472)) 
    rom_0_29_472 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[472]), .o_ld_data(acts_0_29_472));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_473)) 
    rom_0_29_473 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[473]), .o_ld_data(acts_0_29_473));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_488)) 
    rom_0_29_488 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[488]), .o_ld_data(acts_0_29_488));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_500)) 
    rom_0_29_500 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[500]), .o_ld_data(acts_0_29_500));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_516)) 
    rom_0_29_516 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[516]), .o_ld_data(acts_0_29_516));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_544)) 
    rom_0_29_544 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[544]), .o_ld_data(acts_0_29_544));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_570)) 
    rom_0_29_570 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[570]), .o_ld_data(acts_0_29_570));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_571)) 
    rom_0_29_571 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[571]), .o_ld_data(acts_0_29_571));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_572)) 
    rom_0_29_572 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[572]), .o_ld_data(acts_0_29_572));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_628)) 
    rom_0_29_628 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[628]), .o_ld_data(acts_0_29_628));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_658)) 
    rom_0_29_658 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[658]), .o_ld_data(acts_0_29_658));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_679)) 
    rom_0_29_679 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[679]), .o_ld_data(acts_0_29_679));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_29_680)) 
    rom_0_29_680 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[680]), .o_ld_data(acts_0_29_680));

  // Stage 1
    assign s_0_29_1_0 = {{2{acts_0_29_173[5]}}, acts_0_29_173} + {{2{acts_0_29_183[5]}}, acts_0_29_183} + {{2{acts_0_29_184[5]}}, acts_0_29_184} + {{2{acts_0_29_211[5]}}, acts_0_29_211};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_0), .q(s_0_29_1_0_reg));

    assign s_0_29_1_1 = {{2{acts_0_29_212[5]}}, acts_0_29_212} + {{2{acts_0_29_215[5]}}, acts_0_29_215} + {{2{acts_0_29_239[5]}}, acts_0_29_239} + {{2{acts_0_29_266[5]}}, acts_0_29_266};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_1), .q(s_0_29_1_1_reg));

    assign s_0_29_1_2 = {{2{acts_0_29_267[5]}}, acts_0_29_267} + {{2{acts_0_29_333[5]}}, acts_0_29_333} + {{2{acts_0_29_351[5]}}, acts_0_29_351} + {{2{acts_0_29_380[5]}}, acts_0_29_380};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_2), .q(s_0_29_1_2_reg));

    assign s_0_29_1_3 = {{2{acts_0_29_381[5]}}, acts_0_29_381} + {{2{acts_0_29_410[5]}}, acts_0_29_410} + {{2{acts_0_29_411[5]}}, acts_0_29_411} + {{2{acts_0_29_432[5]}}, acts_0_29_432};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_3), .q(s_0_29_1_3_reg));

    assign s_0_29_1_4 = {{2{acts_0_29_440[5]}}, acts_0_29_440} + {{2{acts_0_29_460[5]}}, acts_0_29_460} + {{2{acts_0_29_472[5]}}, acts_0_29_472} + {{2{acts_0_29_473[5]}}, acts_0_29_473};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_4), .q(s_0_29_1_4_reg));

    assign s_0_29_1_5 = {{2{acts_0_29_488[5]}}, acts_0_29_488} + {{2{acts_0_29_500[5]}}, acts_0_29_500} + {{2{acts_0_29_516[5]}}, acts_0_29_516} + {{2{acts_0_29_544[5]}}, acts_0_29_544};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_5), .q(s_0_29_1_5_reg));

    assign s_0_29_1_6 = {{2{acts_0_29_570[5]}}, acts_0_29_570} + {{2{acts_0_29_571[5]}}, acts_0_29_571} + {{2{acts_0_29_572[5]}}, acts_0_29_572} + {{2{acts_0_29_628[5]}}, acts_0_29_628};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_6), .q(s_0_29_1_6_reg));

    assign s_0_29_1_7 = {{2{acts_0_29_658[5]}}, acts_0_29_658} + {{2{acts_0_29_679[5]}}, acts_0_29_679} + {{2{acts_0_29_680[5]}}, acts_0_29_680};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_7), .q(s_0_29_1_7_reg));

  // Stage 2
    assign s_0_29_2_0 = {{2{s_0_29_1_0_reg[7]}}, s_0_29_1_0_reg} + {{2{s_0_29_1_1_reg[7]}}, s_0_29_1_1_reg} + {{2{s_0_29_1_2_reg[7]}}, s_0_29_1_2_reg} + {{2{s_0_29_1_3_reg[7]}}, s_0_29_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_29_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_2_0), .q(s_0_29_2_0_reg));

    assign s_0_29_2_1 = {{2{s_0_29_1_4_reg[7]}}, s_0_29_1_4_reg} + {{2{s_0_29_1_5_reg[7]}}, s_0_29_1_5_reg} + {{2{s_0_29_1_6_reg[7]}}, s_0_29_1_6_reg} + {{2{s_0_29_1_7_reg[7]}}, s_0_29_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_29_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_2_1), .q(s_0_29_2_1_reg));

  // Stage 3
    assign s_0_29_3_0 = {{2{s_0_29_2_0_reg[9]}}, s_0_29_2_0_reg} + {{2{s_0_29_2_1_reg[9]}}, s_0_29_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_29_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_3_0), .q(s_0_29_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_29_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_29_3_0_reg[11]}}, s_0_29_3_0_reg}), .q(sum_0_29_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_29 (.i_data(sum_0_29_reg), .o_data(out_0_29_sat));


    // Layer 0, Node 30
      logic  [11:0] s_0_30_3_0;
    logic  [11:0] s_0_30_3_0_reg;
    logic  [7:0] s_0_30_1_0, s_0_30_1_1, s_0_30_1_2, s_0_30_1_3, s_0_30_1_4, s_0_30_1_5, s_0_30_1_6, s_0_30_1_7, s_0_30_1_8;
    logic  [7:0] s_0_30_1_0_reg, s_0_30_1_1_reg, s_0_30_1_2_reg, s_0_30_1_3_reg, s_0_30_1_4_reg, s_0_30_1_5_reg, s_0_30_1_6_reg, s_0_30_1_7_reg, s_0_30_1_8_reg;
    logic  [9:0] s_0_30_2_0, s_0_30_2_1, s_0_30_2_2;
    logic  [9:0] s_0_30_2_0_reg, s_0_30_2_1_reg, s_0_30_2_2_reg;
    logic [13:0] sum_0_30;
    logic [13:0] sum_0_30_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_127)) 
    rom_0_30_127 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[127]), .o_ld_data(acts_0_30_127));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_159)) 
    rom_0_30_159 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[159]), .o_ld_data(acts_0_30_159));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_161)) 
    rom_0_30_161 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[161]), .o_ld_data(acts_0_30_161));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_188)) 
    rom_0_30_188 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[188]), .o_ld_data(acts_0_30_188));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_203)) 
    rom_0_30_203 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[203]), .o_ld_data(acts_0_30_203));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_213)) 
    rom_0_30_213 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[213]), .o_ld_data(acts_0_30_213));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_230)) 
    rom_0_30_230 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[230]), .o_ld_data(acts_0_30_230));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_248)) 
    rom_0_30_248 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[248]), .o_ld_data(acts_0_30_248));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_259)) 
    rom_0_30_259 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[259]), .o_ld_data(acts_0_30_259));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_292)) 
    rom_0_30_292 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[292]), .o_ld_data(acts_0_30_292));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_293)) 
    rom_0_30_293 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[293]), .o_ld_data(acts_0_30_293));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_326)) 
    rom_0_30_326 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[326]), .o_ld_data(acts_0_30_326));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_376)) 
    rom_0_30_376 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[376]), .o_ld_data(acts_0_30_376));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_381)) 
    rom_0_30_381 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[381]), .o_ld_data(acts_0_30_381));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_383)) 
    rom_0_30_383 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[383]), .o_ld_data(acts_0_30_383));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_432)) 
    rom_0_30_432 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[432]), .o_ld_data(acts_0_30_432));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_435)) 
    rom_0_30_435 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[435]), .o_ld_data(acts_0_30_435));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_459)) 
    rom_0_30_459 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[459]), .o_ld_data(acts_0_30_459));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_486)) 
    rom_0_30_486 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[486]), .o_ld_data(acts_0_30_486));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_487)) 
    rom_0_30_487 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[487]), .o_ld_data(acts_0_30_487));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_489)) 
    rom_0_30_489 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[489]), .o_ld_data(acts_0_30_489));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_517)) 
    rom_0_30_517 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[517]), .o_ld_data(acts_0_30_517));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_542)) 
    rom_0_30_542 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[542]), .o_ld_data(acts_0_30_542));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_545)) 
    rom_0_30_545 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[545]), .o_ld_data(acts_0_30_545));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_546)) 
    rom_0_30_546 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[546]), .o_ld_data(acts_0_30_546));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_566)) 
    rom_0_30_566 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[566]), .o_ld_data(acts_0_30_566));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_568)) 
    rom_0_30_568 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[568]), .o_ld_data(acts_0_30_568));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_570)) 
    rom_0_30_570 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[570]), .o_ld_data(acts_0_30_570));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_573)) 
    rom_0_30_573 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[573]), .o_ld_data(acts_0_30_573));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_576)) 
    rom_0_30_576 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[576]), .o_ld_data(acts_0_30_576));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_578)) 
    rom_0_30_578 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[578]), .o_ld_data(acts_0_30_578));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_598)) 
    rom_0_30_598 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[598]), .o_ld_data(acts_0_30_598));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_30_627)) 
    rom_0_30_627 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[627]), .o_ld_data(acts_0_30_627));

  // Stage 1
    assign s_0_30_1_0 = {{2{acts_0_30_127[5]}}, acts_0_30_127} + {{2{acts_0_30_159[5]}}, acts_0_30_159} + {{2{acts_0_30_161[5]}}, acts_0_30_161} + {{2{acts_0_30_188[5]}}, acts_0_30_188};
    registers #(.ARRAY_WIDTH(8)) r_0_30_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_1_0), .q(s_0_30_1_0_reg));

    assign s_0_30_1_1 = {{2{acts_0_30_203[5]}}, acts_0_30_203} + {{2{acts_0_30_213[5]}}, acts_0_30_213} + {{2{acts_0_30_230[5]}}, acts_0_30_230} + {{2{acts_0_30_248[5]}}, acts_0_30_248};
    registers #(.ARRAY_WIDTH(8)) r_0_30_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_1_1), .q(s_0_30_1_1_reg));

    assign s_0_30_1_2 = {{2{acts_0_30_259[5]}}, acts_0_30_259} + {{2{acts_0_30_292[5]}}, acts_0_30_292} + {{2{acts_0_30_293[5]}}, acts_0_30_293} + {{2{acts_0_30_326[5]}}, acts_0_30_326};
    registers #(.ARRAY_WIDTH(8)) r_0_30_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_1_2), .q(s_0_30_1_2_reg));

    assign s_0_30_1_3 = {{2{acts_0_30_376[5]}}, acts_0_30_376} + {{2{acts_0_30_381[5]}}, acts_0_30_381} + {{2{acts_0_30_383[5]}}, acts_0_30_383} + {{2{acts_0_30_432[5]}}, acts_0_30_432};
    registers #(.ARRAY_WIDTH(8)) r_0_30_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_1_3), .q(s_0_30_1_3_reg));

    assign s_0_30_1_4 = {{2{acts_0_30_435[5]}}, acts_0_30_435} + {{2{acts_0_30_459[5]}}, acts_0_30_459} + {{2{acts_0_30_486[5]}}, acts_0_30_486} + {{2{acts_0_30_487[5]}}, acts_0_30_487};
    registers #(.ARRAY_WIDTH(8)) r_0_30_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_1_4), .q(s_0_30_1_4_reg));

    assign s_0_30_1_5 = {{2{acts_0_30_489[5]}}, acts_0_30_489} + {{2{acts_0_30_517[5]}}, acts_0_30_517} + {{2{acts_0_30_542[5]}}, acts_0_30_542} + {{2{acts_0_30_545[5]}}, acts_0_30_545};
    registers #(.ARRAY_WIDTH(8)) r_0_30_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_1_5), .q(s_0_30_1_5_reg));

    assign s_0_30_1_6 = {{2{acts_0_30_546[5]}}, acts_0_30_546} + {{2{acts_0_30_566[5]}}, acts_0_30_566} + {{2{acts_0_30_568[5]}}, acts_0_30_568} + {{2{acts_0_30_570[5]}}, acts_0_30_570};
    registers #(.ARRAY_WIDTH(8)) r_0_30_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_1_6), .q(s_0_30_1_6_reg));

    assign s_0_30_1_7 = {{2{acts_0_30_573[5]}}, acts_0_30_573} + {{2{acts_0_30_576[5]}}, acts_0_30_576} + {{2{acts_0_30_578[5]}}, acts_0_30_578} + {{2{acts_0_30_598[5]}}, acts_0_30_598};
    registers #(.ARRAY_WIDTH(8)) r_0_30_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_1_7), .q(s_0_30_1_7_reg));

    assign s_0_30_1_8 = {{2{acts_0_30_627[5]}}, acts_0_30_627};
    registers #(.ARRAY_WIDTH(8)) r_0_30_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_1_8), .q(s_0_30_1_8_reg));

  // Stage 2
    assign s_0_30_2_0 = {{2{s_0_30_1_0_reg[7]}}, s_0_30_1_0_reg} + {{2{s_0_30_1_1_reg[7]}}, s_0_30_1_1_reg} + {{2{s_0_30_1_2_reg[7]}}, s_0_30_1_2_reg} + {{2{s_0_30_1_3_reg[7]}}, s_0_30_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_30_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_2_0), .q(s_0_30_2_0_reg));

    assign s_0_30_2_1 = {{2{s_0_30_1_4_reg[7]}}, s_0_30_1_4_reg} + {{2{s_0_30_1_5_reg[7]}}, s_0_30_1_5_reg} + {{2{s_0_30_1_6_reg[7]}}, s_0_30_1_6_reg} + {{2{s_0_30_1_7_reg[7]}}, s_0_30_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_30_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_2_1), .q(s_0_30_2_1_reg));

    assign s_0_30_2_2 = {{2{s_0_30_1_8_reg[7]}}, s_0_30_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_30_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_2_2), .q(s_0_30_2_2_reg));

  // Stage 3
    assign s_0_30_3_0 = {{2{s_0_30_2_0_reg[9]}}, s_0_30_2_0_reg} + {{2{s_0_30_2_1_reg[9]}}, s_0_30_2_1_reg} + {{2{s_0_30_2_2_reg[9]}}, s_0_30_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_30_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_3_0), .q(s_0_30_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_30_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_30_3_0_reg[11]}}, s_0_30_3_0_reg}), .q(sum_0_30_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_30 (.i_data(sum_0_30_reg), .o_data(out_0_30_sat));


    // Layer 0, Node 31
      logic  [11:0] s_0_31_3_0;
    logic  [11:0] s_0_31_3_0_reg;
    logic  [7:0] s_0_31_1_0, s_0_31_1_1, s_0_31_1_2, s_0_31_1_3, s_0_31_1_4, s_0_31_1_5, s_0_31_1_6, s_0_31_1_7, s_0_31_1_8;
    logic  [7:0] s_0_31_1_0_reg, s_0_31_1_1_reg, s_0_31_1_2_reg, s_0_31_1_3_reg, s_0_31_1_4_reg, s_0_31_1_5_reg, s_0_31_1_6_reg, s_0_31_1_7_reg, s_0_31_1_8_reg;
    logic  [9:0] s_0_31_2_0, s_0_31_2_1, s_0_31_2_2;
    logic  [9:0] s_0_31_2_0_reg, s_0_31_2_1_reg, s_0_31_2_2_reg;
    logic [13:0] sum_0_31;
    logic [13:0] sum_0_31_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_349)) 
    rom_0_31_349 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[349]), .o_ld_data(acts_0_31_349));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_376)) 
    rom_0_31_376 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[376]), .o_ld_data(acts_0_31_376));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_401)) 
    rom_0_31_401 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[401]), .o_ld_data(acts_0_31_401));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_404)) 
    rom_0_31_404 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[404]), .o_ld_data(acts_0_31_404));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_405)) 
    rom_0_31_405 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[405]), .o_ld_data(acts_0_31_405));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_407)) 
    rom_0_31_407 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[407]), .o_ld_data(acts_0_31_407));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_429)) 
    rom_0_31_429 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[429]), .o_ld_data(acts_0_31_429));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_430)) 
    rom_0_31_430 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[430]), .o_ld_data(acts_0_31_430));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_431)) 
    rom_0_31_431 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[431]), .o_ld_data(acts_0_31_431));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_433)) 
    rom_0_31_433 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[433]), .o_ld_data(acts_0_31_433));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_435)) 
    rom_0_31_435 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[435]), .o_ld_data(acts_0_31_435));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_481)) 
    rom_0_31_481 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[481]), .o_ld_data(acts_0_31_481));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_482)) 
    rom_0_31_482 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[482]), .o_ld_data(acts_0_31_482));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_483)) 
    rom_0_31_483 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[483]), .o_ld_data(acts_0_31_483));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_484)) 
    rom_0_31_484 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[484]), .o_ld_data(acts_0_31_484));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_511)) 
    rom_0_31_511 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[511]), .o_ld_data(acts_0_31_511));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_512)) 
    rom_0_31_512 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[512]), .o_ld_data(acts_0_31_512));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_513)) 
    rom_0_31_513 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[513]), .o_ld_data(acts_0_31_513));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_514)) 
    rom_0_31_514 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[514]), .o_ld_data(acts_0_31_514));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_515)) 
    rom_0_31_515 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[515]), .o_ld_data(acts_0_31_515));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_516)) 
    rom_0_31_516 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[516]), .o_ld_data(acts_0_31_516));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_522)) 
    rom_0_31_522 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[522]), .o_ld_data(acts_0_31_522));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_542)) 
    rom_0_31_542 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[542]), .o_ld_data(acts_0_31_542));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_544)) 
    rom_0_31_544 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[544]), .o_ld_data(acts_0_31_544));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_545)) 
    rom_0_31_545 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[545]), .o_ld_data(acts_0_31_545));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_546)) 
    rom_0_31_546 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[546]), .o_ld_data(acts_0_31_546));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_547)) 
    rom_0_31_547 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[547]), .o_ld_data(acts_0_31_547));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_595)) 
    rom_0_31_595 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[595]), .o_ld_data(acts_0_31_595));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_597)) 
    rom_0_31_597 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[597]), .o_ld_data(acts_0_31_597));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_604)) 
    rom_0_31_604 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[604]), .o_ld_data(acts_0_31_604));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_605)) 
    rom_0_31_605 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[605]), .o_ld_data(acts_0_31_605));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_622)) 
    rom_0_31_622 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[622]), .o_ld_data(acts_0_31_622));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_632)) 
    rom_0_31_632 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[632]), .o_ld_data(acts_0_31_632));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_654)) 
    rom_0_31_654 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[654]), .o_ld_data(acts_0_31_654));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_679)) 
    rom_0_31_679 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[679]), .o_ld_data(acts_0_31_679));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_31_708)) 
    rom_0_31_708 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[708]), .o_ld_data(acts_0_31_708));

  // Stage 1
    assign s_0_31_1_0 = {{2{acts_0_31_349[5]}}, acts_0_31_349} + {{2{acts_0_31_376[5]}}, acts_0_31_376} + {{2{acts_0_31_401[5]}}, acts_0_31_401} + {{2{acts_0_31_404[5]}}, acts_0_31_404};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_0), .q(s_0_31_1_0_reg));

    assign s_0_31_1_1 = {{2{acts_0_31_405[5]}}, acts_0_31_405} + {{2{acts_0_31_407[5]}}, acts_0_31_407} + {{2{acts_0_31_429[5]}}, acts_0_31_429} + {{2{acts_0_31_430[5]}}, acts_0_31_430};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_1), .q(s_0_31_1_1_reg));

    assign s_0_31_1_2 = {{2{acts_0_31_431[5]}}, acts_0_31_431} + {{2{acts_0_31_433[5]}}, acts_0_31_433} + {{2{acts_0_31_435[5]}}, acts_0_31_435} + {{2{acts_0_31_481[5]}}, acts_0_31_481};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_2), .q(s_0_31_1_2_reg));

    assign s_0_31_1_3 = {{2{acts_0_31_482[5]}}, acts_0_31_482} + {{2{acts_0_31_483[5]}}, acts_0_31_483} + {{2{acts_0_31_484[5]}}, acts_0_31_484} + {{2{acts_0_31_511[5]}}, acts_0_31_511};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_3), .q(s_0_31_1_3_reg));

    assign s_0_31_1_4 = {{2{acts_0_31_512[5]}}, acts_0_31_512} + {{2{acts_0_31_513[5]}}, acts_0_31_513} + {{2{acts_0_31_514[5]}}, acts_0_31_514} + {{2{acts_0_31_515[5]}}, acts_0_31_515};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_4), .q(s_0_31_1_4_reg));

    assign s_0_31_1_5 = {{2{acts_0_31_516[5]}}, acts_0_31_516} + {{2{acts_0_31_522[5]}}, acts_0_31_522} + {{2{acts_0_31_542[5]}}, acts_0_31_542} + {{2{acts_0_31_544[5]}}, acts_0_31_544};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_5), .q(s_0_31_1_5_reg));

    assign s_0_31_1_6 = {{2{acts_0_31_545[5]}}, acts_0_31_545} + {{2{acts_0_31_546[5]}}, acts_0_31_546} + {{2{acts_0_31_547[5]}}, acts_0_31_547} + {{2{acts_0_31_595[5]}}, acts_0_31_595};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_6), .q(s_0_31_1_6_reg));

    assign s_0_31_1_7 = {{2{acts_0_31_597[5]}}, acts_0_31_597} + {{2{acts_0_31_604[5]}}, acts_0_31_604} + {{2{acts_0_31_605[5]}}, acts_0_31_605} + {{2{acts_0_31_622[5]}}, acts_0_31_622};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_7), .q(s_0_31_1_7_reg));

    assign s_0_31_1_8 = {{2{acts_0_31_632[5]}}, acts_0_31_632} + {{2{acts_0_31_654[5]}}, acts_0_31_654} + {{2{acts_0_31_679[5]}}, acts_0_31_679} + {{2{acts_0_31_708[5]}}, acts_0_31_708};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_8), .q(s_0_31_1_8_reg));

  // Stage 2
    assign s_0_31_2_0 = {{2{s_0_31_1_0_reg[7]}}, s_0_31_1_0_reg} + {{2{s_0_31_1_1_reg[7]}}, s_0_31_1_1_reg} + {{2{s_0_31_1_2_reg[7]}}, s_0_31_1_2_reg} + {{2{s_0_31_1_3_reg[7]}}, s_0_31_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_31_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_2_0), .q(s_0_31_2_0_reg));

    assign s_0_31_2_1 = {{2{s_0_31_1_4_reg[7]}}, s_0_31_1_4_reg} + {{2{s_0_31_1_5_reg[7]}}, s_0_31_1_5_reg} + {{2{s_0_31_1_6_reg[7]}}, s_0_31_1_6_reg} + {{2{s_0_31_1_7_reg[7]}}, s_0_31_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_31_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_2_1), .q(s_0_31_2_1_reg));

    assign s_0_31_2_2 = {{2{s_0_31_1_8_reg[7]}}, s_0_31_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_31_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_2_2), .q(s_0_31_2_2_reg));

  // Stage 3
    assign s_0_31_3_0 = {{2{s_0_31_2_0_reg[9]}}, s_0_31_2_0_reg} + {{2{s_0_31_2_1_reg[9]}}, s_0_31_2_1_reg} + {{2{s_0_31_2_2_reg[9]}}, s_0_31_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_31_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_3_0), .q(s_0_31_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_31_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_31_3_0_reg[11]}}, s_0_31_3_0_reg}), .q(sum_0_31_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_31 (.i_data(sum_0_31_reg), .o_data(out_0_31_sat));


    // Layer 0, Node 32
      logic  [11:0] s_0_32_3_0;
    logic  [11:0] s_0_32_3_0_reg;
    logic  [7:0] s_0_32_1_0, s_0_32_1_1, s_0_32_1_2, s_0_32_1_3, s_0_32_1_4, s_0_32_1_5, s_0_32_1_6, s_0_32_1_7;
    logic  [7:0] s_0_32_1_0_reg, s_0_32_1_1_reg, s_0_32_1_2_reg, s_0_32_1_3_reg, s_0_32_1_4_reg, s_0_32_1_5_reg, s_0_32_1_6_reg, s_0_32_1_7_reg;
    logic  [9:0] s_0_32_2_0, s_0_32_2_1;
    logic  [9:0] s_0_32_2_0_reg, s_0_32_2_1_reg;
    logic [13:0] sum_0_32;
    logic [13:0] sum_0_32_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_38)) 
    rom_0_32_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_32_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_125)) 
    rom_0_32_125 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[125]), .o_ld_data(acts_0_32_125));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_126)) 
    rom_0_32_126 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[126]), .o_ld_data(acts_0_32_126));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_152)) 
    rom_0_32_152 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[152]), .o_ld_data(acts_0_32_152));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_154)) 
    rom_0_32_154 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[154]), .o_ld_data(acts_0_32_154));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_155)) 
    rom_0_32_155 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[155]), .o_ld_data(acts_0_32_155));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_182)) 
    rom_0_32_182 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[182]), .o_ld_data(acts_0_32_182));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_183)) 
    rom_0_32_183 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[183]), .o_ld_data(acts_0_32_183));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_184)) 
    rom_0_32_184 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[184]), .o_ld_data(acts_0_32_184));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_185)) 
    rom_0_32_185 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[185]), .o_ld_data(acts_0_32_185));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_186)) 
    rom_0_32_186 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[186]), .o_ld_data(acts_0_32_186));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_212)) 
    rom_0_32_212 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[212]), .o_ld_data(acts_0_32_212));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_213)) 
    rom_0_32_213 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[213]), .o_ld_data(acts_0_32_213));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_214)) 
    rom_0_32_214 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[214]), .o_ld_data(acts_0_32_214));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_215)) 
    rom_0_32_215 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[215]), .o_ld_data(acts_0_32_215));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_237)) 
    rom_0_32_237 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[237]), .o_ld_data(acts_0_32_237));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_243)) 
    rom_0_32_243 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[243]), .o_ld_data(acts_0_32_243));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_245)) 
    rom_0_32_245 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[245]), .o_ld_data(acts_0_32_245));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_266)) 
    rom_0_32_266 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[266]), .o_ld_data(acts_0_32_266));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_271)) 
    rom_0_32_271 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[271]), .o_ld_data(acts_0_32_271));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_272)) 
    rom_0_32_272 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[272]), .o_ld_data(acts_0_32_272));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_296)) 
    rom_0_32_296 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[296]), .o_ld_data(acts_0_32_296));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_303)) 
    rom_0_32_303 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[303]), .o_ld_data(acts_0_32_303));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_322)) 
    rom_0_32_322 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[322]), .o_ld_data(acts_0_32_322));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_323)) 
    rom_0_32_323 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[323]), .o_ld_data(acts_0_32_323));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_349)) 
    rom_0_32_349 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[349]), .o_ld_data(acts_0_32_349));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_444)) 
    rom_0_32_444 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[444]), .o_ld_data(acts_0_32_444));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_467)) 
    rom_0_32_467 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[467]), .o_ld_data(acts_0_32_467));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_496)) 
    rom_0_32_496 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[496]), .o_ld_data(acts_0_32_496));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_32_523)) 
    rom_0_32_523 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[523]), .o_ld_data(acts_0_32_523));

  // Stage 1
    assign s_0_32_1_0 = {{2{acts_0_32_38[5]}}, acts_0_32_38} + {{2{acts_0_32_125[5]}}, acts_0_32_125} + {{2{acts_0_32_126[5]}}, acts_0_32_126} + {{2{acts_0_32_152[5]}}, acts_0_32_152};
    registers #(.ARRAY_WIDTH(8)) r_0_32_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_1_0), .q(s_0_32_1_0_reg));

    assign s_0_32_1_1 = {{2{acts_0_32_154[5]}}, acts_0_32_154} + {{2{acts_0_32_155[5]}}, acts_0_32_155} + {{2{acts_0_32_182[5]}}, acts_0_32_182} + {{2{acts_0_32_183[5]}}, acts_0_32_183};
    registers #(.ARRAY_WIDTH(8)) r_0_32_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_1_1), .q(s_0_32_1_1_reg));

    assign s_0_32_1_2 = {{2{acts_0_32_184[5]}}, acts_0_32_184} + {{2{acts_0_32_185[5]}}, acts_0_32_185} + {{2{acts_0_32_186[5]}}, acts_0_32_186} + {{2{acts_0_32_212[5]}}, acts_0_32_212};
    registers #(.ARRAY_WIDTH(8)) r_0_32_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_1_2), .q(s_0_32_1_2_reg));

    assign s_0_32_1_3 = {{2{acts_0_32_213[5]}}, acts_0_32_213} + {{2{acts_0_32_214[5]}}, acts_0_32_214} + {{2{acts_0_32_215[5]}}, acts_0_32_215} + {{2{acts_0_32_237[5]}}, acts_0_32_237};
    registers #(.ARRAY_WIDTH(8)) r_0_32_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_1_3), .q(s_0_32_1_3_reg));

    assign s_0_32_1_4 = {{2{acts_0_32_243[5]}}, acts_0_32_243} + {{2{acts_0_32_245[5]}}, acts_0_32_245} + {{2{acts_0_32_266[5]}}, acts_0_32_266} + {{2{acts_0_32_271[5]}}, acts_0_32_271};
    registers #(.ARRAY_WIDTH(8)) r_0_32_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_1_4), .q(s_0_32_1_4_reg));

    assign s_0_32_1_5 = {{2{acts_0_32_272[5]}}, acts_0_32_272} + {{2{acts_0_32_296[5]}}, acts_0_32_296} + {{2{acts_0_32_303[5]}}, acts_0_32_303} + {{2{acts_0_32_322[5]}}, acts_0_32_322};
    registers #(.ARRAY_WIDTH(8)) r_0_32_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_1_5), .q(s_0_32_1_5_reg));

    assign s_0_32_1_6 = {{2{acts_0_32_323[5]}}, acts_0_32_323} + {{2{acts_0_32_349[5]}}, acts_0_32_349} + {{2{acts_0_32_444[5]}}, acts_0_32_444} + {{2{acts_0_32_467[5]}}, acts_0_32_467};
    registers #(.ARRAY_WIDTH(8)) r_0_32_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_1_6), .q(s_0_32_1_6_reg));

    assign s_0_32_1_7 = {{2{acts_0_32_496[5]}}, acts_0_32_496} + {{2{acts_0_32_523[5]}}, acts_0_32_523};
    registers #(.ARRAY_WIDTH(8)) r_0_32_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_1_7), .q(s_0_32_1_7_reg));

  // Stage 2
    assign s_0_32_2_0 = {{2{s_0_32_1_0_reg[7]}}, s_0_32_1_0_reg} + {{2{s_0_32_1_1_reg[7]}}, s_0_32_1_1_reg} + {{2{s_0_32_1_2_reg[7]}}, s_0_32_1_2_reg} + {{2{s_0_32_1_3_reg[7]}}, s_0_32_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_32_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_2_0), .q(s_0_32_2_0_reg));

    assign s_0_32_2_1 = {{2{s_0_32_1_4_reg[7]}}, s_0_32_1_4_reg} + {{2{s_0_32_1_5_reg[7]}}, s_0_32_1_5_reg} + {{2{s_0_32_1_6_reg[7]}}, s_0_32_1_6_reg} + {{2{s_0_32_1_7_reg[7]}}, s_0_32_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_32_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_2_1), .q(s_0_32_2_1_reg));

  // Stage 3
    assign s_0_32_3_0 = {{2{s_0_32_2_0_reg[9]}}, s_0_32_2_0_reg} + {{2{s_0_32_2_1_reg[9]}}, s_0_32_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_32_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_3_0), .q(s_0_32_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_32_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_32_3_0_reg[11]}}, s_0_32_3_0_reg}), .q(sum_0_32_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_32 (.i_data(sum_0_32_reg), .o_data(out_0_32_sat));


    // Layer 0, Node 33
      logic  [11:0] s_0_33_3_0;
    logic  [11:0] s_0_33_3_0_reg;
    logic  [7:0] s_0_33_1_0, s_0_33_1_1, s_0_33_1_2, s_0_33_1_3, s_0_33_1_4, s_0_33_1_5, s_0_33_1_6, s_0_33_1_7;
    logic  [7:0] s_0_33_1_0_reg, s_0_33_1_1_reg, s_0_33_1_2_reg, s_0_33_1_3_reg, s_0_33_1_4_reg, s_0_33_1_5_reg, s_0_33_1_6_reg, s_0_33_1_7_reg;
    logic  [9:0] s_0_33_2_0, s_0_33_2_1;
    logic  [9:0] s_0_33_2_0_reg, s_0_33_2_1_reg;
    logic [13:0] sum_0_33;
    logic [13:0] sum_0_33_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_213)) 
    rom_0_33_213 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[213]), .o_ld_data(acts_0_33_213));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_347)) 
    rom_0_33_347 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[347]), .o_ld_data(acts_0_33_347));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_350)) 
    rom_0_33_350 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[350]), .o_ld_data(acts_0_33_350));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_370)) 
    rom_0_33_370 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[370]), .o_ld_data(acts_0_33_370));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_374)) 
    rom_0_33_374 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[374]), .o_ld_data(acts_0_33_374));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_376)) 
    rom_0_33_376 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[376]), .o_ld_data(acts_0_33_376));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_379)) 
    rom_0_33_379 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[379]), .o_ld_data(acts_0_33_379));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_410)) 
    rom_0_33_410 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[410]), .o_ld_data(acts_0_33_410));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_415)) 
    rom_0_33_415 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[415]), .o_ld_data(acts_0_33_415));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_416)) 
    rom_0_33_416 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[416]), .o_ld_data(acts_0_33_416));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_456)) 
    rom_0_33_456 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[456]), .o_ld_data(acts_0_33_456));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_464)) 
    rom_0_33_464 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[464]), .o_ld_data(acts_0_33_464));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_470)) 
    rom_0_33_470 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[470]), .o_ld_data(acts_0_33_470));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_471)) 
    rom_0_33_471 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[471]), .o_ld_data(acts_0_33_471));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_491)) 
    rom_0_33_491 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[491]), .o_ld_data(acts_0_33_491));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_496)) 
    rom_0_33_496 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[496]), .o_ld_data(acts_0_33_496));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_497)) 
    rom_0_33_497 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[497]), .o_ld_data(acts_0_33_497));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_524)) 
    rom_0_33_524 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[524]), .o_ld_data(acts_0_33_524));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_525)) 
    rom_0_33_525 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[525]), .o_ld_data(acts_0_33_525));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_552)) 
    rom_0_33_552 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[552]), .o_ld_data(acts_0_33_552));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_577)) 
    rom_0_33_577 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[577]), .o_ld_data(acts_0_33_577));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_580)) 
    rom_0_33_580 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[580]), .o_ld_data(acts_0_33_580));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_607)) 
    rom_0_33_607 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[607]), .o_ld_data(acts_0_33_607));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_634)) 
    rom_0_33_634 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[634]), .o_ld_data(acts_0_33_634));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_636)) 
    rom_0_33_636 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[636]), .o_ld_data(acts_0_33_636));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_662)) 
    rom_0_33_662 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[662]), .o_ld_data(acts_0_33_662));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_679)) 
    rom_0_33_679 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[679]), .o_ld_data(acts_0_33_679));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_683)) 
    rom_0_33_683 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[683]), .o_ld_data(acts_0_33_683));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_690)) 
    rom_0_33_690 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[690]), .o_ld_data(acts_0_33_690));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_691)) 
    rom_0_33_691 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[691]), .o_ld_data(acts_0_33_691));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_33_693)) 
    rom_0_33_693 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[693]), .o_ld_data(acts_0_33_693));

  // Stage 1
    assign s_0_33_1_0 = {{2{acts_0_33_213[5]}}, acts_0_33_213} + {{2{acts_0_33_347[5]}}, acts_0_33_347} + {{2{acts_0_33_350[5]}}, acts_0_33_350} + {{2{acts_0_33_370[5]}}, acts_0_33_370};
    registers #(.ARRAY_WIDTH(8)) r_0_33_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_1_0), .q(s_0_33_1_0_reg));

    assign s_0_33_1_1 = {{2{acts_0_33_374[5]}}, acts_0_33_374} + {{2{acts_0_33_376[5]}}, acts_0_33_376} + {{2{acts_0_33_379[5]}}, acts_0_33_379} + {{2{acts_0_33_410[5]}}, acts_0_33_410};
    registers #(.ARRAY_WIDTH(8)) r_0_33_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_1_1), .q(s_0_33_1_1_reg));

    assign s_0_33_1_2 = {{2{acts_0_33_415[5]}}, acts_0_33_415} + {{2{acts_0_33_416[5]}}, acts_0_33_416} + {{2{acts_0_33_456[5]}}, acts_0_33_456} + {{2{acts_0_33_464[5]}}, acts_0_33_464};
    registers #(.ARRAY_WIDTH(8)) r_0_33_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_1_2), .q(s_0_33_1_2_reg));

    assign s_0_33_1_3 = {{2{acts_0_33_470[5]}}, acts_0_33_470} + {{2{acts_0_33_471[5]}}, acts_0_33_471} + {{2{acts_0_33_491[5]}}, acts_0_33_491} + {{2{acts_0_33_496[5]}}, acts_0_33_496};
    registers #(.ARRAY_WIDTH(8)) r_0_33_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_1_3), .q(s_0_33_1_3_reg));

    assign s_0_33_1_4 = {{2{acts_0_33_497[5]}}, acts_0_33_497} + {{2{acts_0_33_524[5]}}, acts_0_33_524} + {{2{acts_0_33_525[5]}}, acts_0_33_525} + {{2{acts_0_33_552[5]}}, acts_0_33_552};
    registers #(.ARRAY_WIDTH(8)) r_0_33_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_1_4), .q(s_0_33_1_4_reg));

    assign s_0_33_1_5 = {{2{acts_0_33_577[5]}}, acts_0_33_577} + {{2{acts_0_33_580[5]}}, acts_0_33_580} + {{2{acts_0_33_607[5]}}, acts_0_33_607} + {{2{acts_0_33_634[5]}}, acts_0_33_634};
    registers #(.ARRAY_WIDTH(8)) r_0_33_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_1_5), .q(s_0_33_1_5_reg));

    assign s_0_33_1_6 = {{2{acts_0_33_636[5]}}, acts_0_33_636} + {{2{acts_0_33_662[5]}}, acts_0_33_662} + {{2{acts_0_33_679[5]}}, acts_0_33_679} + {{2{acts_0_33_683[5]}}, acts_0_33_683};
    registers #(.ARRAY_WIDTH(8)) r_0_33_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_1_6), .q(s_0_33_1_6_reg));

    assign s_0_33_1_7 = {{2{acts_0_33_690[5]}}, acts_0_33_690} + {{2{acts_0_33_691[5]}}, acts_0_33_691} + {{2{acts_0_33_693[5]}}, acts_0_33_693};
    registers #(.ARRAY_WIDTH(8)) r_0_33_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_1_7), .q(s_0_33_1_7_reg));

  // Stage 2
    assign s_0_33_2_0 = {{2{s_0_33_1_0_reg[7]}}, s_0_33_1_0_reg} + {{2{s_0_33_1_1_reg[7]}}, s_0_33_1_1_reg} + {{2{s_0_33_1_2_reg[7]}}, s_0_33_1_2_reg} + {{2{s_0_33_1_3_reg[7]}}, s_0_33_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_33_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_2_0), .q(s_0_33_2_0_reg));

    assign s_0_33_2_1 = {{2{s_0_33_1_4_reg[7]}}, s_0_33_1_4_reg} + {{2{s_0_33_1_5_reg[7]}}, s_0_33_1_5_reg} + {{2{s_0_33_1_6_reg[7]}}, s_0_33_1_6_reg} + {{2{s_0_33_1_7_reg[7]}}, s_0_33_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_33_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_2_1), .q(s_0_33_2_1_reg));

  // Stage 3
    assign s_0_33_3_0 = {{2{s_0_33_2_0_reg[9]}}, s_0_33_2_0_reg} + {{2{s_0_33_2_1_reg[9]}}, s_0_33_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_33_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_3_0), .q(s_0_33_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_33_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_33_3_0_reg[11]}}, s_0_33_3_0_reg}), .q(sum_0_33_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_33 (.i_data(sum_0_33_reg), .o_data(out_0_33_sat));


    // Layer 0, Node 34
      logic  [11:0] s_0_34_3_0;
    logic  [11:0] s_0_34_3_0_reg;
    logic  [7:0] s_0_34_1_0, s_0_34_1_1, s_0_34_1_2, s_0_34_1_3, s_0_34_1_4, s_0_34_1_5, s_0_34_1_6, s_0_34_1_7, s_0_34_1_8, s_0_34_1_9;
    logic  [7:0] s_0_34_1_0_reg, s_0_34_1_1_reg, s_0_34_1_2_reg, s_0_34_1_3_reg, s_0_34_1_4_reg, s_0_34_1_5_reg, s_0_34_1_6_reg, s_0_34_1_7_reg, s_0_34_1_8_reg, s_0_34_1_9_reg;
    logic  [9:0] s_0_34_2_0, s_0_34_2_1, s_0_34_2_2;
    logic  [9:0] s_0_34_2_0_reg, s_0_34_2_1_reg, s_0_34_2_2_reg;
    logic [13:0] sum_0_34;
    logic [13:0] sum_0_34_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_130)) 
    rom_0_34_130 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[130]), .o_ld_data(acts_0_34_130));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_153)) 
    rom_0_34_153 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[153]), .o_ld_data(acts_0_34_153));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_185)) 
    rom_0_34_185 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[185]), .o_ld_data(acts_0_34_185));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_208)) 
    rom_0_34_208 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[208]), .o_ld_data(acts_0_34_208));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_210)) 
    rom_0_34_210 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[210]), .o_ld_data(acts_0_34_210));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_212)) 
    rom_0_34_212 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[212]), .o_ld_data(acts_0_34_212));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_214)) 
    rom_0_34_214 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[214]), .o_ld_data(acts_0_34_214));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_216)) 
    rom_0_34_216 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[216]), .o_ld_data(acts_0_34_216));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_321)) 
    rom_0_34_321 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[321]), .o_ld_data(acts_0_34_321));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_322)) 
    rom_0_34_322 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[322]), .o_ld_data(acts_0_34_322));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_347)) 
    rom_0_34_347 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[347]), .o_ld_data(acts_0_34_347));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_349)) 
    rom_0_34_349 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[349]), .o_ld_data(acts_0_34_349));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_351)) 
    rom_0_34_351 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[351]), .o_ld_data(acts_0_34_351));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_352)) 
    rom_0_34_352 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[352]), .o_ld_data(acts_0_34_352));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_375)) 
    rom_0_34_375 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[375]), .o_ld_data(acts_0_34_375));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_380)) 
    rom_0_34_380 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[380]), .o_ld_data(acts_0_34_380));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_401)) 
    rom_0_34_401 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[401]), .o_ld_data(acts_0_34_401));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_402)) 
    rom_0_34_402 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[402]), .o_ld_data(acts_0_34_402));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_405)) 
    rom_0_34_405 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[405]), .o_ld_data(acts_0_34_405));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_407)) 
    rom_0_34_407 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[407]), .o_ld_data(acts_0_34_407));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_408)) 
    rom_0_34_408 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[408]), .o_ld_data(acts_0_34_408));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_412)) 
    rom_0_34_412 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[412]), .o_ld_data(acts_0_34_412));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_435)) 
    rom_0_34_435 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[435]), .o_ld_data(acts_0_34_435));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_437)) 
    rom_0_34_437 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[437]), .o_ld_data(acts_0_34_437));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_463)) 
    rom_0_34_463 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[463]), .o_ld_data(acts_0_34_463));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_467)) 
    rom_0_34_467 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[467]), .o_ld_data(acts_0_34_467));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_490)) 
    rom_0_34_490 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[490]), .o_ld_data(acts_0_34_490));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_492)) 
    rom_0_34_492 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[492]), .o_ld_data(acts_0_34_492));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_494)) 
    rom_0_34_494 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[494]), .o_ld_data(acts_0_34_494));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_519)) 
    rom_0_34_519 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[519]), .o_ld_data(acts_0_34_519));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_521)) 
    rom_0_34_521 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[521]), .o_ld_data(acts_0_34_521));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_571)) 
    rom_0_34_571 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[571]), .o_ld_data(acts_0_34_571));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_572)) 
    rom_0_34_572 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[572]), .o_ld_data(acts_0_34_572));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_579)) 
    rom_0_34_579 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[579]), .o_ld_data(acts_0_34_579));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_580)) 
    rom_0_34_580 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[580]), .o_ld_data(acts_0_34_580));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_581)) 
    rom_0_34_581 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[581]), .o_ld_data(acts_0_34_581));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_598)) 
    rom_0_34_598 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[598]), .o_ld_data(acts_0_34_598));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_631)) 
    rom_0_34_631 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[631]), .o_ld_data(acts_0_34_631));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_34_634)) 
    rom_0_34_634 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[634]), .o_ld_data(acts_0_34_634));

  // Stage 1
    assign s_0_34_1_0 = {{2{acts_0_34_130[5]}}, acts_0_34_130} + {{2{acts_0_34_153[5]}}, acts_0_34_153} + {{2{acts_0_34_185[5]}}, acts_0_34_185} + {{2{acts_0_34_208[5]}}, acts_0_34_208};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_0), .q(s_0_34_1_0_reg));

    assign s_0_34_1_1 = {{2{acts_0_34_210[5]}}, acts_0_34_210} + {{2{acts_0_34_212[5]}}, acts_0_34_212} + {{2{acts_0_34_214[5]}}, acts_0_34_214} + {{2{acts_0_34_216[5]}}, acts_0_34_216};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_1), .q(s_0_34_1_1_reg));

    assign s_0_34_1_2 = {{2{acts_0_34_321[5]}}, acts_0_34_321} + {{2{acts_0_34_322[5]}}, acts_0_34_322} + {{2{acts_0_34_347[5]}}, acts_0_34_347} + {{2{acts_0_34_349[5]}}, acts_0_34_349};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_2), .q(s_0_34_1_2_reg));

    assign s_0_34_1_3 = {{2{acts_0_34_351[5]}}, acts_0_34_351} + {{2{acts_0_34_352[5]}}, acts_0_34_352} + {{2{acts_0_34_375[5]}}, acts_0_34_375} + {{2{acts_0_34_380[5]}}, acts_0_34_380};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_3), .q(s_0_34_1_3_reg));

    assign s_0_34_1_4 = {{2{acts_0_34_401[5]}}, acts_0_34_401} + {{2{acts_0_34_402[5]}}, acts_0_34_402} + {{2{acts_0_34_405[5]}}, acts_0_34_405} + {{2{acts_0_34_407[5]}}, acts_0_34_407};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_4), .q(s_0_34_1_4_reg));

    assign s_0_34_1_5 = {{2{acts_0_34_408[5]}}, acts_0_34_408} + {{2{acts_0_34_412[5]}}, acts_0_34_412} + {{2{acts_0_34_435[5]}}, acts_0_34_435} + {{2{acts_0_34_437[5]}}, acts_0_34_437};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_5), .q(s_0_34_1_5_reg));

    assign s_0_34_1_6 = {{2{acts_0_34_463[5]}}, acts_0_34_463} + {{2{acts_0_34_467[5]}}, acts_0_34_467} + {{2{acts_0_34_490[5]}}, acts_0_34_490} + {{2{acts_0_34_492[5]}}, acts_0_34_492};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_6), .q(s_0_34_1_6_reg));

    assign s_0_34_1_7 = {{2{acts_0_34_494[5]}}, acts_0_34_494} + {{2{acts_0_34_519[5]}}, acts_0_34_519} + {{2{acts_0_34_521[5]}}, acts_0_34_521} + {{2{acts_0_34_571[5]}}, acts_0_34_571};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_7), .q(s_0_34_1_7_reg));

    assign s_0_34_1_8 = {{2{acts_0_34_572[5]}}, acts_0_34_572} + {{2{acts_0_34_579[5]}}, acts_0_34_579} + {{2{acts_0_34_580[5]}}, acts_0_34_580} + {{2{acts_0_34_581[5]}}, acts_0_34_581};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_8), .q(s_0_34_1_8_reg));

    assign s_0_34_1_9 = {{2{acts_0_34_598[5]}}, acts_0_34_598} + {{2{acts_0_34_631[5]}}, acts_0_34_631} + {{2{acts_0_34_634[5]}}, acts_0_34_634};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_9), .q(s_0_34_1_9_reg));

  // Stage 2
    assign s_0_34_2_0 = {{2{s_0_34_1_0_reg[7]}}, s_0_34_1_0_reg} + {{2{s_0_34_1_1_reg[7]}}, s_0_34_1_1_reg} + {{2{s_0_34_1_2_reg[7]}}, s_0_34_1_2_reg} + {{2{s_0_34_1_3_reg[7]}}, s_0_34_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_34_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_2_0), .q(s_0_34_2_0_reg));

    assign s_0_34_2_1 = {{2{s_0_34_1_4_reg[7]}}, s_0_34_1_4_reg} + {{2{s_0_34_1_5_reg[7]}}, s_0_34_1_5_reg} + {{2{s_0_34_1_6_reg[7]}}, s_0_34_1_6_reg} + {{2{s_0_34_1_7_reg[7]}}, s_0_34_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_34_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_2_1), .q(s_0_34_2_1_reg));

    assign s_0_34_2_2 = {{2{s_0_34_1_8_reg[7]}}, s_0_34_1_8_reg} + {{2{s_0_34_1_9_reg[7]}}, s_0_34_1_9_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_34_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_2_2), .q(s_0_34_2_2_reg));

  // Stage 3
    assign s_0_34_3_0 = {{2{s_0_34_2_0_reg[9]}}, s_0_34_2_0_reg} + {{2{s_0_34_2_1_reg[9]}}, s_0_34_2_1_reg} + {{2{s_0_34_2_2_reg[9]}}, s_0_34_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_34_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_3_0), .q(s_0_34_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_34_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_34_3_0_reg[11]}}, s_0_34_3_0_reg}), .q(sum_0_34_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_34 (.i_data(sum_0_34_reg), .o_data(out_0_34_sat));


    // Layer 0, Node 35
      logic  [11:0] s_0_35_3_0;
    logic  [11:0] s_0_35_3_0_reg;
    logic  [7:0] s_0_35_1_0, s_0_35_1_1, s_0_35_1_2, s_0_35_1_3, s_0_35_1_4, s_0_35_1_5;
    logic  [7:0] s_0_35_1_0_reg, s_0_35_1_1_reg, s_0_35_1_2_reg, s_0_35_1_3_reg, s_0_35_1_4_reg, s_0_35_1_5_reg;
    logic  [9:0] s_0_35_2_0, s_0_35_2_1;
    logic  [9:0] s_0_35_2_0_reg, s_0_35_2_1_reg;
    logic [13:0] sum_0_35;
    logic [13:0] sum_0_35_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_128)) 
    rom_0_35_128 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[128]), .o_ld_data(acts_0_35_128));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_131)) 
    rom_0_35_131 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[131]), .o_ld_data(acts_0_35_131));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_132)) 
    rom_0_35_132 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[132]), .o_ld_data(acts_0_35_132));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_158)) 
    rom_0_35_158 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[158]), .o_ld_data(acts_0_35_158));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_160)) 
    rom_0_35_160 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[160]), .o_ld_data(acts_0_35_160));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_189)) 
    rom_0_35_189 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[189]), .o_ld_data(acts_0_35_189));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_212)) 
    rom_0_35_212 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[212]), .o_ld_data(acts_0_35_212));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_216)) 
    rom_0_35_216 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[216]), .o_ld_data(acts_0_35_216));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_218)) 
    rom_0_35_218 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[218]), .o_ld_data(acts_0_35_218));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_235)) 
    rom_0_35_235 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[235]), .o_ld_data(acts_0_35_235));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_241)) 
    rom_0_35_241 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[241]), .o_ld_data(acts_0_35_241));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_245)) 
    rom_0_35_245 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[245]), .o_ld_data(acts_0_35_245));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_246)) 
    rom_0_35_246 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[246]), .o_ld_data(acts_0_35_246));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_268)) 
    rom_0_35_268 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[268]), .o_ld_data(acts_0_35_268));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_271)) 
    rom_0_35_271 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[271]), .o_ld_data(acts_0_35_271));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_273)) 
    rom_0_35_273 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[273]), .o_ld_data(acts_0_35_273));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_296)) 
    rom_0_35_296 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[296]), .o_ld_data(acts_0_35_296));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_301)) 
    rom_0_35_301 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[301]), .o_ld_data(acts_0_35_301));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_302)) 
    rom_0_35_302 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[302]), .o_ld_data(acts_0_35_302));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_322)) 
    rom_0_35_322 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[322]), .o_ld_data(acts_0_35_322));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_331)) 
    rom_0_35_331 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[331]), .o_ld_data(acts_0_35_331));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_350)) 
    rom_0_35_350 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[350]), .o_ld_data(acts_0_35_350));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_35_384)) 
    rom_0_35_384 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[384]), .o_ld_data(acts_0_35_384));

  // Stage 1
    assign s_0_35_1_0 = {{2{acts_0_35_128[5]}}, acts_0_35_128} + {{2{acts_0_35_131[5]}}, acts_0_35_131} + {{2{acts_0_35_132[5]}}, acts_0_35_132} + {{2{acts_0_35_158[5]}}, acts_0_35_158};
    registers #(.ARRAY_WIDTH(8)) r_0_35_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_1_0), .q(s_0_35_1_0_reg));

    assign s_0_35_1_1 = {{2{acts_0_35_160[5]}}, acts_0_35_160} + {{2{acts_0_35_189[5]}}, acts_0_35_189} + {{2{acts_0_35_212[5]}}, acts_0_35_212} + {{2{acts_0_35_216[5]}}, acts_0_35_216};
    registers #(.ARRAY_WIDTH(8)) r_0_35_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_1_1), .q(s_0_35_1_1_reg));

    assign s_0_35_1_2 = {{2{acts_0_35_218[5]}}, acts_0_35_218} + {{2{acts_0_35_235[5]}}, acts_0_35_235} + {{2{acts_0_35_241[5]}}, acts_0_35_241} + {{2{acts_0_35_245[5]}}, acts_0_35_245};
    registers #(.ARRAY_WIDTH(8)) r_0_35_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_1_2), .q(s_0_35_1_2_reg));

    assign s_0_35_1_3 = {{2{acts_0_35_246[5]}}, acts_0_35_246} + {{2{acts_0_35_268[5]}}, acts_0_35_268} + {{2{acts_0_35_271[5]}}, acts_0_35_271} + {{2{acts_0_35_273[5]}}, acts_0_35_273};
    registers #(.ARRAY_WIDTH(8)) r_0_35_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_1_3), .q(s_0_35_1_3_reg));

    assign s_0_35_1_4 = {{2{acts_0_35_296[5]}}, acts_0_35_296} + {{2{acts_0_35_301[5]}}, acts_0_35_301} + {{2{acts_0_35_302[5]}}, acts_0_35_302} + {{2{acts_0_35_322[5]}}, acts_0_35_322};
    registers #(.ARRAY_WIDTH(8)) r_0_35_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_1_4), .q(s_0_35_1_4_reg));

    assign s_0_35_1_5 = {{2{acts_0_35_331[5]}}, acts_0_35_331} + {{2{acts_0_35_350[5]}}, acts_0_35_350} + {{2{acts_0_35_384[5]}}, acts_0_35_384};
    registers #(.ARRAY_WIDTH(8)) r_0_35_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_1_5), .q(s_0_35_1_5_reg));

  // Stage 2
    assign s_0_35_2_0 = {{2{s_0_35_1_0_reg[7]}}, s_0_35_1_0_reg} + {{2{s_0_35_1_1_reg[7]}}, s_0_35_1_1_reg} + {{2{s_0_35_1_2_reg[7]}}, s_0_35_1_2_reg} + {{2{s_0_35_1_3_reg[7]}}, s_0_35_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_35_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_2_0), .q(s_0_35_2_0_reg));

    assign s_0_35_2_1 = {{2{s_0_35_1_4_reg[7]}}, s_0_35_1_4_reg} + {{2{s_0_35_1_5_reg[7]}}, s_0_35_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_35_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_2_1), .q(s_0_35_2_1_reg));

  // Stage 3
    assign s_0_35_3_0 = {{2{s_0_35_2_0_reg[9]}}, s_0_35_2_0_reg} + {{2{s_0_35_2_1_reg[9]}}, s_0_35_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_35_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_3_0), .q(s_0_35_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_35_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_35_3_0_reg[11]}}, s_0_35_3_0_reg}), .q(sum_0_35_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_35 (.i_data(sum_0_35_reg), .o_data(out_0_35_sat));


    // Layer 0, Node 36
      logic  [7:0] s_0_36_1_0;
    logic  [7:0] s_0_36_1_0_reg;
    logic [11:0] s_0_36_3_pipe;
    logic [13:0] sum_0_36;
    logic [13:0] sum_0_36_reg;
    logic [9:0] s_0_36_2_pipe;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_36_276)) 
    rom_0_36_276 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[276]), .o_ld_data(acts_0_36_276));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_36_312)) 
    rom_0_36_312 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[312]), .o_ld_data(acts_0_36_312));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_36_450)) 
    rom_0_36_450 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[450]), .o_ld_data(acts_0_36_450));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_36_671)) 
    rom_0_36_671 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[671]), .o_ld_data(acts_0_36_671));

  // Stage 1
    assign s_0_36_1_0 = {{2{acts_0_36_276[5]}}, acts_0_36_276} + {{2{acts_0_36_312[5]}}, acts_0_36_312} + {{2{acts_0_36_450[5]}}, acts_0_36_450} + {{2{acts_0_36_671[5]}}, acts_0_36_671};
    registers #(.ARRAY_WIDTH(8)) r_0_36_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_36_1_0), .q(s_0_36_1_0_reg));

  // Stage 2
    registers #(.ARRAY_WIDTH(10)) reg_0_36_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_36_1_0_reg[7]}}, s_0_36_1_0_reg}), .q(s_0_36_2_pipe));

  // Stage 3
    registers #(.ARRAY_WIDTH(12)) reg_0_36_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_36_2_pipe[9]}},s_0_36_2_pipe}), .q(s_0_36_3_pipe));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_36_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_36_3_pipe[11]}},s_0_36_3_pipe}), .q(sum_0_36_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_36 (.i_data(sum_0_36_reg), .o_data(out_0_36_sat));


    // Layer 0, Node 37
      logic  [11:0] s_0_37_3_0, s_0_37_3_1;
    logic  [11:0] s_0_37_3_0_reg, s_0_37_3_1_reg;
    logic  [7:0] s_0_37_1_0, s_0_37_1_1, s_0_37_1_2, s_0_37_1_3, s_0_37_1_4, s_0_37_1_5, s_0_37_1_6, s_0_37_1_7, s_0_37_1_8, s_0_37_1_9, s_0_37_1_10, s_0_37_1_11, s_0_37_1_12, s_0_37_1_13, s_0_37_1_14, s_0_37_1_15;
    logic  [7:0] s_0_37_1_16, s_0_37_1_17, s_0_37_1_18;
    logic  [7:0] s_0_37_1_0_reg, s_0_37_1_1_reg, s_0_37_1_2_reg, s_0_37_1_3_reg, s_0_37_1_4_reg, s_0_37_1_5_reg, s_0_37_1_6_reg, s_0_37_1_7_reg, s_0_37_1_8_reg, s_0_37_1_9_reg, s_0_37_1_10_reg, s_0_37_1_11_reg, s_0_37_1_12_reg, s_0_37_1_13_reg, s_0_37_1_14_reg, s_0_37_1_15_reg;
    logic  [7:0] s_0_37_1_16_reg, s_0_37_1_17_reg, s_0_37_1_18_reg;
    logic  [9:0] s_0_37_2_0, s_0_37_2_1, s_0_37_2_2, s_0_37_2_3, s_0_37_2_4;
    logic  [9:0] s_0_37_2_0_reg, s_0_37_2_1_reg, s_0_37_2_2_reg, s_0_37_2_3_reg, s_0_37_2_4_reg;
    logic [13:0] sum_0_37;
    logic [13:0] sum_0_37_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_2)) 
    rom_0_37_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_37_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_7)) 
    rom_0_37_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_37_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_15)) 
    rom_0_37_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_37_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_16)) 
    rom_0_37_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_37_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_17)) 
    rom_0_37_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_37_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_20)) 
    rom_0_37_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_37_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_25)) 
    rom_0_37_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_37_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_29)) 
    rom_0_37_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_37_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_31)) 
    rom_0_37_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_37_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_46)) 
    rom_0_37_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[46]), .o_ld_data(acts_0_37_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_55)) 
    rom_0_37_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[55]), .o_ld_data(acts_0_37_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_56)) 
    rom_0_37_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[56]), .o_ld_data(acts_0_37_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_59)) 
    rom_0_37_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[59]), .o_ld_data(acts_0_37_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_68)) 
    rom_0_37_68 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[68]), .o_ld_data(acts_0_37_68));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_77)) 
    rom_0_37_77 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[77]), .o_ld_data(acts_0_37_77));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_84)) 
    rom_0_37_84 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[84]), .o_ld_data(acts_0_37_84));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_85)) 
    rom_0_37_85 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[85]), .o_ld_data(acts_0_37_85));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_86)) 
    rom_0_37_86 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[86]), .o_ld_data(acts_0_37_86));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_87)) 
    rom_0_37_87 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[87]), .o_ld_data(acts_0_37_87));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_92)) 
    rom_0_37_92 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[92]), .o_ld_data(acts_0_37_92));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_116)) 
    rom_0_37_116 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[116]), .o_ld_data(acts_0_37_116));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_167)) 
    rom_0_37_167 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[167]), .o_ld_data(acts_0_37_167));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_193)) 
    rom_0_37_193 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[193]), .o_ld_data(acts_0_37_193));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_199)) 
    rom_0_37_199 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[199]), .o_ld_data(acts_0_37_199));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_211)) 
    rom_0_37_211 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[211]), .o_ld_data(acts_0_37_211));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_212)) 
    rom_0_37_212 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[212]), .o_ld_data(acts_0_37_212));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_222)) 
    rom_0_37_222 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[222]), .o_ld_data(acts_0_37_222));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_250)) 
    rom_0_37_250 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[250]), .o_ld_data(acts_0_37_250));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_251)) 
    rom_0_37_251 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[251]), .o_ld_data(acts_0_37_251));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_254)) 
    rom_0_37_254 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[254]), .o_ld_data(acts_0_37_254));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_278)) 
    rom_0_37_278 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[278]), .o_ld_data(acts_0_37_278));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_283)) 
    rom_0_37_283 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[283]), .o_ld_data(acts_0_37_283));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_309)) 
    rom_0_37_309 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[309]), .o_ld_data(acts_0_37_309));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_337)) 
    rom_0_37_337 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[337]), .o_ld_data(acts_0_37_337));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_361)) 
    rom_0_37_361 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[361]), .o_ld_data(acts_0_37_361));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_367)) 
    rom_0_37_367 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[367]), .o_ld_data(acts_0_37_367));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_388)) 
    rom_0_37_388 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[388]), .o_ld_data(acts_0_37_388));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_390)) 
    rom_0_37_390 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[390]), .o_ld_data(acts_0_37_390));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_428)) 
    rom_0_37_428 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[428]), .o_ld_data(acts_0_37_428));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_445)) 
    rom_0_37_445 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[445]), .o_ld_data(acts_0_37_445));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_447)) 
    rom_0_37_447 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[447]), .o_ld_data(acts_0_37_447));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_474)) 
    rom_0_37_474 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[474]), .o_ld_data(acts_0_37_474));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_475)) 
    rom_0_37_475 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[475]), .o_ld_data(acts_0_37_475));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_503)) 
    rom_0_37_503 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[503]), .o_ld_data(acts_0_37_503));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_506)) 
    rom_0_37_506 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[506]), .o_ld_data(acts_0_37_506));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_530)) 
    rom_0_37_530 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[530]), .o_ld_data(acts_0_37_530));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_533)) 
    rom_0_37_533 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[533]), .o_ld_data(acts_0_37_533));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_585)) 
    rom_0_37_585 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[585]), .o_ld_data(acts_0_37_585));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_592)) 
    rom_0_37_592 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[592]), .o_ld_data(acts_0_37_592));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_648)) 
    rom_0_37_648 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[648]), .o_ld_data(acts_0_37_648));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_662)) 
    rom_0_37_662 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[662]), .o_ld_data(acts_0_37_662));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_670)) 
    rom_0_37_670 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[670]), .o_ld_data(acts_0_37_670));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_671)) 
    rom_0_37_671 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[671]), .o_ld_data(acts_0_37_671));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_672)) 
    rom_0_37_672 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[672]), .o_ld_data(acts_0_37_672));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_676)) 
    rom_0_37_676 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[676]), .o_ld_data(acts_0_37_676));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_689)) 
    rom_0_37_689 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[689]), .o_ld_data(acts_0_37_689));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_696)) 
    rom_0_37_696 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[696]), .o_ld_data(acts_0_37_696));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_699)) 
    rom_0_37_699 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[699]), .o_ld_data(acts_0_37_699));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_706)) 
    rom_0_37_706 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[706]), .o_ld_data(acts_0_37_706));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_711)) 
    rom_0_37_711 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[711]), .o_ld_data(acts_0_37_711));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_719)) 
    rom_0_37_719 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[719]), .o_ld_data(acts_0_37_719));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_725)) 
    rom_0_37_725 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[725]), .o_ld_data(acts_0_37_725));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_729)) 
    rom_0_37_729 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[729]), .o_ld_data(acts_0_37_729));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_730)) 
    rom_0_37_730 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[730]), .o_ld_data(acts_0_37_730));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_738)) 
    rom_0_37_738 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[738]), .o_ld_data(acts_0_37_738));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_746)) 
    rom_0_37_746 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[746]), .o_ld_data(acts_0_37_746));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_753)) 
    rom_0_37_753 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[753]), .o_ld_data(acts_0_37_753));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_757)) 
    rom_0_37_757 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[757]), .o_ld_data(acts_0_37_757));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_759)) 
    rom_0_37_759 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[759]), .o_ld_data(acts_0_37_759));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_760)) 
    rom_0_37_760 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[760]), .o_ld_data(acts_0_37_760));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_762)) 
    rom_0_37_762 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[762]), .o_ld_data(acts_0_37_762));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_781)) 
    rom_0_37_781 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[781]), .o_ld_data(acts_0_37_781));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_37_783)) 
    rom_0_37_783 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[783]), .o_ld_data(acts_0_37_783));

  // Stage 1
    assign s_0_37_1_0 = {{2{acts_0_37_2[5]}}, acts_0_37_2} + {{2{acts_0_37_7[5]}}, acts_0_37_7} + {{2{acts_0_37_15[5]}}, acts_0_37_15} + {{2{acts_0_37_16[5]}}, acts_0_37_16};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_0), .q(s_0_37_1_0_reg));

    assign s_0_37_1_1 = {{2{acts_0_37_17[5]}}, acts_0_37_17} + {{2{acts_0_37_20[5]}}, acts_0_37_20} + {{2{acts_0_37_25[5]}}, acts_0_37_25} + {{2{acts_0_37_29[5]}}, acts_0_37_29};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_1), .q(s_0_37_1_1_reg));

    assign s_0_37_1_2 = {{2{acts_0_37_31[5]}}, acts_0_37_31} + {{2{acts_0_37_46[5]}}, acts_0_37_46} + {{2{acts_0_37_55[5]}}, acts_0_37_55} + {{2{acts_0_37_56[5]}}, acts_0_37_56};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_2), .q(s_0_37_1_2_reg));

    assign s_0_37_1_3 = {{2{acts_0_37_59[5]}}, acts_0_37_59} + {{2{acts_0_37_68[5]}}, acts_0_37_68} + {{2{acts_0_37_77[5]}}, acts_0_37_77} + {{2{acts_0_37_84[5]}}, acts_0_37_84};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_3), .q(s_0_37_1_3_reg));

    assign s_0_37_1_4 = {{2{acts_0_37_85[5]}}, acts_0_37_85} + {{2{acts_0_37_86[5]}}, acts_0_37_86} + {{2{acts_0_37_87[5]}}, acts_0_37_87} + {{2{acts_0_37_92[5]}}, acts_0_37_92};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_4), .q(s_0_37_1_4_reg));

    assign s_0_37_1_5 = {{2{acts_0_37_116[5]}}, acts_0_37_116} + {{2{acts_0_37_167[5]}}, acts_0_37_167} + {{2{acts_0_37_193[5]}}, acts_0_37_193} + {{2{acts_0_37_199[5]}}, acts_0_37_199};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_5), .q(s_0_37_1_5_reg));

    assign s_0_37_1_6 = {{2{acts_0_37_211[5]}}, acts_0_37_211} + {{2{acts_0_37_212[5]}}, acts_0_37_212} + {{2{acts_0_37_222[5]}}, acts_0_37_222} + {{2{acts_0_37_250[5]}}, acts_0_37_250};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_6), .q(s_0_37_1_6_reg));

    assign s_0_37_1_7 = {{2{acts_0_37_251[5]}}, acts_0_37_251} + {{2{acts_0_37_254[5]}}, acts_0_37_254} + {{2{acts_0_37_278[5]}}, acts_0_37_278} + {{2{acts_0_37_283[5]}}, acts_0_37_283};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_7), .q(s_0_37_1_7_reg));

    assign s_0_37_1_8 = {{2{acts_0_37_309[5]}}, acts_0_37_309} + {{2{acts_0_37_337[5]}}, acts_0_37_337} + {{2{acts_0_37_361[5]}}, acts_0_37_361} + {{2{acts_0_37_367[5]}}, acts_0_37_367};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_8), .q(s_0_37_1_8_reg));

    assign s_0_37_1_9 = {{2{acts_0_37_388[5]}}, acts_0_37_388} + {{2{acts_0_37_390[5]}}, acts_0_37_390} + {{2{acts_0_37_428[5]}}, acts_0_37_428} + {{2{acts_0_37_445[5]}}, acts_0_37_445};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_9), .q(s_0_37_1_9_reg));

    assign s_0_37_1_10 = {{2{acts_0_37_447[5]}}, acts_0_37_447} + {{2{acts_0_37_474[5]}}, acts_0_37_474} + {{2{acts_0_37_475[5]}}, acts_0_37_475} + {{2{acts_0_37_503[5]}}, acts_0_37_503};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_10), .q(s_0_37_1_10_reg));

    assign s_0_37_1_11 = {{2{acts_0_37_506[5]}}, acts_0_37_506} + {{2{acts_0_37_530[5]}}, acts_0_37_530} + {{2{acts_0_37_533[5]}}, acts_0_37_533} + {{2{acts_0_37_585[5]}}, acts_0_37_585};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_11), .q(s_0_37_1_11_reg));

    assign s_0_37_1_12 = {{2{acts_0_37_592[5]}}, acts_0_37_592} + {{2{acts_0_37_648[5]}}, acts_0_37_648} + {{2{acts_0_37_662[5]}}, acts_0_37_662} + {{2{acts_0_37_670[5]}}, acts_0_37_670};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_12), .q(s_0_37_1_12_reg));

    assign s_0_37_1_13 = {{2{acts_0_37_671[5]}}, acts_0_37_671} + {{2{acts_0_37_672[5]}}, acts_0_37_672} + {{2{acts_0_37_676[5]}}, acts_0_37_676} + {{2{acts_0_37_689[5]}}, acts_0_37_689};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_13), .q(s_0_37_1_13_reg));

    assign s_0_37_1_14 = {{2{acts_0_37_696[5]}}, acts_0_37_696} + {{2{acts_0_37_699[5]}}, acts_0_37_699} + {{2{acts_0_37_706[5]}}, acts_0_37_706} + {{2{acts_0_37_711[5]}}, acts_0_37_711};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_14), .q(s_0_37_1_14_reg));

    assign s_0_37_1_15 = {{2{acts_0_37_719[5]}}, acts_0_37_719} + {{2{acts_0_37_725[5]}}, acts_0_37_725} + {{2{acts_0_37_729[5]}}, acts_0_37_729} + {{2{acts_0_37_730[5]}}, acts_0_37_730};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_15), .q(s_0_37_1_15_reg));

    assign s_0_37_1_16 = {{2{acts_0_37_738[5]}}, acts_0_37_738} + {{2{acts_0_37_746[5]}}, acts_0_37_746} + {{2{acts_0_37_753[5]}}, acts_0_37_753} + {{2{acts_0_37_757[5]}}, acts_0_37_757};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_16), .q(s_0_37_1_16_reg));

    assign s_0_37_1_17 = {{2{acts_0_37_759[5]}}, acts_0_37_759} + {{2{acts_0_37_760[5]}}, acts_0_37_760} + {{2{acts_0_37_762[5]}}, acts_0_37_762} + {{2{acts_0_37_781[5]}}, acts_0_37_781};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_17), .q(s_0_37_1_17_reg));

    assign s_0_37_1_18 = {{2{acts_0_37_783[5]}}, acts_0_37_783};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_18), .q(s_0_37_1_18_reg));

  // Stage 2
    assign s_0_37_2_0 = {{2{s_0_37_1_0_reg[7]}}, s_0_37_1_0_reg} + {{2{s_0_37_1_1_reg[7]}}, s_0_37_1_1_reg} + {{2{s_0_37_1_2_reg[7]}}, s_0_37_1_2_reg} + {{2{s_0_37_1_3_reg[7]}}, s_0_37_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_37_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_2_0), .q(s_0_37_2_0_reg));

    assign s_0_37_2_1 = {{2{s_0_37_1_4_reg[7]}}, s_0_37_1_4_reg} + {{2{s_0_37_1_5_reg[7]}}, s_0_37_1_5_reg} + {{2{s_0_37_1_6_reg[7]}}, s_0_37_1_6_reg} + {{2{s_0_37_1_7_reg[7]}}, s_0_37_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_37_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_2_1), .q(s_0_37_2_1_reg));

    assign s_0_37_2_2 = {{2{s_0_37_1_8_reg[7]}}, s_0_37_1_8_reg} + {{2{s_0_37_1_9_reg[7]}}, s_0_37_1_9_reg} + {{2{s_0_37_1_10_reg[7]}}, s_0_37_1_10_reg} + {{2{s_0_37_1_11_reg[7]}}, s_0_37_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_37_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_2_2), .q(s_0_37_2_2_reg));

    assign s_0_37_2_3 = {{2{s_0_37_1_12_reg[7]}}, s_0_37_1_12_reg} + {{2{s_0_37_1_13_reg[7]}}, s_0_37_1_13_reg} + {{2{s_0_37_1_14_reg[7]}}, s_0_37_1_14_reg} + {{2{s_0_37_1_15_reg[7]}}, s_0_37_1_15_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_37_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_2_3), .q(s_0_37_2_3_reg));

    assign s_0_37_2_4 = {{2{s_0_37_1_16_reg[7]}}, s_0_37_1_16_reg} + {{2{s_0_37_1_17_reg[7]}}, s_0_37_1_17_reg} + {{2{s_0_37_1_18_reg[7]}}, s_0_37_1_18_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_37_2_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_2_4), .q(s_0_37_2_4_reg));

  // Stage 3
    assign s_0_37_3_0 = {{2{s_0_37_2_0_reg[9]}}, s_0_37_2_0_reg} + {{2{s_0_37_2_1_reg[9]}}, s_0_37_2_1_reg} + {{2{s_0_37_2_2_reg[9]}}, s_0_37_2_2_reg} + {{2{s_0_37_2_3_reg[9]}}, s_0_37_2_3_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_37_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_3_0), .q(s_0_37_3_0_reg));

    assign s_0_37_3_1 = {{2{s_0_37_2_4_reg[9]}}, s_0_37_2_4_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_37_3_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_3_1), .q(s_0_37_3_1_reg));

  // Stage 4
    assign sum_0_37 = {{2{s_0_37_3_0_reg[11]}}, s_0_37_3_0_reg} + {{2{s_0_37_3_1_reg[11]}}, s_0_37_3_1_reg};
    registers #(.ARRAY_WIDTH(14)) r_0_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_37), .q(sum_0_37_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_37 (.i_data(sum_0_37_reg), .o_data(out_0_37_sat));


    // Layer 0, Node 38
      logic  [11:0] s_0_38_3_0;
    logic  [11:0] s_0_38_3_0_reg;
    logic  [7:0] s_0_38_1_0, s_0_38_1_1, s_0_38_1_2, s_0_38_1_3, s_0_38_1_4, s_0_38_1_5, s_0_38_1_6, s_0_38_1_7;
    logic  [7:0] s_0_38_1_0_reg, s_0_38_1_1_reg, s_0_38_1_2_reg, s_0_38_1_3_reg, s_0_38_1_4_reg, s_0_38_1_5_reg, s_0_38_1_6_reg, s_0_38_1_7_reg;
    logic  [9:0] s_0_38_2_0, s_0_38_2_1;
    logic  [9:0] s_0_38_2_0_reg, s_0_38_2_1_reg;
    logic [13:0] sum_0_38;
    logic [13:0] sum_0_38_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_236)) 
    rom_0_38_236 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[236]), .o_ld_data(acts_0_38_236));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_247)) 
    rom_0_38_247 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[247]), .o_ld_data(acts_0_38_247));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_260)) 
    rom_0_38_260 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[260]), .o_ld_data(acts_0_38_260));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_262)) 
    rom_0_38_262 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[262]), .o_ld_data(acts_0_38_262));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_263)) 
    rom_0_38_263 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[263]), .o_ld_data(acts_0_38_263));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_265)) 
    rom_0_38_265 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[265]), .o_ld_data(acts_0_38_265));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_266)) 
    rom_0_38_266 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[266]), .o_ld_data(acts_0_38_266));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_282)) 
    rom_0_38_282 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[282]), .o_ld_data(acts_0_38_282));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_286)) 
    rom_0_38_286 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[286]), .o_ld_data(acts_0_38_286));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_287)) 
    rom_0_38_287 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[287]), .o_ld_data(acts_0_38_287));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_288)) 
    rom_0_38_288 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[288]), .o_ld_data(acts_0_38_288));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_289)) 
    rom_0_38_289 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[289]), .o_ld_data(acts_0_38_289));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_290)) 
    rom_0_38_290 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[290]), .o_ld_data(acts_0_38_290));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_291)) 
    rom_0_38_291 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[291]), .o_ld_data(acts_0_38_291));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_292)) 
    rom_0_38_292 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[292]), .o_ld_data(acts_0_38_292));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_293)) 
    rom_0_38_293 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[293]), .o_ld_data(acts_0_38_293));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_348)) 
    rom_0_38_348 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[348]), .o_ld_data(acts_0_38_348));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_349)) 
    rom_0_38_349 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[349]), .o_ld_data(acts_0_38_349));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_377)) 
    rom_0_38_377 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[377]), .o_ld_data(acts_0_38_377));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_396)) 
    rom_0_38_396 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[396]), .o_ld_data(acts_0_38_396));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_400)) 
    rom_0_38_400 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[400]), .o_ld_data(acts_0_38_400));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_404)) 
    rom_0_38_404 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[404]), .o_ld_data(acts_0_38_404));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_408)) 
    rom_0_38_408 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[408]), .o_ld_data(acts_0_38_408));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_426)) 
    rom_0_38_426 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[426]), .o_ld_data(acts_0_38_426));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_439)) 
    rom_0_38_439 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[439]), .o_ld_data(acts_0_38_439));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_454)) 
    rom_0_38_454 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[454]), .o_ld_data(acts_0_38_454));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_468)) 
    rom_0_38_468 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[468]), .o_ld_data(acts_0_38_468));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_576)) 
    rom_0_38_576 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[576]), .o_ld_data(acts_0_38_576));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_578)) 
    rom_0_38_578 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[578]), .o_ld_data(acts_0_38_578));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_38_623)) 
    rom_0_38_623 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[623]), .o_ld_data(acts_0_38_623));

  // Stage 1
    assign s_0_38_1_0 = {{2{acts_0_38_236[5]}}, acts_0_38_236} + {{2{acts_0_38_247[5]}}, acts_0_38_247} + {{2{acts_0_38_260[5]}}, acts_0_38_260} + {{2{acts_0_38_262[5]}}, acts_0_38_262};
    registers #(.ARRAY_WIDTH(8)) r_0_38_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_1_0), .q(s_0_38_1_0_reg));

    assign s_0_38_1_1 = {{2{acts_0_38_263[5]}}, acts_0_38_263} + {{2{acts_0_38_265[5]}}, acts_0_38_265} + {{2{acts_0_38_266[5]}}, acts_0_38_266} + {{2{acts_0_38_282[5]}}, acts_0_38_282};
    registers #(.ARRAY_WIDTH(8)) r_0_38_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_1_1), .q(s_0_38_1_1_reg));

    assign s_0_38_1_2 = {{2{acts_0_38_286[5]}}, acts_0_38_286} + {{2{acts_0_38_287[5]}}, acts_0_38_287} + {{2{acts_0_38_288[5]}}, acts_0_38_288} + {{2{acts_0_38_289[5]}}, acts_0_38_289};
    registers #(.ARRAY_WIDTH(8)) r_0_38_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_1_2), .q(s_0_38_1_2_reg));

    assign s_0_38_1_3 = {{2{acts_0_38_290[5]}}, acts_0_38_290} + {{2{acts_0_38_291[5]}}, acts_0_38_291} + {{2{acts_0_38_292[5]}}, acts_0_38_292} + {{2{acts_0_38_293[5]}}, acts_0_38_293};
    registers #(.ARRAY_WIDTH(8)) r_0_38_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_1_3), .q(s_0_38_1_3_reg));

    assign s_0_38_1_4 = {{2{acts_0_38_348[5]}}, acts_0_38_348} + {{2{acts_0_38_349[5]}}, acts_0_38_349} + {{2{acts_0_38_377[5]}}, acts_0_38_377} + {{2{acts_0_38_396[5]}}, acts_0_38_396};
    registers #(.ARRAY_WIDTH(8)) r_0_38_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_1_4), .q(s_0_38_1_4_reg));

    assign s_0_38_1_5 = {{2{acts_0_38_400[5]}}, acts_0_38_400} + {{2{acts_0_38_404[5]}}, acts_0_38_404} + {{2{acts_0_38_408[5]}}, acts_0_38_408} + {{2{acts_0_38_426[5]}}, acts_0_38_426};
    registers #(.ARRAY_WIDTH(8)) r_0_38_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_1_5), .q(s_0_38_1_5_reg));

    assign s_0_38_1_6 = {{2{acts_0_38_439[5]}}, acts_0_38_439} + {{2{acts_0_38_454[5]}}, acts_0_38_454} + {{2{acts_0_38_468[5]}}, acts_0_38_468} + {{2{acts_0_38_576[5]}}, acts_0_38_576};
    registers #(.ARRAY_WIDTH(8)) r_0_38_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_1_6), .q(s_0_38_1_6_reg));

    assign s_0_38_1_7 = {{2{acts_0_38_578[5]}}, acts_0_38_578} + {{2{acts_0_38_623[5]}}, acts_0_38_623};
    registers #(.ARRAY_WIDTH(8)) r_0_38_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_1_7), .q(s_0_38_1_7_reg));

  // Stage 2
    assign s_0_38_2_0 = {{2{s_0_38_1_0_reg[7]}}, s_0_38_1_0_reg} + {{2{s_0_38_1_1_reg[7]}}, s_0_38_1_1_reg} + {{2{s_0_38_1_2_reg[7]}}, s_0_38_1_2_reg} + {{2{s_0_38_1_3_reg[7]}}, s_0_38_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_38_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_2_0), .q(s_0_38_2_0_reg));

    assign s_0_38_2_1 = {{2{s_0_38_1_4_reg[7]}}, s_0_38_1_4_reg} + {{2{s_0_38_1_5_reg[7]}}, s_0_38_1_5_reg} + {{2{s_0_38_1_6_reg[7]}}, s_0_38_1_6_reg} + {{2{s_0_38_1_7_reg[7]}}, s_0_38_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_38_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_2_1), .q(s_0_38_2_1_reg));

  // Stage 3
    assign s_0_38_3_0 = {{2{s_0_38_2_0_reg[9]}}, s_0_38_2_0_reg} + {{2{s_0_38_2_1_reg[9]}}, s_0_38_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_38_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_3_0), .q(s_0_38_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_38_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_38_3_0_reg[11]}}, s_0_38_3_0_reg}), .q(sum_0_38_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_38 (.i_data(sum_0_38_reg), .o_data(out_0_38_sat));


    // Layer 0, Node 39
      logic  [11:0] s_0_39_3_0;
    logic  [11:0] s_0_39_3_0_reg;
    logic  [7:0] s_0_39_1_0, s_0_39_1_1, s_0_39_1_2, s_0_39_1_3, s_0_39_1_4, s_0_39_1_5;
    logic  [7:0] s_0_39_1_0_reg, s_0_39_1_1_reg, s_0_39_1_2_reg, s_0_39_1_3_reg, s_0_39_1_4_reg, s_0_39_1_5_reg;
    logic  [9:0] s_0_39_2_0, s_0_39_2_1;
    logic  [9:0] s_0_39_2_0_reg, s_0_39_2_1_reg;
    logic [13:0] sum_0_39;
    logic [13:0] sum_0_39_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_27)) 
    rom_0_39_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_39_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_92)) 
    rom_0_39_92 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[92]), .o_ld_data(acts_0_39_92));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_94)) 
    rom_0_39_94 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[94]), .o_ld_data(acts_0_39_94));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_139)) 
    rom_0_39_139 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[139]), .o_ld_data(acts_0_39_139));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_296)) 
    rom_0_39_296 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[296]), .o_ld_data(acts_0_39_296));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_313)) 
    rom_0_39_313 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[313]), .o_ld_data(acts_0_39_313));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_318)) 
    rom_0_39_318 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[318]), .o_ld_data(acts_0_39_318));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_364)) 
    rom_0_39_364 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[364]), .o_ld_data(acts_0_39_364));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_367)) 
    rom_0_39_367 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[367]), .o_ld_data(acts_0_39_367));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_394)) 
    rom_0_39_394 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[394]), .o_ld_data(acts_0_39_394));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_434)) 
    rom_0_39_434 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[434]), .o_ld_data(acts_0_39_434));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_435)) 
    rom_0_39_435 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[435]), .o_ld_data(acts_0_39_435));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_457)) 
    rom_0_39_457 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[457]), .o_ld_data(acts_0_39_457));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_564)) 
    rom_0_39_564 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[564]), .o_ld_data(acts_0_39_564));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_661)) 
    rom_0_39_661 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[661]), .o_ld_data(acts_0_39_661));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_671)) 
    rom_0_39_671 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[671]), .o_ld_data(acts_0_39_671));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_672)) 
    rom_0_39_672 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[672]), .o_ld_data(acts_0_39_672));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_690)) 
    rom_0_39_690 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[690]), .o_ld_data(acts_0_39_690));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_692)) 
    rom_0_39_692 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[692]), .o_ld_data(acts_0_39_692));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_724)) 
    rom_0_39_724 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[724]), .o_ld_data(acts_0_39_724));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_39_751)) 
    rom_0_39_751 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[751]), .o_ld_data(acts_0_39_751));

  // Stage 1
    assign s_0_39_1_0 = {{2{acts_0_39_27[5]}}, acts_0_39_27} + {{2{acts_0_39_92[5]}}, acts_0_39_92} + {{2{acts_0_39_94[5]}}, acts_0_39_94} + {{2{acts_0_39_139[5]}}, acts_0_39_139};
    registers #(.ARRAY_WIDTH(8)) r_0_39_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_1_0), .q(s_0_39_1_0_reg));

    assign s_0_39_1_1 = {{2{acts_0_39_296[5]}}, acts_0_39_296} + {{2{acts_0_39_313[5]}}, acts_0_39_313} + {{2{acts_0_39_318[5]}}, acts_0_39_318} + {{2{acts_0_39_364[5]}}, acts_0_39_364};
    registers #(.ARRAY_WIDTH(8)) r_0_39_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_1_1), .q(s_0_39_1_1_reg));

    assign s_0_39_1_2 = {{2{acts_0_39_367[5]}}, acts_0_39_367} + {{2{acts_0_39_394[5]}}, acts_0_39_394} + {{2{acts_0_39_434[5]}}, acts_0_39_434} + {{2{acts_0_39_435[5]}}, acts_0_39_435};
    registers #(.ARRAY_WIDTH(8)) r_0_39_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_1_2), .q(s_0_39_1_2_reg));

    assign s_0_39_1_3 = {{2{acts_0_39_457[5]}}, acts_0_39_457} + {{2{acts_0_39_564[5]}}, acts_0_39_564} + {{2{acts_0_39_661[5]}}, acts_0_39_661} + {{2{acts_0_39_671[5]}}, acts_0_39_671};
    registers #(.ARRAY_WIDTH(8)) r_0_39_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_1_3), .q(s_0_39_1_3_reg));

    assign s_0_39_1_4 = {{2{acts_0_39_672[5]}}, acts_0_39_672} + {{2{acts_0_39_690[5]}}, acts_0_39_690} + {{2{acts_0_39_692[5]}}, acts_0_39_692} + {{2{acts_0_39_724[5]}}, acts_0_39_724};
    registers #(.ARRAY_WIDTH(8)) r_0_39_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_1_4), .q(s_0_39_1_4_reg));

    assign s_0_39_1_5 = {{2{acts_0_39_751[5]}}, acts_0_39_751};
    registers #(.ARRAY_WIDTH(8)) r_0_39_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_1_5), .q(s_0_39_1_5_reg));

  // Stage 2
    assign s_0_39_2_0 = {{2{s_0_39_1_0_reg[7]}}, s_0_39_1_0_reg} + {{2{s_0_39_1_1_reg[7]}}, s_0_39_1_1_reg} + {{2{s_0_39_1_2_reg[7]}}, s_0_39_1_2_reg} + {{2{s_0_39_1_3_reg[7]}}, s_0_39_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_39_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_2_0), .q(s_0_39_2_0_reg));

    assign s_0_39_2_1 = {{2{s_0_39_1_4_reg[7]}}, s_0_39_1_4_reg} + {{2{s_0_39_1_5_reg[7]}}, s_0_39_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_39_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_2_1), .q(s_0_39_2_1_reg));

  // Stage 3
    assign s_0_39_3_0 = {{2{s_0_39_2_0_reg[9]}}, s_0_39_2_0_reg} + {{2{s_0_39_2_1_reg[9]}}, s_0_39_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_39_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_3_0), .q(s_0_39_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_39_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_39_3_0_reg[11]}}, s_0_39_3_0_reg}), .q(sum_0_39_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_39 (.i_data(sum_0_39_reg), .o_data(out_0_39_sat));


    // Layer 0, Node 40
      logic  [11:0] s_0_40_3_0;
    logic  [11:0] s_0_40_3_0_reg;
    logic  [7:0] s_0_40_1_0, s_0_40_1_1, s_0_40_1_2, s_0_40_1_3, s_0_40_1_4, s_0_40_1_5, s_0_40_1_6;
    logic  [7:0] s_0_40_1_0_reg, s_0_40_1_1_reg, s_0_40_1_2_reg, s_0_40_1_3_reg, s_0_40_1_4_reg, s_0_40_1_5_reg, s_0_40_1_6_reg;
    logic  [9:0] s_0_40_2_0, s_0_40_2_1;
    logic  [9:0] s_0_40_2_0_reg, s_0_40_2_1_reg;
    logic [13:0] sum_0_40;
    logic [13:0] sum_0_40_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_123)) 
    rom_0_40_123 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[123]), .o_ld_data(acts_0_40_123));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_151)) 
    rom_0_40_151 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[151]), .o_ld_data(acts_0_40_151));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_212)) 
    rom_0_40_212 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[212]), .o_ld_data(acts_0_40_212));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_269)) 
    rom_0_40_269 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[269]), .o_ld_data(acts_0_40_269));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_325)) 
    rom_0_40_325 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[325]), .o_ld_data(acts_0_40_325));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_346)) 
    rom_0_40_346 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[346]), .o_ld_data(acts_0_40_346));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_347)) 
    rom_0_40_347 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[347]), .o_ld_data(acts_0_40_347));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_348)) 
    rom_0_40_348 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[348]), .o_ld_data(acts_0_40_348));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_350)) 
    rom_0_40_350 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[350]), .o_ld_data(acts_0_40_350));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_376)) 
    rom_0_40_376 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[376]), .o_ld_data(acts_0_40_376));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_378)) 
    rom_0_40_378 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[378]), .o_ld_data(acts_0_40_378));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_379)) 
    rom_0_40_379 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[379]), .o_ld_data(acts_0_40_379));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_398)) 
    rom_0_40_398 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[398]), .o_ld_data(acts_0_40_398));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_425)) 
    rom_0_40_425 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[425]), .o_ld_data(acts_0_40_425));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_427)) 
    rom_0_40_427 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[427]), .o_ld_data(acts_0_40_427));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_428)) 
    rom_0_40_428 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[428]), .o_ld_data(acts_0_40_428));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_429)) 
    rom_0_40_429 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[429]), .o_ld_data(acts_0_40_429));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_430)) 
    rom_0_40_430 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[430]), .o_ld_data(acts_0_40_430));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_431)) 
    rom_0_40_431 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[431]), .o_ld_data(acts_0_40_431));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_455)) 
    rom_0_40_455 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[455]), .o_ld_data(acts_0_40_455));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_456)) 
    rom_0_40_456 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[456]), .o_ld_data(acts_0_40_456));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_457)) 
    rom_0_40_457 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[457]), .o_ld_data(acts_0_40_457));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_458)) 
    rom_0_40_458 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[458]), .o_ld_data(acts_0_40_458));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_459)) 
    rom_0_40_459 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[459]), .o_ld_data(acts_0_40_459));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_460)) 
    rom_0_40_460 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[460]), .o_ld_data(acts_0_40_460));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_488)) 
    rom_0_40_488 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[488]), .o_ld_data(acts_0_40_488));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_489)) 
    rom_0_40_489 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[489]), .o_ld_data(acts_0_40_489));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_40_597)) 
    rom_0_40_597 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[597]), .o_ld_data(acts_0_40_597));

  // Stage 1
    assign s_0_40_1_0 = {{2{acts_0_40_123[5]}}, acts_0_40_123} + {{2{acts_0_40_151[5]}}, acts_0_40_151} + {{2{acts_0_40_212[5]}}, acts_0_40_212} + {{2{acts_0_40_269[5]}}, acts_0_40_269};
    registers #(.ARRAY_WIDTH(8)) r_0_40_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_1_0), .q(s_0_40_1_0_reg));

    assign s_0_40_1_1 = {{2{acts_0_40_325[5]}}, acts_0_40_325} + {{2{acts_0_40_346[5]}}, acts_0_40_346} + {{2{acts_0_40_347[5]}}, acts_0_40_347} + {{2{acts_0_40_348[5]}}, acts_0_40_348};
    registers #(.ARRAY_WIDTH(8)) r_0_40_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_1_1), .q(s_0_40_1_1_reg));

    assign s_0_40_1_2 = {{2{acts_0_40_350[5]}}, acts_0_40_350} + {{2{acts_0_40_376[5]}}, acts_0_40_376} + {{2{acts_0_40_378[5]}}, acts_0_40_378} + {{2{acts_0_40_379[5]}}, acts_0_40_379};
    registers #(.ARRAY_WIDTH(8)) r_0_40_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_1_2), .q(s_0_40_1_2_reg));

    assign s_0_40_1_3 = {{2{acts_0_40_398[5]}}, acts_0_40_398} + {{2{acts_0_40_425[5]}}, acts_0_40_425} + {{2{acts_0_40_427[5]}}, acts_0_40_427} + {{2{acts_0_40_428[5]}}, acts_0_40_428};
    registers #(.ARRAY_WIDTH(8)) r_0_40_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_1_3), .q(s_0_40_1_3_reg));

    assign s_0_40_1_4 = {{2{acts_0_40_429[5]}}, acts_0_40_429} + {{2{acts_0_40_430[5]}}, acts_0_40_430} + {{2{acts_0_40_431[5]}}, acts_0_40_431} + {{2{acts_0_40_455[5]}}, acts_0_40_455};
    registers #(.ARRAY_WIDTH(8)) r_0_40_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_1_4), .q(s_0_40_1_4_reg));

    assign s_0_40_1_5 = {{2{acts_0_40_456[5]}}, acts_0_40_456} + {{2{acts_0_40_457[5]}}, acts_0_40_457} + {{2{acts_0_40_458[5]}}, acts_0_40_458} + {{2{acts_0_40_459[5]}}, acts_0_40_459};
    registers #(.ARRAY_WIDTH(8)) r_0_40_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_1_5), .q(s_0_40_1_5_reg));

    assign s_0_40_1_6 = {{2{acts_0_40_460[5]}}, acts_0_40_460} + {{2{acts_0_40_488[5]}}, acts_0_40_488} + {{2{acts_0_40_489[5]}}, acts_0_40_489} + {{2{acts_0_40_597[5]}}, acts_0_40_597};
    registers #(.ARRAY_WIDTH(8)) r_0_40_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_1_6), .q(s_0_40_1_6_reg));

  // Stage 2
    assign s_0_40_2_0 = {{2{s_0_40_1_0_reg[7]}}, s_0_40_1_0_reg} + {{2{s_0_40_1_1_reg[7]}}, s_0_40_1_1_reg} + {{2{s_0_40_1_2_reg[7]}}, s_0_40_1_2_reg} + {{2{s_0_40_1_3_reg[7]}}, s_0_40_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_40_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_2_0), .q(s_0_40_2_0_reg));

    assign s_0_40_2_1 = {{2{s_0_40_1_4_reg[7]}}, s_0_40_1_4_reg} + {{2{s_0_40_1_5_reg[7]}}, s_0_40_1_5_reg} + {{2{s_0_40_1_6_reg[7]}}, s_0_40_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_40_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_2_1), .q(s_0_40_2_1_reg));

  // Stage 3
    assign s_0_40_3_0 = {{2{s_0_40_2_0_reg[9]}}, s_0_40_2_0_reg} + {{2{s_0_40_2_1_reg[9]}}, s_0_40_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_40_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_3_0), .q(s_0_40_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_40_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_40_3_0_reg[11]}}, s_0_40_3_0_reg}), .q(sum_0_40_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_40 (.i_data(sum_0_40_reg), .o_data(out_0_40_sat));


    // Layer 0, Node 41
      logic  [11:0] s_0_41_3_0;
    logic  [11:0] s_0_41_3_0_reg;
    logic  [7:0] s_0_41_1_0, s_0_41_1_1, s_0_41_1_2, s_0_41_1_3, s_0_41_1_4, s_0_41_1_5;
    logic  [7:0] s_0_41_1_0_reg, s_0_41_1_1_reg, s_0_41_1_2_reg, s_0_41_1_3_reg, s_0_41_1_4_reg, s_0_41_1_5_reg;
    logic  [9:0] s_0_41_2_0, s_0_41_2_1;
    logic  [9:0] s_0_41_2_0_reg, s_0_41_2_1_reg;
    logic [13:0] sum_0_41;
    logic [13:0] sum_0_41_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_213)) 
    rom_0_41_213 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[213]), .o_ld_data(acts_0_41_213));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_267)) 
    rom_0_41_267 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[267]), .o_ld_data(acts_0_41_267));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_430)) 
    rom_0_41_430 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[430]), .o_ld_data(acts_0_41_430));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_431)) 
    rom_0_41_431 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[431]), .o_ld_data(acts_0_41_431));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_457)) 
    rom_0_41_457 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[457]), .o_ld_data(acts_0_41_457));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_458)) 
    rom_0_41_458 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[458]), .o_ld_data(acts_0_41_458));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_485)) 
    rom_0_41_485 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[485]), .o_ld_data(acts_0_41_485));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_486)) 
    rom_0_41_486 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[486]), .o_ld_data(acts_0_41_486));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_512)) 
    rom_0_41_512 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[512]), .o_ld_data(acts_0_41_512));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_513)) 
    rom_0_41_513 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[513]), .o_ld_data(acts_0_41_513));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_539)) 
    rom_0_41_539 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[539]), .o_ld_data(acts_0_41_539));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_540)) 
    rom_0_41_540 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[540]), .o_ld_data(acts_0_41_540));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_541)) 
    rom_0_41_541 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[541]), .o_ld_data(acts_0_41_541));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_542)) 
    rom_0_41_542 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[542]), .o_ld_data(acts_0_41_542));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_544)) 
    rom_0_41_544 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[544]), .o_ld_data(acts_0_41_544));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_569)) 
    rom_0_41_569 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[569]), .o_ld_data(acts_0_41_569));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_572)) 
    rom_0_41_572 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[572]), .o_ld_data(acts_0_41_572));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_573)) 
    rom_0_41_573 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[573]), .o_ld_data(acts_0_41_573));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_574)) 
    rom_0_41_574 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[574]), .o_ld_data(acts_0_41_574));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_597)) 
    rom_0_41_597 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[597]), .o_ld_data(acts_0_41_597));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_600)) 
    rom_0_41_600 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[600]), .o_ld_data(acts_0_41_600));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_605)) 
    rom_0_41_605 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[605]), .o_ld_data(acts_0_41_605));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_626)) 
    rom_0_41_626 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[626]), .o_ld_data(acts_0_41_626));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_41_632)) 
    rom_0_41_632 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[632]), .o_ld_data(acts_0_41_632));

  // Stage 1
    assign s_0_41_1_0 = {{2{acts_0_41_213[5]}}, acts_0_41_213} + {{2{acts_0_41_267[5]}}, acts_0_41_267} + {{2{acts_0_41_430[5]}}, acts_0_41_430} + {{2{acts_0_41_431[5]}}, acts_0_41_431};
    registers #(.ARRAY_WIDTH(8)) r_0_41_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_1_0), .q(s_0_41_1_0_reg));

    assign s_0_41_1_1 = {{2{acts_0_41_457[5]}}, acts_0_41_457} + {{2{acts_0_41_458[5]}}, acts_0_41_458} + {{2{acts_0_41_485[5]}}, acts_0_41_485} + {{2{acts_0_41_486[5]}}, acts_0_41_486};
    registers #(.ARRAY_WIDTH(8)) r_0_41_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_1_1), .q(s_0_41_1_1_reg));

    assign s_0_41_1_2 = {{2{acts_0_41_512[5]}}, acts_0_41_512} + {{2{acts_0_41_513[5]}}, acts_0_41_513} + {{2{acts_0_41_539[5]}}, acts_0_41_539} + {{2{acts_0_41_540[5]}}, acts_0_41_540};
    registers #(.ARRAY_WIDTH(8)) r_0_41_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_1_2), .q(s_0_41_1_2_reg));

    assign s_0_41_1_3 = {{2{acts_0_41_541[5]}}, acts_0_41_541} + {{2{acts_0_41_542[5]}}, acts_0_41_542} + {{2{acts_0_41_544[5]}}, acts_0_41_544} + {{2{acts_0_41_569[5]}}, acts_0_41_569};
    registers #(.ARRAY_WIDTH(8)) r_0_41_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_1_3), .q(s_0_41_1_3_reg));

    assign s_0_41_1_4 = {{2{acts_0_41_572[5]}}, acts_0_41_572} + {{2{acts_0_41_573[5]}}, acts_0_41_573} + {{2{acts_0_41_574[5]}}, acts_0_41_574} + {{2{acts_0_41_597[5]}}, acts_0_41_597};
    registers #(.ARRAY_WIDTH(8)) r_0_41_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_1_4), .q(s_0_41_1_4_reg));

    assign s_0_41_1_5 = {{2{acts_0_41_600[5]}}, acts_0_41_600} + {{2{acts_0_41_605[5]}}, acts_0_41_605} + {{2{acts_0_41_626[5]}}, acts_0_41_626} + {{2{acts_0_41_632[5]}}, acts_0_41_632};
    registers #(.ARRAY_WIDTH(8)) r_0_41_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_1_5), .q(s_0_41_1_5_reg));

  // Stage 2
    assign s_0_41_2_0 = {{2{s_0_41_1_0_reg[7]}}, s_0_41_1_0_reg} + {{2{s_0_41_1_1_reg[7]}}, s_0_41_1_1_reg} + {{2{s_0_41_1_2_reg[7]}}, s_0_41_1_2_reg} + {{2{s_0_41_1_3_reg[7]}}, s_0_41_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_41_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_2_0), .q(s_0_41_2_0_reg));

    assign s_0_41_2_1 = {{2{s_0_41_1_4_reg[7]}}, s_0_41_1_4_reg} + {{2{s_0_41_1_5_reg[7]}}, s_0_41_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_41_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_2_1), .q(s_0_41_2_1_reg));

  // Stage 3
    assign s_0_41_3_0 = {{2{s_0_41_2_0_reg[9]}}, s_0_41_2_0_reg} + {{2{s_0_41_2_1_reg[9]}}, s_0_41_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_41_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_3_0), .q(s_0_41_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_41_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_41_3_0_reg[11]}}, s_0_41_3_0_reg}), .q(sum_0_41_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_41 (.i_data(sum_0_41_reg), .o_data(out_0_41_sat));


    // Layer 0, Node 42
      logic  [11:0] s_0_42_3_0;
    logic  [11:0] s_0_42_3_0_reg;
    logic  [7:0] s_0_42_1_0, s_0_42_1_1, s_0_42_1_2, s_0_42_1_3, s_0_42_1_4, s_0_42_1_5, s_0_42_1_6, s_0_42_1_7, s_0_42_1_8, s_0_42_1_9, s_0_42_1_10, s_0_42_1_11;
    logic  [7:0] s_0_42_1_0_reg, s_0_42_1_1_reg, s_0_42_1_2_reg, s_0_42_1_3_reg, s_0_42_1_4_reg, s_0_42_1_5_reg, s_0_42_1_6_reg, s_0_42_1_7_reg, s_0_42_1_8_reg, s_0_42_1_9_reg, s_0_42_1_10_reg, s_0_42_1_11_reg;
    logic  [9:0] s_0_42_2_0, s_0_42_2_1, s_0_42_2_2;
    logic  [9:0] s_0_42_2_0_reg, s_0_42_2_1_reg, s_0_42_2_2_reg;
    logic [13:0] sum_0_42;
    logic [13:0] sum_0_42_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_156)) 
    rom_0_42_156 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[156]), .o_ld_data(acts_0_42_156));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_175)) 
    rom_0_42_175 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[175]), .o_ld_data(acts_0_42_175));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_178)) 
    rom_0_42_178 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[178]), .o_ld_data(acts_0_42_178));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_179)) 
    rom_0_42_179 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[179]), .o_ld_data(acts_0_42_179));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_185)) 
    rom_0_42_185 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[185]), .o_ld_data(acts_0_42_185));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_202)) 
    rom_0_42_202 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[202]), .o_ld_data(acts_0_42_202));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_203)) 
    rom_0_42_203 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[203]), .o_ld_data(acts_0_42_203));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_204)) 
    rom_0_42_204 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[204]), .o_ld_data(acts_0_42_204));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_206)) 
    rom_0_42_206 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[206]), .o_ld_data(acts_0_42_206));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_231)) 
    rom_0_42_231 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[231]), .o_ld_data(acts_0_42_231));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_232)) 
    rom_0_42_232 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[232]), .o_ld_data(acts_0_42_232));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_235)) 
    rom_0_42_235 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[235]), .o_ld_data(acts_0_42_235));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_236)) 
    rom_0_42_236 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[236]), .o_ld_data(acts_0_42_236));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_242)) 
    rom_0_42_242 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[242]), .o_ld_data(acts_0_42_242));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_263)) 
    rom_0_42_263 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[263]), .o_ld_data(acts_0_42_263));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_264)) 
    rom_0_42_264 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[264]), .o_ld_data(acts_0_42_264));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_269)) 
    rom_0_42_269 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[269]), .o_ld_data(acts_0_42_269));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_343)) 
    rom_0_42_343 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[343]), .o_ld_data(acts_0_42_343));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_370)) 
    rom_0_42_370 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[370]), .o_ld_data(acts_0_42_370));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_372)) 
    rom_0_42_372 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[372]), .o_ld_data(acts_0_42_372));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_378)) 
    rom_0_42_378 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[378]), .o_ld_data(acts_0_42_378));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_398)) 
    rom_0_42_398 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[398]), .o_ld_data(acts_0_42_398));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_399)) 
    rom_0_42_399 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[399]), .o_ld_data(acts_0_42_399));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_401)) 
    rom_0_42_401 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[401]), .o_ld_data(acts_0_42_401));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_426)) 
    rom_0_42_426 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[426]), .o_ld_data(acts_0_42_426));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_428)) 
    rom_0_42_428 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[428]), .o_ld_data(acts_0_42_428));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_431)) 
    rom_0_42_431 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[431]), .o_ld_data(acts_0_42_431));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_433)) 
    rom_0_42_433 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[433]), .o_ld_data(acts_0_42_433));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_455)) 
    rom_0_42_455 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[455]), .o_ld_data(acts_0_42_455));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_459)) 
    rom_0_42_459 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[459]), .o_ld_data(acts_0_42_459));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_486)) 
    rom_0_42_486 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[486]), .o_ld_data(acts_0_42_486));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_516)) 
    rom_0_42_516 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[516]), .o_ld_data(acts_0_42_516));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_517)) 
    rom_0_42_517 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[517]), .o_ld_data(acts_0_42_517));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_541)) 
    rom_0_42_541 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[541]), .o_ld_data(acts_0_42_541));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_549)) 
    rom_0_42_549 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[549]), .o_ld_data(acts_0_42_549));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_595)) 
    rom_0_42_595 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[595]), .o_ld_data(acts_0_42_595));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_600)) 
    rom_0_42_600 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[600]), .o_ld_data(acts_0_42_600));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_622)) 
    rom_0_42_622 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[622]), .o_ld_data(acts_0_42_622));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_623)) 
    rom_0_42_623 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[623]), .o_ld_data(acts_0_42_623));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_624)) 
    rom_0_42_624 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[624]), .o_ld_data(acts_0_42_624));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_626)) 
    rom_0_42_626 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[626]), .o_ld_data(acts_0_42_626));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_627)) 
    rom_0_42_627 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[627]), .o_ld_data(acts_0_42_627));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_629)) 
    rom_0_42_629 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[629]), .o_ld_data(acts_0_42_629));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_630)) 
    rom_0_42_630 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[630]), .o_ld_data(acts_0_42_630));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_651)) 
    rom_0_42_651 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[651]), .o_ld_data(acts_0_42_651));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_654)) 
    rom_0_42_654 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[654]), .o_ld_data(acts_0_42_654));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_655)) 
    rom_0_42_655 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[655]), .o_ld_data(acts_0_42_655));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_42_686)) 
    rom_0_42_686 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[686]), .o_ld_data(acts_0_42_686));

  // Stage 1
    assign s_0_42_1_0 = {{2{acts_0_42_156[5]}}, acts_0_42_156} + {{2{acts_0_42_175[5]}}, acts_0_42_175} + {{2{acts_0_42_178[5]}}, acts_0_42_178} + {{2{acts_0_42_179[5]}}, acts_0_42_179};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_0), .q(s_0_42_1_0_reg));

    assign s_0_42_1_1 = {{2{acts_0_42_185[5]}}, acts_0_42_185} + {{2{acts_0_42_202[5]}}, acts_0_42_202} + {{2{acts_0_42_203[5]}}, acts_0_42_203} + {{2{acts_0_42_204[5]}}, acts_0_42_204};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_1), .q(s_0_42_1_1_reg));

    assign s_0_42_1_2 = {{2{acts_0_42_206[5]}}, acts_0_42_206} + {{2{acts_0_42_231[5]}}, acts_0_42_231} + {{2{acts_0_42_232[5]}}, acts_0_42_232} + {{2{acts_0_42_235[5]}}, acts_0_42_235};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_2), .q(s_0_42_1_2_reg));

    assign s_0_42_1_3 = {{2{acts_0_42_236[5]}}, acts_0_42_236} + {{2{acts_0_42_242[5]}}, acts_0_42_242} + {{2{acts_0_42_263[5]}}, acts_0_42_263} + {{2{acts_0_42_264[5]}}, acts_0_42_264};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_3), .q(s_0_42_1_3_reg));

    assign s_0_42_1_4 = {{2{acts_0_42_269[5]}}, acts_0_42_269} + {{2{acts_0_42_343[5]}}, acts_0_42_343} + {{2{acts_0_42_370[5]}}, acts_0_42_370} + {{2{acts_0_42_372[5]}}, acts_0_42_372};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_4), .q(s_0_42_1_4_reg));

    assign s_0_42_1_5 = {{2{acts_0_42_378[5]}}, acts_0_42_378} + {{2{acts_0_42_398[5]}}, acts_0_42_398} + {{2{acts_0_42_399[5]}}, acts_0_42_399} + {{2{acts_0_42_401[5]}}, acts_0_42_401};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_5), .q(s_0_42_1_5_reg));

    assign s_0_42_1_6 = {{2{acts_0_42_426[5]}}, acts_0_42_426} + {{2{acts_0_42_428[5]}}, acts_0_42_428} + {{2{acts_0_42_431[5]}}, acts_0_42_431} + {{2{acts_0_42_433[5]}}, acts_0_42_433};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_6), .q(s_0_42_1_6_reg));

    assign s_0_42_1_7 = {{2{acts_0_42_455[5]}}, acts_0_42_455} + {{2{acts_0_42_459[5]}}, acts_0_42_459} + {{2{acts_0_42_486[5]}}, acts_0_42_486} + {{2{acts_0_42_516[5]}}, acts_0_42_516};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_7), .q(s_0_42_1_7_reg));

    assign s_0_42_1_8 = {{2{acts_0_42_517[5]}}, acts_0_42_517} + {{2{acts_0_42_541[5]}}, acts_0_42_541} + {{2{acts_0_42_549[5]}}, acts_0_42_549} + {{2{acts_0_42_595[5]}}, acts_0_42_595};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_8), .q(s_0_42_1_8_reg));

    assign s_0_42_1_9 = {{2{acts_0_42_600[5]}}, acts_0_42_600} + {{2{acts_0_42_622[5]}}, acts_0_42_622} + {{2{acts_0_42_623[5]}}, acts_0_42_623} + {{2{acts_0_42_624[5]}}, acts_0_42_624};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_9), .q(s_0_42_1_9_reg));

    assign s_0_42_1_10 = {{2{acts_0_42_626[5]}}, acts_0_42_626} + {{2{acts_0_42_627[5]}}, acts_0_42_627} + {{2{acts_0_42_629[5]}}, acts_0_42_629} + {{2{acts_0_42_630[5]}}, acts_0_42_630};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_10), .q(s_0_42_1_10_reg));

    assign s_0_42_1_11 = {{2{acts_0_42_651[5]}}, acts_0_42_651} + {{2{acts_0_42_654[5]}}, acts_0_42_654} + {{2{acts_0_42_655[5]}}, acts_0_42_655} + {{2{acts_0_42_686[5]}}, acts_0_42_686};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_11), .q(s_0_42_1_11_reg));

  // Stage 2
    assign s_0_42_2_0 = {{2{s_0_42_1_0_reg[7]}}, s_0_42_1_0_reg} + {{2{s_0_42_1_1_reg[7]}}, s_0_42_1_1_reg} + {{2{s_0_42_1_2_reg[7]}}, s_0_42_1_2_reg} + {{2{s_0_42_1_3_reg[7]}}, s_0_42_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_42_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_2_0), .q(s_0_42_2_0_reg));

    assign s_0_42_2_1 = {{2{s_0_42_1_4_reg[7]}}, s_0_42_1_4_reg} + {{2{s_0_42_1_5_reg[7]}}, s_0_42_1_5_reg} + {{2{s_0_42_1_6_reg[7]}}, s_0_42_1_6_reg} + {{2{s_0_42_1_7_reg[7]}}, s_0_42_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_42_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_2_1), .q(s_0_42_2_1_reg));

    assign s_0_42_2_2 = {{2{s_0_42_1_8_reg[7]}}, s_0_42_1_8_reg} + {{2{s_0_42_1_9_reg[7]}}, s_0_42_1_9_reg} + {{2{s_0_42_1_10_reg[7]}}, s_0_42_1_10_reg} + {{2{s_0_42_1_11_reg[7]}}, s_0_42_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_42_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_2_2), .q(s_0_42_2_2_reg));

  // Stage 3
    assign s_0_42_3_0 = {{2{s_0_42_2_0_reg[9]}}, s_0_42_2_0_reg} + {{2{s_0_42_2_1_reg[9]}}, s_0_42_2_1_reg} + {{2{s_0_42_2_2_reg[9]}}, s_0_42_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_42_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_3_0), .q(s_0_42_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_42_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_42_3_0_reg[11]}}, s_0_42_3_0_reg}), .q(sum_0_42_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_42 (.i_data(sum_0_42_reg), .o_data(out_0_42_sat));


    // Layer 0, Node 43
      logic  [11:0] s_0_43_3_0;
    logic  [11:0] s_0_43_3_0_reg;
    logic  [7:0] s_0_43_1_0, s_0_43_1_1, s_0_43_1_2, s_0_43_1_3, s_0_43_1_4, s_0_43_1_5, s_0_43_1_6, s_0_43_1_7;
    logic  [7:0] s_0_43_1_0_reg, s_0_43_1_1_reg, s_0_43_1_2_reg, s_0_43_1_3_reg, s_0_43_1_4_reg, s_0_43_1_5_reg, s_0_43_1_6_reg, s_0_43_1_7_reg;
    logic  [9:0] s_0_43_2_0, s_0_43_2_1;
    logic  [9:0] s_0_43_2_0_reg, s_0_43_2_1_reg;
    logic [13:0] sum_0_43;
    logic [13:0] sum_0_43_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_104)) 
    rom_0_43_104 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[104]), .o_ld_data(acts_0_43_104));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_213)) 
    rom_0_43_213 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[213]), .o_ld_data(acts_0_43_213));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_267)) 
    rom_0_43_267 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[267]), .o_ld_data(acts_0_43_267));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_268)) 
    rom_0_43_268 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[268]), .o_ld_data(acts_0_43_268));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_322)) 
    rom_0_43_322 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[322]), .o_ld_data(acts_0_43_322));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_323)) 
    rom_0_43_323 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[323]), .o_ld_data(acts_0_43_323));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_324)) 
    rom_0_43_324 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[324]), .o_ld_data(acts_0_43_324));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_351)) 
    rom_0_43_351 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[351]), .o_ld_data(acts_0_43_351));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_353)) 
    rom_0_43_353 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[353]), .o_ld_data(acts_0_43_353));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_354)) 
    rom_0_43_354 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[354]), .o_ld_data(acts_0_43_354));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_378)) 
    rom_0_43_378 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[378]), .o_ld_data(acts_0_43_378));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_379)) 
    rom_0_43_379 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[379]), .o_ld_data(acts_0_43_379));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_406)) 
    rom_0_43_406 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[406]), .o_ld_data(acts_0_43_406));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_407)) 
    rom_0_43_407 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[407]), .o_ld_data(acts_0_43_407));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_412)) 
    rom_0_43_412 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[412]), .o_ld_data(acts_0_43_412));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_414)) 
    rom_0_43_414 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[414]), .o_ld_data(acts_0_43_414));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_415)) 
    rom_0_43_415 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[415]), .o_ld_data(acts_0_43_415));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_416)) 
    rom_0_43_416 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[416]), .o_ld_data(acts_0_43_416));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_433)) 
    rom_0_43_433 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[433]), .o_ld_data(acts_0_43_433));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_434)) 
    rom_0_43_434 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[434]), .o_ld_data(acts_0_43_434));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_440)) 
    rom_0_43_440 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[440]), .o_ld_data(acts_0_43_440));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_454)) 
    rom_0_43_454 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[454]), .o_ld_data(acts_0_43_454));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_463)) 
    rom_0_43_463 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[463]), .o_ld_data(acts_0_43_463));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_465)) 
    rom_0_43_465 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[465]), .o_ld_data(acts_0_43_465));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_467)) 
    rom_0_43_467 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[467]), .o_ld_data(acts_0_43_467));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_491)) 
    rom_0_43_491 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[491]), .o_ld_data(acts_0_43_491));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_517)) 
    rom_0_43_517 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[517]), .o_ld_data(acts_0_43_517));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_541)) 
    rom_0_43_541 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[541]), .o_ld_data(acts_0_43_541));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_542)) 
    rom_0_43_542 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[542]), .o_ld_data(acts_0_43_542));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_543)) 
    rom_0_43_543 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[543]), .o_ld_data(acts_0_43_543));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_654)) 
    rom_0_43_654 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[654]), .o_ld_data(acts_0_43_654));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_43_732)) 
    rom_0_43_732 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[732]), .o_ld_data(acts_0_43_732));

  // Stage 1
    assign s_0_43_1_0 = {{2{acts_0_43_104[5]}}, acts_0_43_104} + {{2{acts_0_43_213[5]}}, acts_0_43_213} + {{2{acts_0_43_267[5]}}, acts_0_43_267} + {{2{acts_0_43_268[5]}}, acts_0_43_268};
    registers #(.ARRAY_WIDTH(8)) r_0_43_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_1_0), .q(s_0_43_1_0_reg));

    assign s_0_43_1_1 = {{2{acts_0_43_322[5]}}, acts_0_43_322} + {{2{acts_0_43_323[5]}}, acts_0_43_323} + {{2{acts_0_43_324[5]}}, acts_0_43_324} + {{2{acts_0_43_351[5]}}, acts_0_43_351};
    registers #(.ARRAY_WIDTH(8)) r_0_43_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_1_1), .q(s_0_43_1_1_reg));

    assign s_0_43_1_2 = {{2{acts_0_43_353[5]}}, acts_0_43_353} + {{2{acts_0_43_354[5]}}, acts_0_43_354} + {{2{acts_0_43_378[5]}}, acts_0_43_378} + {{2{acts_0_43_379[5]}}, acts_0_43_379};
    registers #(.ARRAY_WIDTH(8)) r_0_43_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_1_2), .q(s_0_43_1_2_reg));

    assign s_0_43_1_3 = {{2{acts_0_43_406[5]}}, acts_0_43_406} + {{2{acts_0_43_407[5]}}, acts_0_43_407} + {{2{acts_0_43_412[5]}}, acts_0_43_412} + {{2{acts_0_43_414[5]}}, acts_0_43_414};
    registers #(.ARRAY_WIDTH(8)) r_0_43_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_1_3), .q(s_0_43_1_3_reg));

    assign s_0_43_1_4 = {{2{acts_0_43_415[5]}}, acts_0_43_415} + {{2{acts_0_43_416[5]}}, acts_0_43_416} + {{2{acts_0_43_433[5]}}, acts_0_43_433} + {{2{acts_0_43_434[5]}}, acts_0_43_434};
    registers #(.ARRAY_WIDTH(8)) r_0_43_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_1_4), .q(s_0_43_1_4_reg));

    assign s_0_43_1_5 = {{2{acts_0_43_440[5]}}, acts_0_43_440} + {{2{acts_0_43_454[5]}}, acts_0_43_454} + {{2{acts_0_43_463[5]}}, acts_0_43_463} + {{2{acts_0_43_465[5]}}, acts_0_43_465};
    registers #(.ARRAY_WIDTH(8)) r_0_43_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_1_5), .q(s_0_43_1_5_reg));

    assign s_0_43_1_6 = {{2{acts_0_43_467[5]}}, acts_0_43_467} + {{2{acts_0_43_491[5]}}, acts_0_43_491} + {{2{acts_0_43_517[5]}}, acts_0_43_517} + {{2{acts_0_43_541[5]}}, acts_0_43_541};
    registers #(.ARRAY_WIDTH(8)) r_0_43_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_1_6), .q(s_0_43_1_6_reg));

    assign s_0_43_1_7 = {{2{acts_0_43_542[5]}}, acts_0_43_542} + {{2{acts_0_43_543[5]}}, acts_0_43_543} + {{2{acts_0_43_654[5]}}, acts_0_43_654} + {{2{acts_0_43_732[5]}}, acts_0_43_732};
    registers #(.ARRAY_WIDTH(8)) r_0_43_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_1_7), .q(s_0_43_1_7_reg));

  // Stage 2
    assign s_0_43_2_0 = {{2{s_0_43_1_0_reg[7]}}, s_0_43_1_0_reg} + {{2{s_0_43_1_1_reg[7]}}, s_0_43_1_1_reg} + {{2{s_0_43_1_2_reg[7]}}, s_0_43_1_2_reg} + {{2{s_0_43_1_3_reg[7]}}, s_0_43_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_43_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_2_0), .q(s_0_43_2_0_reg));

    assign s_0_43_2_1 = {{2{s_0_43_1_4_reg[7]}}, s_0_43_1_4_reg} + {{2{s_0_43_1_5_reg[7]}}, s_0_43_1_5_reg} + {{2{s_0_43_1_6_reg[7]}}, s_0_43_1_6_reg} + {{2{s_0_43_1_7_reg[7]}}, s_0_43_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_43_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_2_1), .q(s_0_43_2_1_reg));

  // Stage 3
    assign s_0_43_3_0 = {{2{s_0_43_2_0_reg[9]}}, s_0_43_2_0_reg} + {{2{s_0_43_2_1_reg[9]}}, s_0_43_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_43_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_3_0), .q(s_0_43_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_43_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_43_3_0_reg[11]}}, s_0_43_3_0_reg}), .q(sum_0_43_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_43 (.i_data(sum_0_43_reg), .o_data(out_0_43_sat));


    // Layer 0, Node 44
      logic  [11:0] s_0_44_3_0;
    logic  [11:0] s_0_44_3_0_reg;
    logic  [7:0] s_0_44_1_0, s_0_44_1_1, s_0_44_1_2, s_0_44_1_3, s_0_44_1_4, s_0_44_1_5;
    logic  [7:0] s_0_44_1_0_reg, s_0_44_1_1_reg, s_0_44_1_2_reg, s_0_44_1_3_reg, s_0_44_1_4_reg, s_0_44_1_5_reg;
    logic  [9:0] s_0_44_2_0, s_0_44_2_1;
    logic  [9:0] s_0_44_2_0_reg, s_0_44_2_1_reg;
    logic [13:0] sum_0_44;
    logic [13:0] sum_0_44_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_68)) 
    rom_0_44_68 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[68]), .o_ld_data(acts_0_44_68));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_69)) 
    rom_0_44_69 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[69]), .o_ld_data(acts_0_44_69));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_107)) 
    rom_0_44_107 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[107]), .o_ld_data(acts_0_44_107));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_156)) 
    rom_0_44_156 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[156]), .o_ld_data(acts_0_44_156));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_157)) 
    rom_0_44_157 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[157]), .o_ld_data(acts_0_44_157));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_158)) 
    rom_0_44_158 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[158]), .o_ld_data(acts_0_44_158));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_171)) 
    rom_0_44_171 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[171]), .o_ld_data(acts_0_44_171));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_184)) 
    rom_0_44_184 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[184]), .o_ld_data(acts_0_44_184));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_186)) 
    rom_0_44_186 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[186]), .o_ld_data(acts_0_44_186));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_211)) 
    rom_0_44_211 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[211]), .o_ld_data(acts_0_44_211));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_296)) 
    rom_0_44_296 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[296]), .o_ld_data(acts_0_44_296));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_312)) 
    rom_0_44_312 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[312]), .o_ld_data(acts_0_44_312));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_317)) 
    rom_0_44_317 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[317]), .o_ld_data(acts_0_44_317));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_392)) 
    rom_0_44_392 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[392]), .o_ld_data(acts_0_44_392));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_416)) 
    rom_0_44_416 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[416]), .o_ld_data(acts_0_44_416));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_439)) 
    rom_0_44_439 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[439]), .o_ld_data(acts_0_44_439));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_457)) 
    rom_0_44_457 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[457]), .o_ld_data(acts_0_44_457));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_499)) 
    rom_0_44_499 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[499]), .o_ld_data(acts_0_44_499));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_516)) 
    rom_0_44_516 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[516]), .o_ld_data(acts_0_44_516));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_571)) 
    rom_0_44_571 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[571]), .o_ld_data(acts_0_44_571));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_581)) 
    rom_0_44_581 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[581]), .o_ld_data(acts_0_44_581));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_643)) 
    rom_0_44_643 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[643]), .o_ld_data(acts_0_44_643));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_44_692)) 
    rom_0_44_692 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[692]), .o_ld_data(acts_0_44_692));

  // Stage 1
    assign s_0_44_1_0 = {{2{acts_0_44_68[5]}}, acts_0_44_68} + {{2{acts_0_44_69[5]}}, acts_0_44_69} + {{2{acts_0_44_107[5]}}, acts_0_44_107} + {{2{acts_0_44_156[5]}}, acts_0_44_156};
    registers #(.ARRAY_WIDTH(8)) r_0_44_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_1_0), .q(s_0_44_1_0_reg));

    assign s_0_44_1_1 = {{2{acts_0_44_157[5]}}, acts_0_44_157} + {{2{acts_0_44_158[5]}}, acts_0_44_158} + {{2{acts_0_44_171[5]}}, acts_0_44_171} + {{2{acts_0_44_184[5]}}, acts_0_44_184};
    registers #(.ARRAY_WIDTH(8)) r_0_44_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_1_1), .q(s_0_44_1_1_reg));

    assign s_0_44_1_2 = {{2{acts_0_44_186[5]}}, acts_0_44_186} + {{2{acts_0_44_211[5]}}, acts_0_44_211} + {{2{acts_0_44_296[5]}}, acts_0_44_296} + {{2{acts_0_44_312[5]}}, acts_0_44_312};
    registers #(.ARRAY_WIDTH(8)) r_0_44_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_1_2), .q(s_0_44_1_2_reg));

    assign s_0_44_1_3 = {{2{acts_0_44_317[5]}}, acts_0_44_317} + {{2{acts_0_44_392[5]}}, acts_0_44_392} + {{2{acts_0_44_416[5]}}, acts_0_44_416} + {{2{acts_0_44_439[5]}}, acts_0_44_439};
    registers #(.ARRAY_WIDTH(8)) r_0_44_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_1_3), .q(s_0_44_1_3_reg));

    assign s_0_44_1_4 = {{2{acts_0_44_457[5]}}, acts_0_44_457} + {{2{acts_0_44_499[5]}}, acts_0_44_499} + {{2{acts_0_44_516[5]}}, acts_0_44_516} + {{2{acts_0_44_571[5]}}, acts_0_44_571};
    registers #(.ARRAY_WIDTH(8)) r_0_44_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_1_4), .q(s_0_44_1_4_reg));

    assign s_0_44_1_5 = {{2{acts_0_44_581[5]}}, acts_0_44_581} + {{2{acts_0_44_643[5]}}, acts_0_44_643} + {{2{acts_0_44_692[5]}}, acts_0_44_692};
    registers #(.ARRAY_WIDTH(8)) r_0_44_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_1_5), .q(s_0_44_1_5_reg));

  // Stage 2
    assign s_0_44_2_0 = {{2{s_0_44_1_0_reg[7]}}, s_0_44_1_0_reg} + {{2{s_0_44_1_1_reg[7]}}, s_0_44_1_1_reg} + {{2{s_0_44_1_2_reg[7]}}, s_0_44_1_2_reg} + {{2{s_0_44_1_3_reg[7]}}, s_0_44_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_44_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_2_0), .q(s_0_44_2_0_reg));

    assign s_0_44_2_1 = {{2{s_0_44_1_4_reg[7]}}, s_0_44_1_4_reg} + {{2{s_0_44_1_5_reg[7]}}, s_0_44_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_44_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_2_1), .q(s_0_44_2_1_reg));

  // Stage 3
    assign s_0_44_3_0 = {{2{s_0_44_2_0_reg[9]}}, s_0_44_2_0_reg} + {{2{s_0_44_2_1_reg[9]}}, s_0_44_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_44_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_3_0), .q(s_0_44_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_44_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_44_3_0_reg[11]}}, s_0_44_3_0_reg}), .q(sum_0_44_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_44 (.i_data(sum_0_44_reg), .o_data(out_0_44_sat));


    // Layer 0, Node 45
      logic  [11:0] s_0_45_3_0;
    logic  [11:0] s_0_45_3_0_reg;
    logic  [7:0] s_0_45_1_0, s_0_45_1_1, s_0_45_1_2, s_0_45_1_3, s_0_45_1_4, s_0_45_1_5;
    logic  [7:0] s_0_45_1_0_reg, s_0_45_1_1_reg, s_0_45_1_2_reg, s_0_45_1_3_reg, s_0_45_1_4_reg, s_0_45_1_5_reg;
    logic  [9:0] s_0_45_2_0, s_0_45_2_1;
    logic  [9:0] s_0_45_2_0_reg, s_0_45_2_1_reg;
    logic [13:0] sum_0_45;
    logic [13:0] sum_0_45_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_243)) 
    rom_0_45_243 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[243]), .o_ld_data(acts_0_45_243));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_247)) 
    rom_0_45_247 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[247]), .o_ld_data(acts_0_45_247));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_356)) 
    rom_0_45_356 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[356]), .o_ld_data(acts_0_45_356));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_380)) 
    rom_0_45_380 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[380]), .o_ld_data(acts_0_45_380));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_383)) 
    rom_0_45_383 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[383]), .o_ld_data(acts_0_45_383));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_409)) 
    rom_0_45_409 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[409]), .o_ld_data(acts_0_45_409));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_437)) 
    rom_0_45_437 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[437]), .o_ld_data(acts_0_45_437));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_438)) 
    rom_0_45_438 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[438]), .o_ld_data(acts_0_45_438));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_457)) 
    rom_0_45_457 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[457]), .o_ld_data(acts_0_45_457));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_460)) 
    rom_0_45_460 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[460]), .o_ld_data(acts_0_45_460));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_486)) 
    rom_0_45_486 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[486]), .o_ld_data(acts_0_45_486));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_491)) 
    rom_0_45_491 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[491]), .o_ld_data(acts_0_45_491));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_492)) 
    rom_0_45_492 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[492]), .o_ld_data(acts_0_45_492));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_493)) 
    rom_0_45_493 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[493]), .o_ld_data(acts_0_45_493));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_538)) 
    rom_0_45_538 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[538]), .o_ld_data(acts_0_45_538));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_539)) 
    rom_0_45_539 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[539]), .o_ld_data(acts_0_45_539));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_568)) 
    rom_0_45_568 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[568]), .o_ld_data(acts_0_45_568));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_593)) 
    rom_0_45_593 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[593]), .o_ld_data(acts_0_45_593));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_604)) 
    rom_0_45_604 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[604]), .o_ld_data(acts_0_45_604));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_625)) 
    rom_0_45_625 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[625]), .o_ld_data(acts_0_45_625));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_631)) 
    rom_0_45_631 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[631]), .o_ld_data(acts_0_45_631));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_45_654)) 
    rom_0_45_654 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[654]), .o_ld_data(acts_0_45_654));

  // Stage 1
    assign s_0_45_1_0 = {{2{acts_0_45_243[5]}}, acts_0_45_243} + {{2{acts_0_45_247[5]}}, acts_0_45_247} + {{2{acts_0_45_356[5]}}, acts_0_45_356} + {{2{acts_0_45_380[5]}}, acts_0_45_380};
    registers #(.ARRAY_WIDTH(8)) r_0_45_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_1_0), .q(s_0_45_1_0_reg));

    assign s_0_45_1_1 = {{2{acts_0_45_383[5]}}, acts_0_45_383} + {{2{acts_0_45_409[5]}}, acts_0_45_409} + {{2{acts_0_45_437[5]}}, acts_0_45_437} + {{2{acts_0_45_438[5]}}, acts_0_45_438};
    registers #(.ARRAY_WIDTH(8)) r_0_45_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_1_1), .q(s_0_45_1_1_reg));

    assign s_0_45_1_2 = {{2{acts_0_45_457[5]}}, acts_0_45_457} + {{2{acts_0_45_460[5]}}, acts_0_45_460} + {{2{acts_0_45_486[5]}}, acts_0_45_486} + {{2{acts_0_45_491[5]}}, acts_0_45_491};
    registers #(.ARRAY_WIDTH(8)) r_0_45_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_1_2), .q(s_0_45_1_2_reg));

    assign s_0_45_1_3 = {{2{acts_0_45_492[5]}}, acts_0_45_492} + {{2{acts_0_45_493[5]}}, acts_0_45_493} + {{2{acts_0_45_538[5]}}, acts_0_45_538} + {{2{acts_0_45_539[5]}}, acts_0_45_539};
    registers #(.ARRAY_WIDTH(8)) r_0_45_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_1_3), .q(s_0_45_1_3_reg));

    assign s_0_45_1_4 = {{2{acts_0_45_568[5]}}, acts_0_45_568} + {{2{acts_0_45_593[5]}}, acts_0_45_593} + {{2{acts_0_45_604[5]}}, acts_0_45_604} + {{2{acts_0_45_625[5]}}, acts_0_45_625};
    registers #(.ARRAY_WIDTH(8)) r_0_45_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_1_4), .q(s_0_45_1_4_reg));

    assign s_0_45_1_5 = {{2{acts_0_45_631[5]}}, acts_0_45_631} + {{2{acts_0_45_654[5]}}, acts_0_45_654};
    registers #(.ARRAY_WIDTH(8)) r_0_45_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_1_5), .q(s_0_45_1_5_reg));

  // Stage 2
    assign s_0_45_2_0 = {{2{s_0_45_1_0_reg[7]}}, s_0_45_1_0_reg} + {{2{s_0_45_1_1_reg[7]}}, s_0_45_1_1_reg} + {{2{s_0_45_1_2_reg[7]}}, s_0_45_1_2_reg} + {{2{s_0_45_1_3_reg[7]}}, s_0_45_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_45_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_2_0), .q(s_0_45_2_0_reg));

    assign s_0_45_2_1 = {{2{s_0_45_1_4_reg[7]}}, s_0_45_1_4_reg} + {{2{s_0_45_1_5_reg[7]}}, s_0_45_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_45_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_2_1), .q(s_0_45_2_1_reg));

  // Stage 3
    assign s_0_45_3_0 = {{2{s_0_45_2_0_reg[9]}}, s_0_45_2_0_reg} + {{2{s_0_45_2_1_reg[9]}}, s_0_45_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_45_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_3_0), .q(s_0_45_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_45_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_45_3_0_reg[11]}}, s_0_45_3_0_reg}), .q(sum_0_45_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_45 (.i_data(sum_0_45_reg), .o_data(out_0_45_sat));


    // Layer 0, Node 46
      logic  [11:0] s_0_46_3_0;
    logic  [11:0] s_0_46_3_0_reg;
    logic  [7:0] s_0_46_1_0, s_0_46_1_1, s_0_46_1_2, s_0_46_1_3, s_0_46_1_4, s_0_46_1_5, s_0_46_1_6;
    logic  [7:0] s_0_46_1_0_reg, s_0_46_1_1_reg, s_0_46_1_2_reg, s_0_46_1_3_reg, s_0_46_1_4_reg, s_0_46_1_5_reg, s_0_46_1_6_reg;
    logic  [9:0] s_0_46_2_0, s_0_46_2_1;
    logic  [9:0] s_0_46_2_0_reg, s_0_46_2_1_reg;
    logic [13:0] sum_0_46;
    logic [13:0] sum_0_46_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_182)) 
    rom_0_46_182 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[182]), .o_ld_data(acts_0_46_182));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_183)) 
    rom_0_46_183 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[183]), .o_ld_data(acts_0_46_183));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_208)) 
    rom_0_46_208 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[208]), .o_ld_data(acts_0_46_208));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_209)) 
    rom_0_46_209 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[209]), .o_ld_data(acts_0_46_209));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_210)) 
    rom_0_46_210 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[210]), .o_ld_data(acts_0_46_210));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_235)) 
    rom_0_46_235 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[235]), .o_ld_data(acts_0_46_235));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_261)) 
    rom_0_46_261 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[261]), .o_ld_data(acts_0_46_261));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_262)) 
    rom_0_46_262 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[262]), .o_ld_data(acts_0_46_262));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_263)) 
    rom_0_46_263 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[263]), .o_ld_data(acts_0_46_263));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_325)) 
    rom_0_46_325 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[325]), .o_ld_data(acts_0_46_325));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_347)) 
    rom_0_46_347 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[347]), .o_ld_data(acts_0_46_347));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_348)) 
    rom_0_46_348 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[348]), .o_ld_data(acts_0_46_348));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_403)) 
    rom_0_46_403 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[403]), .o_ld_data(acts_0_46_403));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_405)) 
    rom_0_46_405 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[405]), .o_ld_data(acts_0_46_405));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_429)) 
    rom_0_46_429 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[429]), .o_ld_data(acts_0_46_429));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_431)) 
    rom_0_46_431 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[431]), .o_ld_data(acts_0_46_431));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_433)) 
    rom_0_46_433 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[433]), .o_ld_data(acts_0_46_433));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_462)) 
    rom_0_46_462 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[462]), .o_ld_data(acts_0_46_462));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_463)) 
    rom_0_46_463 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[463]), .o_ld_data(acts_0_46_463));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_492)) 
    rom_0_46_492 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[492]), .o_ld_data(acts_0_46_492));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_518)) 
    rom_0_46_518 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[518]), .o_ld_data(acts_0_46_518));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_539)) 
    rom_0_46_539 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[539]), .o_ld_data(acts_0_46_539));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_542)) 
    rom_0_46_542 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[542]), .o_ld_data(acts_0_46_542));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_545)) 
    rom_0_46_545 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[545]), .o_ld_data(acts_0_46_545));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_571)) 
    rom_0_46_571 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[571]), .o_ld_data(acts_0_46_571));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_572)) 
    rom_0_46_572 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[572]), .o_ld_data(acts_0_46_572));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_597)) 
    rom_0_46_597 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[597]), .o_ld_data(acts_0_46_597));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_46_717)) 
    rom_0_46_717 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[717]), .o_ld_data(acts_0_46_717));

  // Stage 1
    assign s_0_46_1_0 = {{2{acts_0_46_182[5]}}, acts_0_46_182} + {{2{acts_0_46_183[5]}}, acts_0_46_183} + {{2{acts_0_46_208[5]}}, acts_0_46_208} + {{2{acts_0_46_209[5]}}, acts_0_46_209};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_0), .q(s_0_46_1_0_reg));

    assign s_0_46_1_1 = {{2{acts_0_46_210[5]}}, acts_0_46_210} + {{2{acts_0_46_235[5]}}, acts_0_46_235} + {{2{acts_0_46_261[5]}}, acts_0_46_261} + {{2{acts_0_46_262[5]}}, acts_0_46_262};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_1), .q(s_0_46_1_1_reg));

    assign s_0_46_1_2 = {{2{acts_0_46_263[5]}}, acts_0_46_263} + {{2{acts_0_46_325[5]}}, acts_0_46_325} + {{2{acts_0_46_347[5]}}, acts_0_46_347} + {{2{acts_0_46_348[5]}}, acts_0_46_348};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_2), .q(s_0_46_1_2_reg));

    assign s_0_46_1_3 = {{2{acts_0_46_403[5]}}, acts_0_46_403} + {{2{acts_0_46_405[5]}}, acts_0_46_405} + {{2{acts_0_46_429[5]}}, acts_0_46_429} + {{2{acts_0_46_431[5]}}, acts_0_46_431};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_3), .q(s_0_46_1_3_reg));

    assign s_0_46_1_4 = {{2{acts_0_46_433[5]}}, acts_0_46_433} + {{2{acts_0_46_462[5]}}, acts_0_46_462} + {{2{acts_0_46_463[5]}}, acts_0_46_463} + {{2{acts_0_46_492[5]}}, acts_0_46_492};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_4), .q(s_0_46_1_4_reg));

    assign s_0_46_1_5 = {{2{acts_0_46_518[5]}}, acts_0_46_518} + {{2{acts_0_46_539[5]}}, acts_0_46_539} + {{2{acts_0_46_542[5]}}, acts_0_46_542} + {{2{acts_0_46_545[5]}}, acts_0_46_545};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_5), .q(s_0_46_1_5_reg));

    assign s_0_46_1_6 = {{2{acts_0_46_571[5]}}, acts_0_46_571} + {{2{acts_0_46_572[5]}}, acts_0_46_572} + {{2{acts_0_46_597[5]}}, acts_0_46_597} + {{2{acts_0_46_717[5]}}, acts_0_46_717};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_6), .q(s_0_46_1_6_reg));

  // Stage 2
    assign s_0_46_2_0 = {{2{s_0_46_1_0_reg[7]}}, s_0_46_1_0_reg} + {{2{s_0_46_1_1_reg[7]}}, s_0_46_1_1_reg} + {{2{s_0_46_1_2_reg[7]}}, s_0_46_1_2_reg} + {{2{s_0_46_1_3_reg[7]}}, s_0_46_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_46_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_2_0), .q(s_0_46_2_0_reg));

    assign s_0_46_2_1 = {{2{s_0_46_1_4_reg[7]}}, s_0_46_1_4_reg} + {{2{s_0_46_1_5_reg[7]}}, s_0_46_1_5_reg} + {{2{s_0_46_1_6_reg[7]}}, s_0_46_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_46_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_2_1), .q(s_0_46_2_1_reg));

  // Stage 3
    assign s_0_46_3_0 = {{2{s_0_46_2_0_reg[9]}}, s_0_46_2_0_reg} + {{2{s_0_46_2_1_reg[9]}}, s_0_46_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_46_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_3_0), .q(s_0_46_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_46_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_46_3_0_reg[11]}}, s_0_46_3_0_reg}), .q(sum_0_46_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_46 (.i_data(sum_0_46_reg), .o_data(out_0_46_sat));


    // Layer 0, Node 47
      logic  [11:0] s_0_47_3_0;
    logic  [11:0] s_0_47_3_0_reg;
    logic  [7:0] s_0_47_1_0, s_0_47_1_1, s_0_47_1_2, s_0_47_1_3, s_0_47_1_4, s_0_47_1_5, s_0_47_1_6;
    logic  [7:0] s_0_47_1_0_reg, s_0_47_1_1_reg, s_0_47_1_2_reg, s_0_47_1_3_reg, s_0_47_1_4_reg, s_0_47_1_5_reg, s_0_47_1_6_reg;
    logic  [9:0] s_0_47_2_0, s_0_47_2_1;
    logic  [9:0] s_0_47_2_0_reg, s_0_47_2_1_reg;
    logic [13:0] sum_0_47;
    logic [13:0] sum_0_47_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_151)) 
    rom_0_47_151 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[151]), .o_ld_data(acts_0_47_151));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_182)) 
    rom_0_47_182 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[182]), .o_ld_data(acts_0_47_182));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_261)) 
    rom_0_47_261 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[261]), .o_ld_data(acts_0_47_261));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_295)) 
    rom_0_47_295 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[295]), .o_ld_data(acts_0_47_295));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_323)) 
    rom_0_47_323 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[323]), .o_ld_data(acts_0_47_323));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_324)) 
    rom_0_47_324 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[324]), .o_ld_data(acts_0_47_324));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_351)) 
    rom_0_47_351 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[351]), .o_ld_data(acts_0_47_351));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_374)) 
    rom_0_47_374 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[374]), .o_ld_data(acts_0_47_374));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_378)) 
    rom_0_47_378 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[378]), .o_ld_data(acts_0_47_378));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_380)) 
    rom_0_47_380 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[380]), .o_ld_data(acts_0_47_380));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_407)) 
    rom_0_47_407 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[407]), .o_ld_data(acts_0_47_407));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_462)) 
    rom_0_47_462 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[462]), .o_ld_data(acts_0_47_462));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_466)) 
    rom_0_47_466 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[466]), .o_ld_data(acts_0_47_466));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_468)) 
    rom_0_47_468 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[468]), .o_ld_data(acts_0_47_468));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_470)) 
    rom_0_47_470 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[470]), .o_ld_data(acts_0_47_470));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_489)) 
    rom_0_47_489 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[489]), .o_ld_data(acts_0_47_489));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_493)) 
    rom_0_47_493 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[493]), .o_ld_data(acts_0_47_493));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_494)) 
    rom_0_47_494 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[494]), .o_ld_data(acts_0_47_494));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_495)) 
    rom_0_47_495 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[495]), .o_ld_data(acts_0_47_495));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_516)) 
    rom_0_47_516 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[516]), .o_ld_data(acts_0_47_516));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_520)) 
    rom_0_47_520 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[520]), .o_ld_data(acts_0_47_520));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_521)) 
    rom_0_47_521 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[521]), .o_ld_data(acts_0_47_521));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_542)) 
    rom_0_47_542 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[542]), .o_ld_data(acts_0_47_542));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_547)) 
    rom_0_47_547 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[547]), .o_ld_data(acts_0_47_547));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_548)) 
    rom_0_47_548 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[548]), .o_ld_data(acts_0_47_548));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_581)) 
    rom_0_47_581 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[581]), .o_ld_data(acts_0_47_581));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_47_655)) 
    rom_0_47_655 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[655]), .o_ld_data(acts_0_47_655));

  // Stage 1
    assign s_0_47_1_0 = {{2{acts_0_47_151[5]}}, acts_0_47_151} + {{2{acts_0_47_182[5]}}, acts_0_47_182} + {{2{acts_0_47_261[5]}}, acts_0_47_261} + {{2{acts_0_47_295[5]}}, acts_0_47_295};
    registers #(.ARRAY_WIDTH(8)) r_0_47_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_1_0), .q(s_0_47_1_0_reg));

    assign s_0_47_1_1 = {{2{acts_0_47_323[5]}}, acts_0_47_323} + {{2{acts_0_47_324[5]}}, acts_0_47_324} + {{2{acts_0_47_351[5]}}, acts_0_47_351} + {{2{acts_0_47_374[5]}}, acts_0_47_374};
    registers #(.ARRAY_WIDTH(8)) r_0_47_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_1_1), .q(s_0_47_1_1_reg));

    assign s_0_47_1_2 = {{2{acts_0_47_378[5]}}, acts_0_47_378} + {{2{acts_0_47_380[5]}}, acts_0_47_380} + {{2{acts_0_47_407[5]}}, acts_0_47_407} + {{2{acts_0_47_462[5]}}, acts_0_47_462};
    registers #(.ARRAY_WIDTH(8)) r_0_47_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_1_2), .q(s_0_47_1_2_reg));

    assign s_0_47_1_3 = {{2{acts_0_47_466[5]}}, acts_0_47_466} + {{2{acts_0_47_468[5]}}, acts_0_47_468} + {{2{acts_0_47_470[5]}}, acts_0_47_470} + {{2{acts_0_47_489[5]}}, acts_0_47_489};
    registers #(.ARRAY_WIDTH(8)) r_0_47_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_1_3), .q(s_0_47_1_3_reg));

    assign s_0_47_1_4 = {{2{acts_0_47_493[5]}}, acts_0_47_493} + {{2{acts_0_47_494[5]}}, acts_0_47_494} + {{2{acts_0_47_495[5]}}, acts_0_47_495} + {{2{acts_0_47_516[5]}}, acts_0_47_516};
    registers #(.ARRAY_WIDTH(8)) r_0_47_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_1_4), .q(s_0_47_1_4_reg));

    assign s_0_47_1_5 = {{2{acts_0_47_520[5]}}, acts_0_47_520} + {{2{acts_0_47_521[5]}}, acts_0_47_521} + {{2{acts_0_47_542[5]}}, acts_0_47_542} + {{2{acts_0_47_547[5]}}, acts_0_47_547};
    registers #(.ARRAY_WIDTH(8)) r_0_47_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_1_5), .q(s_0_47_1_5_reg));

    assign s_0_47_1_6 = {{2{acts_0_47_548[5]}}, acts_0_47_548} + {{2{acts_0_47_581[5]}}, acts_0_47_581} + {{2{acts_0_47_655[5]}}, acts_0_47_655};
    registers #(.ARRAY_WIDTH(8)) r_0_47_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_1_6), .q(s_0_47_1_6_reg));

  // Stage 2
    assign s_0_47_2_0 = {{2{s_0_47_1_0_reg[7]}}, s_0_47_1_0_reg} + {{2{s_0_47_1_1_reg[7]}}, s_0_47_1_1_reg} + {{2{s_0_47_1_2_reg[7]}}, s_0_47_1_2_reg} + {{2{s_0_47_1_3_reg[7]}}, s_0_47_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_47_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_2_0), .q(s_0_47_2_0_reg));

    assign s_0_47_2_1 = {{2{s_0_47_1_4_reg[7]}}, s_0_47_1_4_reg} + {{2{s_0_47_1_5_reg[7]}}, s_0_47_1_5_reg} + {{2{s_0_47_1_6_reg[7]}}, s_0_47_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_47_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_2_1), .q(s_0_47_2_1_reg));

  // Stage 3
    assign s_0_47_3_0 = {{2{s_0_47_2_0_reg[9]}}, s_0_47_2_0_reg} + {{2{s_0_47_2_1_reg[9]}}, s_0_47_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_47_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_3_0), .q(s_0_47_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_47_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_47_3_0_reg[11]}}, s_0_47_3_0_reg}), .q(sum_0_47_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_47 (.i_data(sum_0_47_reg), .o_data(out_0_47_sat));


    // Layer 0, Node 48
      logic  [11:0] s_0_48_3_0;
    logic  [11:0] s_0_48_3_0_reg;
    logic  [7:0] s_0_48_1_0, s_0_48_1_1, s_0_48_1_2, s_0_48_1_3, s_0_48_1_4, s_0_48_1_5, s_0_48_1_6, s_0_48_1_7, s_0_48_1_8, s_0_48_1_9;
    logic  [7:0] s_0_48_1_0_reg, s_0_48_1_1_reg, s_0_48_1_2_reg, s_0_48_1_3_reg, s_0_48_1_4_reg, s_0_48_1_5_reg, s_0_48_1_6_reg, s_0_48_1_7_reg, s_0_48_1_8_reg, s_0_48_1_9_reg;
    logic  [9:0] s_0_48_2_0, s_0_48_2_1, s_0_48_2_2;
    logic  [9:0] s_0_48_2_0_reg, s_0_48_2_1_reg, s_0_48_2_2_reg;
    logic [13:0] sum_0_48;
    logic [13:0] sum_0_48_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_214)) 
    rom_0_48_214 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[214]), .o_ld_data(acts_0_48_214));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_215)) 
    rom_0_48_215 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[215]), .o_ld_data(acts_0_48_215));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_216)) 
    rom_0_48_216 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[216]), .o_ld_data(acts_0_48_216));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_242)) 
    rom_0_48_242 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[242]), .o_ld_data(acts_0_48_242));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_243)) 
    rom_0_48_243 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[243]), .o_ld_data(acts_0_48_243));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_244)) 
    rom_0_48_244 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[244]), .o_ld_data(acts_0_48_244));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_246)) 
    rom_0_48_246 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[246]), .o_ld_data(acts_0_48_246));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_268)) 
    rom_0_48_268 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[268]), .o_ld_data(acts_0_48_268));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_269)) 
    rom_0_48_269 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[269]), .o_ld_data(acts_0_48_269));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_271)) 
    rom_0_48_271 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[271]), .o_ld_data(acts_0_48_271));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_272)) 
    rom_0_48_272 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[272]), .o_ld_data(acts_0_48_272));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_273)) 
    rom_0_48_273 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[273]), .o_ld_data(acts_0_48_273));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_274)) 
    rom_0_48_274 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[274]), .o_ld_data(acts_0_48_274));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_275)) 
    rom_0_48_275 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[275]), .o_ld_data(acts_0_48_275));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_294)) 
    rom_0_48_294 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[294]), .o_ld_data(acts_0_48_294));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_295)) 
    rom_0_48_295 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[295]), .o_ld_data(acts_0_48_295));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_296)) 
    rom_0_48_296 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[296]), .o_ld_data(acts_0_48_296));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_303)) 
    rom_0_48_303 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[303]), .o_ld_data(acts_0_48_303));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_355)) 
    rom_0_48_355 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[355]), .o_ld_data(acts_0_48_355));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_375)) 
    rom_0_48_375 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[375]), .o_ld_data(acts_0_48_375));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_380)) 
    rom_0_48_380 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[380]), .o_ld_data(acts_0_48_380));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_399)) 
    rom_0_48_399 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[399]), .o_ld_data(acts_0_48_399));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_403)) 
    rom_0_48_403 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[403]), .o_ld_data(acts_0_48_403));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_410)) 
    rom_0_48_410 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[410]), .o_ld_data(acts_0_48_410));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_414)) 
    rom_0_48_414 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[414]), .o_ld_data(acts_0_48_414));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_431)) 
    rom_0_48_431 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[431]), .o_ld_data(acts_0_48_431));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_437)) 
    rom_0_48_437 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[437]), .o_ld_data(acts_0_48_437));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_440)) 
    rom_0_48_440 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[440]), .o_ld_data(acts_0_48_440));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_465)) 
    rom_0_48_465 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[465]), .o_ld_data(acts_0_48_465));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_469)) 
    rom_0_48_469 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[469]), .o_ld_data(acts_0_48_469));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_489)) 
    rom_0_48_489 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[489]), .o_ld_data(acts_0_48_489));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_493)) 
    rom_0_48_493 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[493]), .o_ld_data(acts_0_48_493));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_566)) 
    rom_0_48_566 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[566]), .o_ld_data(acts_0_48_566));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_594)) 
    rom_0_48_594 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[594]), .o_ld_data(acts_0_48_594));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_634)) 
    rom_0_48_634 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[634]), .o_ld_data(acts_0_48_634));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_658)) 
    rom_0_48_658 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[658]), .o_ld_data(acts_0_48_658));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_659)) 
    rom_0_48_659 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[659]), .o_ld_data(acts_0_48_659));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_661)) 
    rom_0_48_661 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[661]), .o_ld_data(acts_0_48_661));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_48_662)) 
    rom_0_48_662 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[662]), .o_ld_data(acts_0_48_662));

  // Stage 1
    assign s_0_48_1_0 = {{2{acts_0_48_214[5]}}, acts_0_48_214} + {{2{acts_0_48_215[5]}}, acts_0_48_215} + {{2{acts_0_48_216[5]}}, acts_0_48_216} + {{2{acts_0_48_242[5]}}, acts_0_48_242};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_0), .q(s_0_48_1_0_reg));

    assign s_0_48_1_1 = {{2{acts_0_48_243[5]}}, acts_0_48_243} + {{2{acts_0_48_244[5]}}, acts_0_48_244} + {{2{acts_0_48_246[5]}}, acts_0_48_246} + {{2{acts_0_48_268[5]}}, acts_0_48_268};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_1), .q(s_0_48_1_1_reg));

    assign s_0_48_1_2 = {{2{acts_0_48_269[5]}}, acts_0_48_269} + {{2{acts_0_48_271[5]}}, acts_0_48_271} + {{2{acts_0_48_272[5]}}, acts_0_48_272} + {{2{acts_0_48_273[5]}}, acts_0_48_273};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_2), .q(s_0_48_1_2_reg));

    assign s_0_48_1_3 = {{2{acts_0_48_274[5]}}, acts_0_48_274} + {{2{acts_0_48_275[5]}}, acts_0_48_275} + {{2{acts_0_48_294[5]}}, acts_0_48_294} + {{2{acts_0_48_295[5]}}, acts_0_48_295};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_3), .q(s_0_48_1_3_reg));

    assign s_0_48_1_4 = {{2{acts_0_48_296[5]}}, acts_0_48_296} + {{2{acts_0_48_303[5]}}, acts_0_48_303} + {{2{acts_0_48_355[5]}}, acts_0_48_355} + {{2{acts_0_48_375[5]}}, acts_0_48_375};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_4), .q(s_0_48_1_4_reg));

    assign s_0_48_1_5 = {{2{acts_0_48_380[5]}}, acts_0_48_380} + {{2{acts_0_48_399[5]}}, acts_0_48_399} + {{2{acts_0_48_403[5]}}, acts_0_48_403} + {{2{acts_0_48_410[5]}}, acts_0_48_410};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_5), .q(s_0_48_1_5_reg));

    assign s_0_48_1_6 = {{2{acts_0_48_414[5]}}, acts_0_48_414} + {{2{acts_0_48_431[5]}}, acts_0_48_431} + {{2{acts_0_48_437[5]}}, acts_0_48_437} + {{2{acts_0_48_440[5]}}, acts_0_48_440};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_6), .q(s_0_48_1_6_reg));

    assign s_0_48_1_7 = {{2{acts_0_48_465[5]}}, acts_0_48_465} + {{2{acts_0_48_469[5]}}, acts_0_48_469} + {{2{acts_0_48_489[5]}}, acts_0_48_489} + {{2{acts_0_48_493[5]}}, acts_0_48_493};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_7), .q(s_0_48_1_7_reg));

    assign s_0_48_1_8 = {{2{acts_0_48_566[5]}}, acts_0_48_566} + {{2{acts_0_48_594[5]}}, acts_0_48_594} + {{2{acts_0_48_634[5]}}, acts_0_48_634} + {{2{acts_0_48_658[5]}}, acts_0_48_658};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_8), .q(s_0_48_1_8_reg));

    assign s_0_48_1_9 = {{2{acts_0_48_659[5]}}, acts_0_48_659} + {{2{acts_0_48_661[5]}}, acts_0_48_661} + {{2{acts_0_48_662[5]}}, acts_0_48_662};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_9), .q(s_0_48_1_9_reg));

  // Stage 2
    assign s_0_48_2_0 = {{2{s_0_48_1_0_reg[7]}}, s_0_48_1_0_reg} + {{2{s_0_48_1_1_reg[7]}}, s_0_48_1_1_reg} + {{2{s_0_48_1_2_reg[7]}}, s_0_48_1_2_reg} + {{2{s_0_48_1_3_reg[7]}}, s_0_48_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_48_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_2_0), .q(s_0_48_2_0_reg));

    assign s_0_48_2_1 = {{2{s_0_48_1_4_reg[7]}}, s_0_48_1_4_reg} + {{2{s_0_48_1_5_reg[7]}}, s_0_48_1_5_reg} + {{2{s_0_48_1_6_reg[7]}}, s_0_48_1_6_reg} + {{2{s_0_48_1_7_reg[7]}}, s_0_48_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_48_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_2_1), .q(s_0_48_2_1_reg));

    assign s_0_48_2_2 = {{2{s_0_48_1_8_reg[7]}}, s_0_48_1_8_reg} + {{2{s_0_48_1_9_reg[7]}}, s_0_48_1_9_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_48_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_2_2), .q(s_0_48_2_2_reg));

  // Stage 3
    assign s_0_48_3_0 = {{2{s_0_48_2_0_reg[9]}}, s_0_48_2_0_reg} + {{2{s_0_48_2_1_reg[9]}}, s_0_48_2_1_reg} + {{2{s_0_48_2_2_reg[9]}}, s_0_48_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_48_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_3_0), .q(s_0_48_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_48_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_48_3_0_reg[11]}}, s_0_48_3_0_reg}), .q(sum_0_48_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_48 (.i_data(sum_0_48_reg), .o_data(out_0_48_sat));


    // Layer 0, Node 49
      logic  [11:0] s_0_49_3_0;
    logic  [11:0] s_0_49_3_0_reg;
    logic  [7:0] s_0_49_1_0, s_0_49_1_1, s_0_49_1_2, s_0_49_1_3, s_0_49_1_4, s_0_49_1_5, s_0_49_1_6, s_0_49_1_7;
    logic  [7:0] s_0_49_1_0_reg, s_0_49_1_1_reg, s_0_49_1_2_reg, s_0_49_1_3_reg, s_0_49_1_4_reg, s_0_49_1_5_reg, s_0_49_1_6_reg, s_0_49_1_7_reg;
    logic  [9:0] s_0_49_2_0, s_0_49_2_1;
    logic  [9:0] s_0_49_2_0_reg, s_0_49_2_1_reg;
    logic [13:0] sum_0_49;
    logic [13:0] sum_0_49_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_188)) 
    rom_0_49_188 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[188]), .o_ld_data(acts_0_49_188));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_214)) 
    rom_0_49_214 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[214]), .o_ld_data(acts_0_49_214));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_220)) 
    rom_0_49_220 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[220]), .o_ld_data(acts_0_49_220));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_248)) 
    rom_0_49_248 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[248]), .o_ld_data(acts_0_49_248));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_263)) 
    rom_0_49_263 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[263]), .o_ld_data(acts_0_49_263));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_264)) 
    rom_0_49_264 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[264]), .o_ld_data(acts_0_49_264));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_276)) 
    rom_0_49_276 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[276]), .o_ld_data(acts_0_49_276));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_303)) 
    rom_0_49_303 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[303]), .o_ld_data(acts_0_49_303));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_305)) 
    rom_0_49_305 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[305]), .o_ld_data(acts_0_49_305));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_346)) 
    rom_0_49_346 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[346]), .o_ld_data(acts_0_49_346));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_378)) 
    rom_0_49_378 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[378]), .o_ld_data(acts_0_49_378));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_379)) 
    rom_0_49_379 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[379]), .o_ld_data(acts_0_49_379));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_397)) 
    rom_0_49_397 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[397]), .o_ld_data(acts_0_49_397));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_398)) 
    rom_0_49_398 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[398]), .o_ld_data(acts_0_49_398));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_399)) 
    rom_0_49_399 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[399]), .o_ld_data(acts_0_49_399));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_408)) 
    rom_0_49_408 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[408]), .o_ld_data(acts_0_49_408));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_428)) 
    rom_0_49_428 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[428]), .o_ld_data(acts_0_49_428));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_429)) 
    rom_0_49_429 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[429]), .o_ld_data(acts_0_49_429));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_431)) 
    rom_0_49_431 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[431]), .o_ld_data(acts_0_49_431));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_455)) 
    rom_0_49_455 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[455]), .o_ld_data(acts_0_49_455));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_458)) 
    rom_0_49_458 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[458]), .o_ld_data(acts_0_49_458));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_459)) 
    rom_0_49_459 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[459]), .o_ld_data(acts_0_49_459));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_460)) 
    rom_0_49_460 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[460]), .o_ld_data(acts_0_49_460));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_485)) 
    rom_0_49_485 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[485]), .o_ld_data(acts_0_49_485));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_486)) 
    rom_0_49_486 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[486]), .o_ld_data(acts_0_49_486));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_488)) 
    rom_0_49_488 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[488]), .o_ld_data(acts_0_49_488));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_495)) 
    rom_0_49_495 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[495]), .o_ld_data(acts_0_49_495));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_497)) 
    rom_0_49_497 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[497]), .o_ld_data(acts_0_49_497));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_520)) 
    rom_0_49_520 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[520]), .o_ld_data(acts_0_49_520));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_522)) 
    rom_0_49_522 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[522]), .o_ld_data(acts_0_49_522));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_688)) 
    rom_0_49_688 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[688]), .o_ld_data(acts_0_49_688));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_49_689)) 
    rom_0_49_689 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[689]), .o_ld_data(acts_0_49_689));

  // Stage 1
    assign s_0_49_1_0 = {{2{acts_0_49_188[5]}}, acts_0_49_188} + {{2{acts_0_49_214[5]}}, acts_0_49_214} + {{2{acts_0_49_220[5]}}, acts_0_49_220} + {{2{acts_0_49_248[5]}}, acts_0_49_248};
    registers #(.ARRAY_WIDTH(8)) r_0_49_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_1_0), .q(s_0_49_1_0_reg));

    assign s_0_49_1_1 = {{2{acts_0_49_263[5]}}, acts_0_49_263} + {{2{acts_0_49_264[5]}}, acts_0_49_264} + {{2{acts_0_49_276[5]}}, acts_0_49_276} + {{2{acts_0_49_303[5]}}, acts_0_49_303};
    registers #(.ARRAY_WIDTH(8)) r_0_49_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_1_1), .q(s_0_49_1_1_reg));

    assign s_0_49_1_2 = {{2{acts_0_49_305[5]}}, acts_0_49_305} + {{2{acts_0_49_346[5]}}, acts_0_49_346} + {{2{acts_0_49_378[5]}}, acts_0_49_378} + {{2{acts_0_49_379[5]}}, acts_0_49_379};
    registers #(.ARRAY_WIDTH(8)) r_0_49_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_1_2), .q(s_0_49_1_2_reg));

    assign s_0_49_1_3 = {{2{acts_0_49_397[5]}}, acts_0_49_397} + {{2{acts_0_49_398[5]}}, acts_0_49_398} + {{2{acts_0_49_399[5]}}, acts_0_49_399} + {{2{acts_0_49_408[5]}}, acts_0_49_408};
    registers #(.ARRAY_WIDTH(8)) r_0_49_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_1_3), .q(s_0_49_1_3_reg));

    assign s_0_49_1_4 = {{2{acts_0_49_428[5]}}, acts_0_49_428} + {{2{acts_0_49_429[5]}}, acts_0_49_429} + {{2{acts_0_49_431[5]}}, acts_0_49_431} + {{2{acts_0_49_455[5]}}, acts_0_49_455};
    registers #(.ARRAY_WIDTH(8)) r_0_49_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_1_4), .q(s_0_49_1_4_reg));

    assign s_0_49_1_5 = {{2{acts_0_49_458[5]}}, acts_0_49_458} + {{2{acts_0_49_459[5]}}, acts_0_49_459} + {{2{acts_0_49_460[5]}}, acts_0_49_460} + {{2{acts_0_49_485[5]}}, acts_0_49_485};
    registers #(.ARRAY_WIDTH(8)) r_0_49_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_1_5), .q(s_0_49_1_5_reg));

    assign s_0_49_1_6 = {{2{acts_0_49_486[5]}}, acts_0_49_486} + {{2{acts_0_49_488[5]}}, acts_0_49_488} + {{2{acts_0_49_495[5]}}, acts_0_49_495} + {{2{acts_0_49_497[5]}}, acts_0_49_497};
    registers #(.ARRAY_WIDTH(8)) r_0_49_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_1_6), .q(s_0_49_1_6_reg));

    assign s_0_49_1_7 = {{2{acts_0_49_520[5]}}, acts_0_49_520} + {{2{acts_0_49_522[5]}}, acts_0_49_522} + {{2{acts_0_49_688[5]}}, acts_0_49_688} + {{2{acts_0_49_689[5]}}, acts_0_49_689};
    registers #(.ARRAY_WIDTH(8)) r_0_49_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_1_7), .q(s_0_49_1_7_reg));

  // Stage 2
    assign s_0_49_2_0 = {{2{s_0_49_1_0_reg[7]}}, s_0_49_1_0_reg} + {{2{s_0_49_1_1_reg[7]}}, s_0_49_1_1_reg} + {{2{s_0_49_1_2_reg[7]}}, s_0_49_1_2_reg} + {{2{s_0_49_1_3_reg[7]}}, s_0_49_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_49_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_2_0), .q(s_0_49_2_0_reg));

    assign s_0_49_2_1 = {{2{s_0_49_1_4_reg[7]}}, s_0_49_1_4_reg} + {{2{s_0_49_1_5_reg[7]}}, s_0_49_1_5_reg} + {{2{s_0_49_1_6_reg[7]}}, s_0_49_1_6_reg} + {{2{s_0_49_1_7_reg[7]}}, s_0_49_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_49_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_2_1), .q(s_0_49_2_1_reg));

  // Stage 3
    assign s_0_49_3_0 = {{2{s_0_49_2_0_reg[9]}}, s_0_49_2_0_reg} + {{2{s_0_49_2_1_reg[9]}}, s_0_49_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_49_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_3_0), .q(s_0_49_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_49_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_49_3_0_reg[11]}}, s_0_49_3_0_reg}), .q(sum_0_49_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_49 (.i_data(sum_0_49_reg), .o_data(out_0_49_sat));


    // Layer 0, Node 50
      logic  [11:0] s_0_50_3_0;
    logic  [11:0] s_0_50_3_0_reg;
    logic  [7:0] s_0_50_1_0, s_0_50_1_1, s_0_50_1_2, s_0_50_1_3, s_0_50_1_4, s_0_50_1_5, s_0_50_1_6, s_0_50_1_7;
    logic  [7:0] s_0_50_1_0_reg, s_0_50_1_1_reg, s_0_50_1_2_reg, s_0_50_1_3_reg, s_0_50_1_4_reg, s_0_50_1_5_reg, s_0_50_1_6_reg, s_0_50_1_7_reg;
    logic  [9:0] s_0_50_2_0, s_0_50_2_1;
    logic  [9:0] s_0_50_2_0_reg, s_0_50_2_1_reg;
    logic [13:0] sum_0_50;
    logic [13:0] sum_0_50_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_216)) 
    rom_0_50_216 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[216]), .o_ld_data(acts_0_50_216));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_217)) 
    rom_0_50_217 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[217]), .o_ld_data(acts_0_50_217));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_218)) 
    rom_0_50_218 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[218]), .o_ld_data(acts_0_50_218));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_219)) 
    rom_0_50_219 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[219]), .o_ld_data(acts_0_50_219));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_244)) 
    rom_0_50_244 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[244]), .o_ld_data(acts_0_50_244));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_263)) 
    rom_0_50_263 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[263]), .o_ld_data(acts_0_50_263));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_269)) 
    rom_0_50_269 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[269]), .o_ld_data(acts_0_50_269));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_270)) 
    rom_0_50_270 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[270]), .o_ld_data(acts_0_50_270));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_322)) 
    rom_0_50_322 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[322]), .o_ld_data(acts_0_50_322));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_328)) 
    rom_0_50_328 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[328]), .o_ld_data(acts_0_50_328));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_331)) 
    rom_0_50_331 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[331]), .o_ld_data(acts_0_50_331));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_350)) 
    rom_0_50_350 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[350]), .o_ld_data(acts_0_50_350));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_355)) 
    rom_0_50_355 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[355]), .o_ld_data(acts_0_50_355));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_356)) 
    rom_0_50_356 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[356]), .o_ld_data(acts_0_50_356));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_357)) 
    rom_0_50_357 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[357]), .o_ld_data(acts_0_50_357));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_358)) 
    rom_0_50_358 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[358]), .o_ld_data(acts_0_50_358));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_359)) 
    rom_0_50_359 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[359]), .o_ld_data(acts_0_50_359));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_378)) 
    rom_0_50_378 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[378]), .o_ld_data(acts_0_50_378));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_383)) 
    rom_0_50_383 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[383]), .o_ld_data(acts_0_50_383));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_433)) 
    rom_0_50_433 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[433]), .o_ld_data(acts_0_50_433));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_464)) 
    rom_0_50_464 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[464]), .o_ld_data(acts_0_50_464));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_491)) 
    rom_0_50_491 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[491]), .o_ld_data(acts_0_50_491));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_492)) 
    rom_0_50_492 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[492]), .o_ld_data(acts_0_50_492));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_497)) 
    rom_0_50_497 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[497]), .o_ld_data(acts_0_50_497));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_520)) 
    rom_0_50_520 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[520]), .o_ld_data(acts_0_50_520));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_523)) 
    rom_0_50_523 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[523]), .o_ld_data(acts_0_50_523));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_550)) 
    rom_0_50_550 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[550]), .o_ld_data(acts_0_50_550));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_633)) 
    rom_0_50_633 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[633]), .o_ld_data(acts_0_50_633));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_50_636)) 
    rom_0_50_636 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[636]), .o_ld_data(acts_0_50_636));

  // Stage 1
    assign s_0_50_1_0 = {{2{acts_0_50_216[5]}}, acts_0_50_216} + {{2{acts_0_50_217[5]}}, acts_0_50_217} + {{2{acts_0_50_218[5]}}, acts_0_50_218} + {{2{acts_0_50_219[5]}}, acts_0_50_219};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_0), .q(s_0_50_1_0_reg));

    assign s_0_50_1_1 = {{2{acts_0_50_244[5]}}, acts_0_50_244} + {{2{acts_0_50_263[5]}}, acts_0_50_263} + {{2{acts_0_50_269[5]}}, acts_0_50_269} + {{2{acts_0_50_270[5]}}, acts_0_50_270};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_1), .q(s_0_50_1_1_reg));

    assign s_0_50_1_2 = {{2{acts_0_50_322[5]}}, acts_0_50_322} + {{2{acts_0_50_328[5]}}, acts_0_50_328} + {{2{acts_0_50_331[5]}}, acts_0_50_331} + {{2{acts_0_50_350[5]}}, acts_0_50_350};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_2), .q(s_0_50_1_2_reg));

    assign s_0_50_1_3 = {{2{acts_0_50_355[5]}}, acts_0_50_355} + {{2{acts_0_50_356[5]}}, acts_0_50_356} + {{2{acts_0_50_357[5]}}, acts_0_50_357} + {{2{acts_0_50_358[5]}}, acts_0_50_358};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_3), .q(s_0_50_1_3_reg));

    assign s_0_50_1_4 = {{2{acts_0_50_359[5]}}, acts_0_50_359} + {{2{acts_0_50_378[5]}}, acts_0_50_378} + {{2{acts_0_50_383[5]}}, acts_0_50_383} + {{2{acts_0_50_433[5]}}, acts_0_50_433};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_4), .q(s_0_50_1_4_reg));

    assign s_0_50_1_5 = {{2{acts_0_50_464[5]}}, acts_0_50_464} + {{2{acts_0_50_491[5]}}, acts_0_50_491} + {{2{acts_0_50_492[5]}}, acts_0_50_492} + {{2{acts_0_50_497[5]}}, acts_0_50_497};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_5), .q(s_0_50_1_5_reg));

    assign s_0_50_1_6 = {{2{acts_0_50_520[5]}}, acts_0_50_520} + {{2{acts_0_50_523[5]}}, acts_0_50_523} + {{2{acts_0_50_550[5]}}, acts_0_50_550} + {{2{acts_0_50_633[5]}}, acts_0_50_633};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_6), .q(s_0_50_1_6_reg));

    assign s_0_50_1_7 = {{2{acts_0_50_636[5]}}, acts_0_50_636};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_7), .q(s_0_50_1_7_reg));

  // Stage 2
    assign s_0_50_2_0 = {{2{s_0_50_1_0_reg[7]}}, s_0_50_1_0_reg} + {{2{s_0_50_1_1_reg[7]}}, s_0_50_1_1_reg} + {{2{s_0_50_1_2_reg[7]}}, s_0_50_1_2_reg} + {{2{s_0_50_1_3_reg[7]}}, s_0_50_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_50_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_2_0), .q(s_0_50_2_0_reg));

    assign s_0_50_2_1 = {{2{s_0_50_1_4_reg[7]}}, s_0_50_1_4_reg} + {{2{s_0_50_1_5_reg[7]}}, s_0_50_1_5_reg} + {{2{s_0_50_1_6_reg[7]}}, s_0_50_1_6_reg} + {{2{s_0_50_1_7_reg[7]}}, s_0_50_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_50_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_2_1), .q(s_0_50_2_1_reg));

  // Stage 3
    assign s_0_50_3_0 = {{2{s_0_50_2_0_reg[9]}}, s_0_50_2_0_reg} + {{2{s_0_50_2_1_reg[9]}}, s_0_50_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_50_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_3_0), .q(s_0_50_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_50_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_50_3_0_reg[11]}}, s_0_50_3_0_reg}), .q(sum_0_50_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_50 (.i_data(sum_0_50_reg), .o_data(out_0_50_sat));


    // Layer 0, Node 51
      logic  [11:0] s_0_51_3_0;
    logic  [11:0] s_0_51_3_0_reg;
    logic  [7:0] s_0_51_1_0, s_0_51_1_1, s_0_51_1_2, s_0_51_1_3, s_0_51_1_4, s_0_51_1_5, s_0_51_1_6, s_0_51_1_7, s_0_51_1_8, s_0_51_1_9;
    logic  [7:0] s_0_51_1_0_reg, s_0_51_1_1_reg, s_0_51_1_2_reg, s_0_51_1_3_reg, s_0_51_1_4_reg, s_0_51_1_5_reg, s_0_51_1_6_reg, s_0_51_1_7_reg, s_0_51_1_8_reg, s_0_51_1_9_reg;
    logic  [9:0] s_0_51_2_0, s_0_51_2_1, s_0_51_2_2;
    logic  [9:0] s_0_51_2_0_reg, s_0_51_2_1_reg, s_0_51_2_2_reg;
    logic [13:0] sum_0_51;
    logic [13:0] sum_0_51_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_47)) 
    rom_0_51_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[47]), .o_ld_data(acts_0_51_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_48)) 
    rom_0_51_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[48]), .o_ld_data(acts_0_51_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_122)) 
    rom_0_51_122 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[122]), .o_ld_data(acts_0_51_122));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_123)) 
    rom_0_51_123 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[123]), .o_ld_data(acts_0_51_123));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_124)) 
    rom_0_51_124 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[124]), .o_ld_data(acts_0_51_124));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_149)) 
    rom_0_51_149 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[149]), .o_ld_data(acts_0_51_149));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_150)) 
    rom_0_51_150 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[150]), .o_ld_data(acts_0_51_150));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_151)) 
    rom_0_51_151 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[151]), .o_ld_data(acts_0_51_151));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_152)) 
    rom_0_51_152 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[152]), .o_ld_data(acts_0_51_152));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_153)) 
    rom_0_51_153 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[153]), .o_ld_data(acts_0_51_153));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_178)) 
    rom_0_51_178 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[178]), .o_ld_data(acts_0_51_178));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_180)) 
    rom_0_51_180 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[180]), .o_ld_data(acts_0_51_180));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_181)) 
    rom_0_51_181 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[181]), .o_ld_data(acts_0_51_181));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_239)) 
    rom_0_51_239 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[239]), .o_ld_data(acts_0_51_239));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_261)) 
    rom_0_51_261 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[261]), .o_ld_data(acts_0_51_261));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_262)) 
    rom_0_51_262 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[262]), .o_ld_data(acts_0_51_262));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_263)) 
    rom_0_51_263 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[263]), .o_ld_data(acts_0_51_263));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_264)) 
    rom_0_51_264 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[264]), .o_ld_data(acts_0_51_264));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_269)) 
    rom_0_51_269 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[269]), .o_ld_data(acts_0_51_269));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_287)) 
    rom_0_51_287 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[287]), .o_ld_data(acts_0_51_287));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_289)) 
    rom_0_51_289 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[289]), .o_ld_data(acts_0_51_289));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_290)) 
    rom_0_51_290 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[290]), .o_ld_data(acts_0_51_290));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_291)) 
    rom_0_51_291 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[291]), .o_ld_data(acts_0_51_291));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_297)) 
    rom_0_51_297 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[297]), .o_ld_data(acts_0_51_297));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_298)) 
    rom_0_51_298 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[298]), .o_ld_data(acts_0_51_298));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_314)) 
    rom_0_51_314 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[314]), .o_ld_data(acts_0_51_314));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_315)) 
    rom_0_51_315 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[315]), .o_ld_data(acts_0_51_315));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_316)) 
    rom_0_51_316 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[316]), .o_ld_data(acts_0_51_316));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_333)) 
    rom_0_51_333 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[333]), .o_ld_data(acts_0_51_333));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_341)) 
    rom_0_51_341 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[341]), .o_ld_data(acts_0_51_341));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_342)) 
    rom_0_51_342 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[342]), .o_ld_data(acts_0_51_342));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_351)) 
    rom_0_51_351 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[351]), .o_ld_data(acts_0_51_351));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_364)) 
    rom_0_51_364 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[364]), .o_ld_data(acts_0_51_364));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_417)) 
    rom_0_51_417 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[417]), .o_ld_data(acts_0_51_417));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_527)) 
    rom_0_51_527 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[527]), .o_ld_data(acts_0_51_527));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_629)) 
    rom_0_51_629 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[629]), .o_ld_data(acts_0_51_629));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_651)) 
    rom_0_51_651 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[651]), .o_ld_data(acts_0_51_651));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_51_743)) 
    rom_0_51_743 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[743]), .o_ld_data(acts_0_51_743));

  // Stage 1
    assign s_0_51_1_0 = {{2{acts_0_51_47[5]}}, acts_0_51_47} + {{2{acts_0_51_48[5]}}, acts_0_51_48} + {{2{acts_0_51_122[5]}}, acts_0_51_122} + {{2{acts_0_51_123[5]}}, acts_0_51_123};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_0), .q(s_0_51_1_0_reg));

    assign s_0_51_1_1 = {{2{acts_0_51_124[5]}}, acts_0_51_124} + {{2{acts_0_51_149[5]}}, acts_0_51_149} + {{2{acts_0_51_150[5]}}, acts_0_51_150} + {{2{acts_0_51_151[5]}}, acts_0_51_151};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_1), .q(s_0_51_1_1_reg));

    assign s_0_51_1_2 = {{2{acts_0_51_152[5]}}, acts_0_51_152} + {{2{acts_0_51_153[5]}}, acts_0_51_153} + {{2{acts_0_51_178[5]}}, acts_0_51_178} + {{2{acts_0_51_180[5]}}, acts_0_51_180};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_2), .q(s_0_51_1_2_reg));

    assign s_0_51_1_3 = {{2{acts_0_51_181[5]}}, acts_0_51_181} + {{2{acts_0_51_239[5]}}, acts_0_51_239} + {{2{acts_0_51_261[5]}}, acts_0_51_261} + {{2{acts_0_51_262[5]}}, acts_0_51_262};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_3), .q(s_0_51_1_3_reg));

    assign s_0_51_1_4 = {{2{acts_0_51_263[5]}}, acts_0_51_263} + {{2{acts_0_51_264[5]}}, acts_0_51_264} + {{2{acts_0_51_269[5]}}, acts_0_51_269} + {{2{acts_0_51_287[5]}}, acts_0_51_287};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_4), .q(s_0_51_1_4_reg));

    assign s_0_51_1_5 = {{2{acts_0_51_289[5]}}, acts_0_51_289} + {{2{acts_0_51_290[5]}}, acts_0_51_290} + {{2{acts_0_51_291[5]}}, acts_0_51_291} + {{2{acts_0_51_297[5]}}, acts_0_51_297};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_5), .q(s_0_51_1_5_reg));

    assign s_0_51_1_6 = {{2{acts_0_51_298[5]}}, acts_0_51_298} + {{2{acts_0_51_314[5]}}, acts_0_51_314} + {{2{acts_0_51_315[5]}}, acts_0_51_315} + {{2{acts_0_51_316[5]}}, acts_0_51_316};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_6), .q(s_0_51_1_6_reg));

    assign s_0_51_1_7 = {{2{acts_0_51_333[5]}}, acts_0_51_333} + {{2{acts_0_51_341[5]}}, acts_0_51_341} + {{2{acts_0_51_342[5]}}, acts_0_51_342} + {{2{acts_0_51_351[5]}}, acts_0_51_351};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_7), .q(s_0_51_1_7_reg));

    assign s_0_51_1_8 = {{2{acts_0_51_364[5]}}, acts_0_51_364} + {{2{acts_0_51_417[5]}}, acts_0_51_417} + {{2{acts_0_51_527[5]}}, acts_0_51_527} + {{2{acts_0_51_629[5]}}, acts_0_51_629};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_8), .q(s_0_51_1_8_reg));

    assign s_0_51_1_9 = {{2{acts_0_51_651[5]}}, acts_0_51_651} + {{2{acts_0_51_743[5]}}, acts_0_51_743};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_9), .q(s_0_51_1_9_reg));

  // Stage 2
    assign s_0_51_2_0 = {{2{s_0_51_1_0_reg[7]}}, s_0_51_1_0_reg} + {{2{s_0_51_1_1_reg[7]}}, s_0_51_1_1_reg} + {{2{s_0_51_1_2_reg[7]}}, s_0_51_1_2_reg} + {{2{s_0_51_1_3_reg[7]}}, s_0_51_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_51_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_2_0), .q(s_0_51_2_0_reg));

    assign s_0_51_2_1 = {{2{s_0_51_1_4_reg[7]}}, s_0_51_1_4_reg} + {{2{s_0_51_1_5_reg[7]}}, s_0_51_1_5_reg} + {{2{s_0_51_1_6_reg[7]}}, s_0_51_1_6_reg} + {{2{s_0_51_1_7_reg[7]}}, s_0_51_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_51_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_2_1), .q(s_0_51_2_1_reg));

    assign s_0_51_2_2 = {{2{s_0_51_1_8_reg[7]}}, s_0_51_1_8_reg} + {{2{s_0_51_1_9_reg[7]}}, s_0_51_1_9_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_51_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_2_2), .q(s_0_51_2_2_reg));

  // Stage 3
    assign s_0_51_3_0 = {{2{s_0_51_2_0_reg[9]}}, s_0_51_2_0_reg} + {{2{s_0_51_2_1_reg[9]}}, s_0_51_2_1_reg} + {{2{s_0_51_2_2_reg[9]}}, s_0_51_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_51_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_3_0), .q(s_0_51_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_51_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_51_3_0_reg[11]}}, s_0_51_3_0_reg}), .q(sum_0_51_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_51 (.i_data(sum_0_51_reg), .o_data(out_0_51_sat));


    // Layer 0, Node 52
      logic  [11:0] s_0_52_3_0;
    logic  [11:0] s_0_52_3_0_reg;
    logic  [7:0] s_0_52_1_0, s_0_52_1_1, s_0_52_1_2, s_0_52_1_3, s_0_52_1_4, s_0_52_1_5, s_0_52_1_6, s_0_52_1_7, s_0_52_1_8, s_0_52_1_9;
    logic  [7:0] s_0_52_1_0_reg, s_0_52_1_1_reg, s_0_52_1_2_reg, s_0_52_1_3_reg, s_0_52_1_4_reg, s_0_52_1_5_reg, s_0_52_1_6_reg, s_0_52_1_7_reg, s_0_52_1_8_reg, s_0_52_1_9_reg;
    logic  [9:0] s_0_52_2_0, s_0_52_2_1, s_0_52_2_2;
    logic  [9:0] s_0_52_2_0_reg, s_0_52_2_1_reg, s_0_52_2_2_reg;
    logic [13:0] sum_0_52;
    logic [13:0] sum_0_52_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_153)) 
    rom_0_52_153 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[153]), .o_ld_data(acts_0_52_153));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_178)) 
    rom_0_52_178 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[178]), .o_ld_data(acts_0_52_178));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_180)) 
    rom_0_52_180 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[180]), .o_ld_data(acts_0_52_180));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_208)) 
    rom_0_52_208 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[208]), .o_ld_data(acts_0_52_208));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_236)) 
    rom_0_52_236 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[236]), .o_ld_data(acts_0_52_236));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_239)) 
    rom_0_52_239 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[239]), .o_ld_data(acts_0_52_239));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_241)) 
    rom_0_52_241 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[241]), .o_ld_data(acts_0_52_241));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_264)) 
    rom_0_52_264 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[264]), .o_ld_data(acts_0_52_264));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_267)) 
    rom_0_52_267 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[267]), .o_ld_data(acts_0_52_267));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_269)) 
    rom_0_52_269 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[269]), .o_ld_data(acts_0_52_269));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_270)) 
    rom_0_52_270 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[270]), .o_ld_data(acts_0_52_270));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_296)) 
    rom_0_52_296 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[296]), .o_ld_data(acts_0_52_296));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_298)) 
    rom_0_52_298 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[298]), .o_ld_data(acts_0_52_298));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_300)) 
    rom_0_52_300 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[300]), .o_ld_data(acts_0_52_300));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_312)) 
    rom_0_52_312 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[312]), .o_ld_data(acts_0_52_312));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_323)) 
    rom_0_52_323 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[323]), .o_ld_data(acts_0_52_323));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_326)) 
    rom_0_52_326 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[326]), .o_ld_data(acts_0_52_326));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_328)) 
    rom_0_52_328 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[328]), .o_ld_data(acts_0_52_328));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_352)) 
    rom_0_52_352 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[352]), .o_ld_data(acts_0_52_352));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_382)) 
    rom_0_52_382 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[382]), .o_ld_data(acts_0_52_382));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_462)) 
    rom_0_52_462 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[462]), .o_ld_data(acts_0_52_462));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_487)) 
    rom_0_52_487 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[487]), .o_ld_data(acts_0_52_487));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_509)) 
    rom_0_52_509 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[509]), .o_ld_data(acts_0_52_509));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_510)) 
    rom_0_52_510 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[510]), .o_ld_data(acts_0_52_510));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_519)) 
    rom_0_52_519 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[519]), .o_ld_data(acts_0_52_519));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_537)) 
    rom_0_52_537 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[537]), .o_ld_data(acts_0_52_537));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_538)) 
    rom_0_52_538 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[538]), .o_ld_data(acts_0_52_538));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_546)) 
    rom_0_52_546 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[546]), .o_ld_data(acts_0_52_546));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_547)) 
    rom_0_52_547 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[547]), .o_ld_data(acts_0_52_547));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_548)) 
    rom_0_52_548 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[548]), .o_ld_data(acts_0_52_548));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_555)) 
    rom_0_52_555 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[555]), .o_ld_data(acts_0_52_555));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_569)) 
    rom_0_52_569 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[569]), .o_ld_data(acts_0_52_569));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_575)) 
    rom_0_52_575 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[575]), .o_ld_data(acts_0_52_575));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_605)) 
    rom_0_52_605 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[605]), .o_ld_data(acts_0_52_605));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_606)) 
    rom_0_52_606 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[606]), .o_ld_data(acts_0_52_606));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_607)) 
    rom_0_52_607 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[607]), .o_ld_data(acts_0_52_607));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_52_708)) 
    rom_0_52_708 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[708]), .o_ld_data(acts_0_52_708));

  // Stage 1
    assign s_0_52_1_0 = {{2{acts_0_52_153[5]}}, acts_0_52_153} + {{2{acts_0_52_178[5]}}, acts_0_52_178} + {{2{acts_0_52_180[5]}}, acts_0_52_180} + {{2{acts_0_52_208[5]}}, acts_0_52_208};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_0), .q(s_0_52_1_0_reg));

    assign s_0_52_1_1 = {{2{acts_0_52_236[5]}}, acts_0_52_236} + {{2{acts_0_52_239[5]}}, acts_0_52_239} + {{2{acts_0_52_241[5]}}, acts_0_52_241} + {{2{acts_0_52_264[5]}}, acts_0_52_264};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_1), .q(s_0_52_1_1_reg));

    assign s_0_52_1_2 = {{2{acts_0_52_267[5]}}, acts_0_52_267} + {{2{acts_0_52_269[5]}}, acts_0_52_269} + {{2{acts_0_52_270[5]}}, acts_0_52_270} + {{2{acts_0_52_296[5]}}, acts_0_52_296};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_2), .q(s_0_52_1_2_reg));

    assign s_0_52_1_3 = {{2{acts_0_52_298[5]}}, acts_0_52_298} + {{2{acts_0_52_300[5]}}, acts_0_52_300} + {{2{acts_0_52_312[5]}}, acts_0_52_312} + {{2{acts_0_52_323[5]}}, acts_0_52_323};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_3), .q(s_0_52_1_3_reg));

    assign s_0_52_1_4 = {{2{acts_0_52_326[5]}}, acts_0_52_326} + {{2{acts_0_52_328[5]}}, acts_0_52_328} + {{2{acts_0_52_352[5]}}, acts_0_52_352} + {{2{acts_0_52_382[5]}}, acts_0_52_382};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_4), .q(s_0_52_1_4_reg));

    assign s_0_52_1_5 = {{2{acts_0_52_462[5]}}, acts_0_52_462} + {{2{acts_0_52_487[5]}}, acts_0_52_487} + {{2{acts_0_52_509[5]}}, acts_0_52_509} + {{2{acts_0_52_510[5]}}, acts_0_52_510};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_5), .q(s_0_52_1_5_reg));

    assign s_0_52_1_6 = {{2{acts_0_52_519[5]}}, acts_0_52_519} + {{2{acts_0_52_537[5]}}, acts_0_52_537} + {{2{acts_0_52_538[5]}}, acts_0_52_538} + {{2{acts_0_52_546[5]}}, acts_0_52_546};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_6), .q(s_0_52_1_6_reg));

    assign s_0_52_1_7 = {{2{acts_0_52_547[5]}}, acts_0_52_547} + {{2{acts_0_52_548[5]}}, acts_0_52_548} + {{2{acts_0_52_555[5]}}, acts_0_52_555} + {{2{acts_0_52_569[5]}}, acts_0_52_569};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_7), .q(s_0_52_1_7_reg));

    assign s_0_52_1_8 = {{2{acts_0_52_575[5]}}, acts_0_52_575} + {{2{acts_0_52_605[5]}}, acts_0_52_605} + {{2{acts_0_52_606[5]}}, acts_0_52_606} + {{2{acts_0_52_607[5]}}, acts_0_52_607};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_8), .q(s_0_52_1_8_reg));

    assign s_0_52_1_9 = {{2{acts_0_52_708[5]}}, acts_0_52_708};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_9), .q(s_0_52_1_9_reg));

  // Stage 2
    assign s_0_52_2_0 = {{2{s_0_52_1_0_reg[7]}}, s_0_52_1_0_reg} + {{2{s_0_52_1_1_reg[7]}}, s_0_52_1_1_reg} + {{2{s_0_52_1_2_reg[7]}}, s_0_52_1_2_reg} + {{2{s_0_52_1_3_reg[7]}}, s_0_52_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_52_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_2_0), .q(s_0_52_2_0_reg));

    assign s_0_52_2_1 = {{2{s_0_52_1_4_reg[7]}}, s_0_52_1_4_reg} + {{2{s_0_52_1_5_reg[7]}}, s_0_52_1_5_reg} + {{2{s_0_52_1_6_reg[7]}}, s_0_52_1_6_reg} + {{2{s_0_52_1_7_reg[7]}}, s_0_52_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_52_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_2_1), .q(s_0_52_2_1_reg));

    assign s_0_52_2_2 = {{2{s_0_52_1_8_reg[7]}}, s_0_52_1_8_reg} + {{2{s_0_52_1_9_reg[7]}}, s_0_52_1_9_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_52_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_2_2), .q(s_0_52_2_2_reg));

  // Stage 3
    assign s_0_52_3_0 = {{2{s_0_52_2_0_reg[9]}}, s_0_52_2_0_reg} + {{2{s_0_52_2_1_reg[9]}}, s_0_52_2_1_reg} + {{2{s_0_52_2_2_reg[9]}}, s_0_52_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_52_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_3_0), .q(s_0_52_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_52_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_52_3_0_reg[11]}}, s_0_52_3_0_reg}), .q(sum_0_52_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_52 (.i_data(sum_0_52_reg), .o_data(out_0_52_sat));


    // Layer 0, Node 53
      logic  [11:0] s_0_53_3_0;
    logic  [11:0] s_0_53_3_0_reg;
    logic  [7:0] s_0_53_1_0, s_0_53_1_1, s_0_53_1_2, s_0_53_1_3, s_0_53_1_4, s_0_53_1_5, s_0_53_1_6, s_0_53_1_7;
    logic  [7:0] s_0_53_1_0_reg, s_0_53_1_1_reg, s_0_53_1_2_reg, s_0_53_1_3_reg, s_0_53_1_4_reg, s_0_53_1_5_reg, s_0_53_1_6_reg, s_0_53_1_7_reg;
    logic  [9:0] s_0_53_2_0, s_0_53_2_1;
    logic  [9:0] s_0_53_2_0_reg, s_0_53_2_1_reg;
    logic [13:0] sum_0_53;
    logic [13:0] sum_0_53_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_16)) 
    rom_0_53_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_53_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_45)) 
    rom_0_53_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[45]), .o_ld_data(acts_0_53_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_48)) 
    rom_0_53_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[48]), .o_ld_data(acts_0_53_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_51)) 
    rom_0_53_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[51]), .o_ld_data(acts_0_53_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_141)) 
    rom_0_53_141 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[141]), .o_ld_data(acts_0_53_141));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_146)) 
    rom_0_53_146 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[146]), .o_ld_data(acts_0_53_146));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_228)) 
    rom_0_53_228 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[228]), .o_ld_data(acts_0_53_228));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_251)) 
    rom_0_53_251 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[251]), .o_ld_data(acts_0_53_251));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_296)) 
    rom_0_53_296 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[296]), .o_ld_data(acts_0_53_296));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_325)) 
    rom_0_53_325 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[325]), .o_ld_data(acts_0_53_325));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_328)) 
    rom_0_53_328 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[328]), .o_ld_data(acts_0_53_328));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_358)) 
    rom_0_53_358 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[358]), .o_ld_data(acts_0_53_358));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_363)) 
    rom_0_53_363 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[363]), .o_ld_data(acts_0_53_363));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_397)) 
    rom_0_53_397 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[397]), .o_ld_data(acts_0_53_397));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_423)) 
    rom_0_53_423 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[423]), .o_ld_data(acts_0_53_423));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_449)) 
    rom_0_53_449 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[449]), .o_ld_data(acts_0_53_449));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_458)) 
    rom_0_53_458 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[458]), .o_ld_data(acts_0_53_458));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_460)) 
    rom_0_53_460 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[460]), .o_ld_data(acts_0_53_460));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_486)) 
    rom_0_53_486 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[486]), .o_ld_data(acts_0_53_486));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_487)) 
    rom_0_53_487 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[487]), .o_ld_data(acts_0_53_487));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_503)) 
    rom_0_53_503 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[503]), .o_ld_data(acts_0_53_503));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_516)) 
    rom_0_53_516 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[516]), .o_ld_data(acts_0_53_516));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_517)) 
    rom_0_53_517 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[517]), .o_ld_data(acts_0_53_517));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_531)) 
    rom_0_53_531 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[531]), .o_ld_data(acts_0_53_531));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_563)) 
    rom_0_53_563 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[563]), .o_ld_data(acts_0_53_563));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_592)) 
    rom_0_53_592 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[592]), .o_ld_data(acts_0_53_592));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_639)) 
    rom_0_53_639 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[639]), .o_ld_data(acts_0_53_639));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_756)) 
    rom_0_53_756 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[756]), .o_ld_data(acts_0_53_756));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_780)) 
    rom_0_53_780 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[780]), .o_ld_data(acts_0_53_780));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_782)) 
    rom_0_53_782 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[782]), .o_ld_data(acts_0_53_782));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_53_783)) 
    rom_0_53_783 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[783]), .o_ld_data(acts_0_53_783));

  // Stage 1
    assign s_0_53_1_0 = {{2{acts_0_53_16[5]}}, acts_0_53_16} + {{2{acts_0_53_45[5]}}, acts_0_53_45} + {{2{acts_0_53_48[5]}}, acts_0_53_48} + {{2{acts_0_53_51[5]}}, acts_0_53_51};
    registers #(.ARRAY_WIDTH(8)) r_0_53_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_1_0), .q(s_0_53_1_0_reg));

    assign s_0_53_1_1 = {{2{acts_0_53_141[5]}}, acts_0_53_141} + {{2{acts_0_53_146[5]}}, acts_0_53_146} + {{2{acts_0_53_228[5]}}, acts_0_53_228} + {{2{acts_0_53_251[5]}}, acts_0_53_251};
    registers #(.ARRAY_WIDTH(8)) r_0_53_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_1_1), .q(s_0_53_1_1_reg));

    assign s_0_53_1_2 = {{2{acts_0_53_296[5]}}, acts_0_53_296} + {{2{acts_0_53_325[5]}}, acts_0_53_325} + {{2{acts_0_53_328[5]}}, acts_0_53_328} + {{2{acts_0_53_358[5]}}, acts_0_53_358};
    registers #(.ARRAY_WIDTH(8)) r_0_53_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_1_2), .q(s_0_53_1_2_reg));

    assign s_0_53_1_3 = {{2{acts_0_53_363[5]}}, acts_0_53_363} + {{2{acts_0_53_397[5]}}, acts_0_53_397} + {{2{acts_0_53_423[5]}}, acts_0_53_423} + {{2{acts_0_53_449[5]}}, acts_0_53_449};
    registers #(.ARRAY_WIDTH(8)) r_0_53_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_1_3), .q(s_0_53_1_3_reg));

    assign s_0_53_1_4 = {{2{acts_0_53_458[5]}}, acts_0_53_458} + {{2{acts_0_53_460[5]}}, acts_0_53_460} + {{2{acts_0_53_486[5]}}, acts_0_53_486} + {{2{acts_0_53_487[5]}}, acts_0_53_487};
    registers #(.ARRAY_WIDTH(8)) r_0_53_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_1_4), .q(s_0_53_1_4_reg));

    assign s_0_53_1_5 = {{2{acts_0_53_503[5]}}, acts_0_53_503} + {{2{acts_0_53_516[5]}}, acts_0_53_516} + {{2{acts_0_53_517[5]}}, acts_0_53_517} + {{2{acts_0_53_531[5]}}, acts_0_53_531};
    registers #(.ARRAY_WIDTH(8)) r_0_53_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_1_5), .q(s_0_53_1_5_reg));

    assign s_0_53_1_6 = {{2{acts_0_53_563[5]}}, acts_0_53_563} + {{2{acts_0_53_592[5]}}, acts_0_53_592} + {{2{acts_0_53_639[5]}}, acts_0_53_639} + {{2{acts_0_53_756[5]}}, acts_0_53_756};
    registers #(.ARRAY_WIDTH(8)) r_0_53_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_1_6), .q(s_0_53_1_6_reg));

    assign s_0_53_1_7 = {{2{acts_0_53_780[5]}}, acts_0_53_780} + {{2{acts_0_53_782[5]}}, acts_0_53_782} + {{2{acts_0_53_783[5]}}, acts_0_53_783};
    registers #(.ARRAY_WIDTH(8)) r_0_53_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_1_7), .q(s_0_53_1_7_reg));

  // Stage 2
    assign s_0_53_2_0 = {{2{s_0_53_1_0_reg[7]}}, s_0_53_1_0_reg} + {{2{s_0_53_1_1_reg[7]}}, s_0_53_1_1_reg} + {{2{s_0_53_1_2_reg[7]}}, s_0_53_1_2_reg} + {{2{s_0_53_1_3_reg[7]}}, s_0_53_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_53_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_2_0), .q(s_0_53_2_0_reg));

    assign s_0_53_2_1 = {{2{s_0_53_1_4_reg[7]}}, s_0_53_1_4_reg} + {{2{s_0_53_1_5_reg[7]}}, s_0_53_1_5_reg} + {{2{s_0_53_1_6_reg[7]}}, s_0_53_1_6_reg} + {{2{s_0_53_1_7_reg[7]}}, s_0_53_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_53_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_2_1), .q(s_0_53_2_1_reg));

  // Stage 3
    assign s_0_53_3_0 = {{2{s_0_53_2_0_reg[9]}}, s_0_53_2_0_reg} + {{2{s_0_53_2_1_reg[9]}}, s_0_53_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_53_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_3_0), .q(s_0_53_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_53_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_53_3_0_reg[11]}}, s_0_53_3_0_reg}), .q(sum_0_53_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_53 (.i_data(sum_0_53_reg), .o_data(out_0_53_sat));


    // Layer 0, Node 54
      logic  [11:0] s_0_54_3_0;
    logic  [11:0] s_0_54_3_0_reg;
    logic  [7:0] s_0_54_1_0, s_0_54_1_1, s_0_54_1_2, s_0_54_1_3, s_0_54_1_4, s_0_54_1_5, s_0_54_1_6, s_0_54_1_7;
    logic  [7:0] s_0_54_1_0_reg, s_0_54_1_1_reg, s_0_54_1_2_reg, s_0_54_1_3_reg, s_0_54_1_4_reg, s_0_54_1_5_reg, s_0_54_1_6_reg, s_0_54_1_7_reg;
    logic  [9:0] s_0_54_2_0, s_0_54_2_1;
    logic  [9:0] s_0_54_2_0_reg, s_0_54_2_1_reg;
    logic [13:0] sum_0_54;
    logic [13:0] sum_0_54_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_41)) 
    rom_0_54_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[41]), .o_ld_data(acts_0_54_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_152)) 
    rom_0_54_152 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[152]), .o_ld_data(acts_0_54_152));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_191)) 
    rom_0_54_191 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[191]), .o_ld_data(acts_0_54_191));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_285)) 
    rom_0_54_285 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[285]), .o_ld_data(acts_0_54_285));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_322)) 
    rom_0_54_322 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[322]), .o_ld_data(acts_0_54_322));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_350)) 
    rom_0_54_350 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[350]), .o_ld_data(acts_0_54_350));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_353)) 
    rom_0_54_353 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[353]), .o_ld_data(acts_0_54_353));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_380)) 
    rom_0_54_380 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[380]), .o_ld_data(acts_0_54_380));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_407)) 
    rom_0_54_407 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[407]), .o_ld_data(acts_0_54_407));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_408)) 
    rom_0_54_408 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[408]), .o_ld_data(acts_0_54_408));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_426)) 
    rom_0_54_426 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[426]), .o_ld_data(acts_0_54_426));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_427)) 
    rom_0_54_427 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[427]), .o_ld_data(acts_0_54_427));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_454)) 
    rom_0_54_454 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[454]), .o_ld_data(acts_0_54_454));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_455)) 
    rom_0_54_455 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[455]), .o_ld_data(acts_0_54_455));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_456)) 
    rom_0_54_456 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[456]), .o_ld_data(acts_0_54_456));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_457)) 
    rom_0_54_457 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[457]), .o_ld_data(acts_0_54_457));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_483)) 
    rom_0_54_483 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[483]), .o_ld_data(acts_0_54_483));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_484)) 
    rom_0_54_484 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[484]), .o_ld_data(acts_0_54_484));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_485)) 
    rom_0_54_485 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[485]), .o_ld_data(acts_0_54_485));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_486)) 
    rom_0_54_486 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[486]), .o_ld_data(acts_0_54_486));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_487)) 
    rom_0_54_487 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[487]), .o_ld_data(acts_0_54_487));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_488)) 
    rom_0_54_488 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[488]), .o_ld_data(acts_0_54_488));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_507)) 
    rom_0_54_507 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[507]), .o_ld_data(acts_0_54_507));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_514)) 
    rom_0_54_514 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[514]), .o_ld_data(acts_0_54_514));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_515)) 
    rom_0_54_515 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[515]), .o_ld_data(acts_0_54_515));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_516)) 
    rom_0_54_516 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[516]), .o_ld_data(acts_0_54_516));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_567)) 
    rom_0_54_567 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[567]), .o_ld_data(acts_0_54_567));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_602)) 
    rom_0_54_602 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[602]), .o_ld_data(acts_0_54_602));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_604)) 
    rom_0_54_604 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[604]), .o_ld_data(acts_0_54_604));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_54_701)) 
    rom_0_54_701 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[701]), .o_ld_data(acts_0_54_701));

  // Stage 1
    assign s_0_54_1_0 = {{2{acts_0_54_41[5]}}, acts_0_54_41} + {{2{acts_0_54_152[5]}}, acts_0_54_152} + {{2{acts_0_54_191[5]}}, acts_0_54_191} + {{2{acts_0_54_285[5]}}, acts_0_54_285};
    registers #(.ARRAY_WIDTH(8)) r_0_54_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_1_0), .q(s_0_54_1_0_reg));

    assign s_0_54_1_1 = {{2{acts_0_54_322[5]}}, acts_0_54_322} + {{2{acts_0_54_350[5]}}, acts_0_54_350} + {{2{acts_0_54_353[5]}}, acts_0_54_353} + {{2{acts_0_54_380[5]}}, acts_0_54_380};
    registers #(.ARRAY_WIDTH(8)) r_0_54_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_1_1), .q(s_0_54_1_1_reg));

    assign s_0_54_1_2 = {{2{acts_0_54_407[5]}}, acts_0_54_407} + {{2{acts_0_54_408[5]}}, acts_0_54_408} + {{2{acts_0_54_426[5]}}, acts_0_54_426} + {{2{acts_0_54_427[5]}}, acts_0_54_427};
    registers #(.ARRAY_WIDTH(8)) r_0_54_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_1_2), .q(s_0_54_1_2_reg));

    assign s_0_54_1_3 = {{2{acts_0_54_454[5]}}, acts_0_54_454} + {{2{acts_0_54_455[5]}}, acts_0_54_455} + {{2{acts_0_54_456[5]}}, acts_0_54_456} + {{2{acts_0_54_457[5]}}, acts_0_54_457};
    registers #(.ARRAY_WIDTH(8)) r_0_54_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_1_3), .q(s_0_54_1_3_reg));

    assign s_0_54_1_4 = {{2{acts_0_54_483[5]}}, acts_0_54_483} + {{2{acts_0_54_484[5]}}, acts_0_54_484} + {{2{acts_0_54_485[5]}}, acts_0_54_485} + {{2{acts_0_54_486[5]}}, acts_0_54_486};
    registers #(.ARRAY_WIDTH(8)) r_0_54_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_1_4), .q(s_0_54_1_4_reg));

    assign s_0_54_1_5 = {{2{acts_0_54_487[5]}}, acts_0_54_487} + {{2{acts_0_54_488[5]}}, acts_0_54_488} + {{2{acts_0_54_507[5]}}, acts_0_54_507} + {{2{acts_0_54_514[5]}}, acts_0_54_514};
    registers #(.ARRAY_WIDTH(8)) r_0_54_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_1_5), .q(s_0_54_1_5_reg));

    assign s_0_54_1_6 = {{2{acts_0_54_515[5]}}, acts_0_54_515} + {{2{acts_0_54_516[5]}}, acts_0_54_516} + {{2{acts_0_54_567[5]}}, acts_0_54_567} + {{2{acts_0_54_602[5]}}, acts_0_54_602};
    registers #(.ARRAY_WIDTH(8)) r_0_54_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_1_6), .q(s_0_54_1_6_reg));

    assign s_0_54_1_7 = {{2{acts_0_54_604[5]}}, acts_0_54_604} + {{2{acts_0_54_701[5]}}, acts_0_54_701};
    registers #(.ARRAY_WIDTH(8)) r_0_54_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_1_7), .q(s_0_54_1_7_reg));

  // Stage 2
    assign s_0_54_2_0 = {{2{s_0_54_1_0_reg[7]}}, s_0_54_1_0_reg} + {{2{s_0_54_1_1_reg[7]}}, s_0_54_1_1_reg} + {{2{s_0_54_1_2_reg[7]}}, s_0_54_1_2_reg} + {{2{s_0_54_1_3_reg[7]}}, s_0_54_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_54_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_2_0), .q(s_0_54_2_0_reg));

    assign s_0_54_2_1 = {{2{s_0_54_1_4_reg[7]}}, s_0_54_1_4_reg} + {{2{s_0_54_1_5_reg[7]}}, s_0_54_1_5_reg} + {{2{s_0_54_1_6_reg[7]}}, s_0_54_1_6_reg} + {{2{s_0_54_1_7_reg[7]}}, s_0_54_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_54_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_2_1), .q(s_0_54_2_1_reg));

  // Stage 3
    assign s_0_54_3_0 = {{2{s_0_54_2_0_reg[9]}}, s_0_54_2_0_reg} + {{2{s_0_54_2_1_reg[9]}}, s_0_54_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_54_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_3_0), .q(s_0_54_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_54_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_54_3_0_reg[11]}}, s_0_54_3_0_reg}), .q(sum_0_54_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_54 (.i_data(sum_0_54_reg), .o_data(out_0_54_sat));


    // Layer 0, Node 55
      logic  [11:0] s_0_55_3_0;
    logic  [11:0] s_0_55_3_0_reg;
    logic  [7:0] s_0_55_1_0, s_0_55_1_1, s_0_55_1_2, s_0_55_1_3, s_0_55_1_4, s_0_55_1_5, s_0_55_1_6, s_0_55_1_7, s_0_55_1_8, s_0_55_1_9, s_0_55_1_10;
    logic  [7:0] s_0_55_1_0_reg, s_0_55_1_1_reg, s_0_55_1_2_reg, s_0_55_1_3_reg, s_0_55_1_4_reg, s_0_55_1_5_reg, s_0_55_1_6_reg, s_0_55_1_7_reg, s_0_55_1_8_reg, s_0_55_1_9_reg, s_0_55_1_10_reg;
    logic  [9:0] s_0_55_2_0, s_0_55_2_1, s_0_55_2_2;
    logic  [9:0] s_0_55_2_0_reg, s_0_55_2_1_reg, s_0_55_2_2_reg;
    logic [13:0] sum_0_55;
    logic [13:0] sum_0_55_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_126)) 
    rom_0_55_126 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[126]), .o_ld_data(acts_0_55_126));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_149)) 
    rom_0_55_149 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[149]), .o_ld_data(acts_0_55_149));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_155)) 
    rom_0_55_155 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[155]), .o_ld_data(acts_0_55_155));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_156)) 
    rom_0_55_156 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[156]), .o_ld_data(acts_0_55_156));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_175)) 
    rom_0_55_175 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[175]), .o_ld_data(acts_0_55_175));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_176)) 
    rom_0_55_176 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[176]), .o_ld_data(acts_0_55_176));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_207)) 
    rom_0_55_207 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[207]), .o_ld_data(acts_0_55_207));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_212)) 
    rom_0_55_212 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[212]), .o_ld_data(acts_0_55_212));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_242)) 
    rom_0_55_242 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[242]), .o_ld_data(acts_0_55_242));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_275)) 
    rom_0_55_275 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[275]), .o_ld_data(acts_0_55_275));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_315)) 
    rom_0_55_315 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[315]), .o_ld_data(acts_0_55_315));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_330)) 
    rom_0_55_330 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[330]), .o_ld_data(acts_0_55_330));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_342)) 
    rom_0_55_342 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[342]), .o_ld_data(acts_0_55_342));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_343)) 
    rom_0_55_343 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[343]), .o_ld_data(acts_0_55_343));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_345)) 
    rom_0_55_345 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[345]), .o_ld_data(acts_0_55_345));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_350)) 
    rom_0_55_350 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[350]), .o_ld_data(acts_0_55_350));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_354)) 
    rom_0_55_354 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[354]), .o_ld_data(acts_0_55_354));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_356)) 
    rom_0_55_356 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[356]), .o_ld_data(acts_0_55_356));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_369)) 
    rom_0_55_369 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[369]), .o_ld_data(acts_0_55_369));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_371)) 
    rom_0_55_371 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[371]), .o_ld_data(acts_0_55_371));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_373)) 
    rom_0_55_373 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[373]), .o_ld_data(acts_0_55_373));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_374)) 
    rom_0_55_374 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[374]), .o_ld_data(acts_0_55_374));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_377)) 
    rom_0_55_377 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[377]), .o_ld_data(acts_0_55_377));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_378)) 
    rom_0_55_378 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[378]), .o_ld_data(acts_0_55_378));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_406)) 
    rom_0_55_406 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[406]), .o_ld_data(acts_0_55_406));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_433)) 
    rom_0_55_433 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[433]), .o_ld_data(acts_0_55_433));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_434)) 
    rom_0_55_434 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[434]), .o_ld_data(acts_0_55_434));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_466)) 
    rom_0_55_466 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[466]), .o_ld_data(acts_0_55_466));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_467)) 
    rom_0_55_467 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[467]), .o_ld_data(acts_0_55_467));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_469)) 
    rom_0_55_469 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[469]), .o_ld_data(acts_0_55_469));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_495)) 
    rom_0_55_495 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[495]), .o_ld_data(acts_0_55_495));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_498)) 
    rom_0_55_498 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[498]), .o_ld_data(acts_0_55_498));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_519)) 
    rom_0_55_519 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[519]), .o_ld_data(acts_0_55_519));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_525)) 
    rom_0_55_525 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[525]), .o_ld_data(acts_0_55_525));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_544)) 
    rom_0_55_544 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[544]), .o_ld_data(acts_0_55_544));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_566)) 
    rom_0_55_566 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[566]), .o_ld_data(acts_0_55_566));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_575)) 
    rom_0_55_575 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[575]), .o_ld_data(acts_0_55_575));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_576)) 
    rom_0_55_576 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[576]), .o_ld_data(acts_0_55_576));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_628)) 
    rom_0_55_628 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[628]), .o_ld_data(acts_0_55_628));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_633)) 
    rom_0_55_633 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[633]), .o_ld_data(acts_0_55_633));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_55_656)) 
    rom_0_55_656 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[656]), .o_ld_data(acts_0_55_656));

  // Stage 1
    assign s_0_55_1_0 = {{2{acts_0_55_126[5]}}, acts_0_55_126} + {{2{acts_0_55_149[5]}}, acts_0_55_149} + {{2{acts_0_55_155[5]}}, acts_0_55_155} + {{2{acts_0_55_156[5]}}, acts_0_55_156};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_0), .q(s_0_55_1_0_reg));

    assign s_0_55_1_1 = {{2{acts_0_55_175[5]}}, acts_0_55_175} + {{2{acts_0_55_176[5]}}, acts_0_55_176} + {{2{acts_0_55_207[5]}}, acts_0_55_207} + {{2{acts_0_55_212[5]}}, acts_0_55_212};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_1), .q(s_0_55_1_1_reg));

    assign s_0_55_1_2 = {{2{acts_0_55_242[5]}}, acts_0_55_242} + {{2{acts_0_55_275[5]}}, acts_0_55_275} + {{2{acts_0_55_315[5]}}, acts_0_55_315} + {{2{acts_0_55_330[5]}}, acts_0_55_330};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_2), .q(s_0_55_1_2_reg));

    assign s_0_55_1_3 = {{2{acts_0_55_342[5]}}, acts_0_55_342} + {{2{acts_0_55_343[5]}}, acts_0_55_343} + {{2{acts_0_55_345[5]}}, acts_0_55_345} + {{2{acts_0_55_350[5]}}, acts_0_55_350};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_3), .q(s_0_55_1_3_reg));

    assign s_0_55_1_4 = {{2{acts_0_55_354[5]}}, acts_0_55_354} + {{2{acts_0_55_356[5]}}, acts_0_55_356} + {{2{acts_0_55_369[5]}}, acts_0_55_369} + {{2{acts_0_55_371[5]}}, acts_0_55_371};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_4), .q(s_0_55_1_4_reg));

    assign s_0_55_1_5 = {{2{acts_0_55_373[5]}}, acts_0_55_373} + {{2{acts_0_55_374[5]}}, acts_0_55_374} + {{2{acts_0_55_377[5]}}, acts_0_55_377} + {{2{acts_0_55_378[5]}}, acts_0_55_378};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_5), .q(s_0_55_1_5_reg));

    assign s_0_55_1_6 = {{2{acts_0_55_406[5]}}, acts_0_55_406} + {{2{acts_0_55_433[5]}}, acts_0_55_433} + {{2{acts_0_55_434[5]}}, acts_0_55_434} + {{2{acts_0_55_466[5]}}, acts_0_55_466};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_6), .q(s_0_55_1_6_reg));

    assign s_0_55_1_7 = {{2{acts_0_55_467[5]}}, acts_0_55_467} + {{2{acts_0_55_469[5]}}, acts_0_55_469} + {{2{acts_0_55_495[5]}}, acts_0_55_495} + {{2{acts_0_55_498[5]}}, acts_0_55_498};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_7), .q(s_0_55_1_7_reg));

    assign s_0_55_1_8 = {{2{acts_0_55_519[5]}}, acts_0_55_519} + {{2{acts_0_55_525[5]}}, acts_0_55_525} + {{2{acts_0_55_544[5]}}, acts_0_55_544} + {{2{acts_0_55_566[5]}}, acts_0_55_566};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_8), .q(s_0_55_1_8_reg));

    assign s_0_55_1_9 = {{2{acts_0_55_575[5]}}, acts_0_55_575} + {{2{acts_0_55_576[5]}}, acts_0_55_576} + {{2{acts_0_55_628[5]}}, acts_0_55_628} + {{2{acts_0_55_633[5]}}, acts_0_55_633};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_9), .q(s_0_55_1_9_reg));

    assign s_0_55_1_10 = {{2{acts_0_55_656[5]}}, acts_0_55_656};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_10), .q(s_0_55_1_10_reg));

  // Stage 2
    assign s_0_55_2_0 = {{2{s_0_55_1_0_reg[7]}}, s_0_55_1_0_reg} + {{2{s_0_55_1_1_reg[7]}}, s_0_55_1_1_reg} + {{2{s_0_55_1_2_reg[7]}}, s_0_55_1_2_reg} + {{2{s_0_55_1_3_reg[7]}}, s_0_55_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_55_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_2_0), .q(s_0_55_2_0_reg));

    assign s_0_55_2_1 = {{2{s_0_55_1_4_reg[7]}}, s_0_55_1_4_reg} + {{2{s_0_55_1_5_reg[7]}}, s_0_55_1_5_reg} + {{2{s_0_55_1_6_reg[7]}}, s_0_55_1_6_reg} + {{2{s_0_55_1_7_reg[7]}}, s_0_55_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_55_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_2_1), .q(s_0_55_2_1_reg));

    assign s_0_55_2_2 = {{2{s_0_55_1_8_reg[7]}}, s_0_55_1_8_reg} + {{2{s_0_55_1_9_reg[7]}}, s_0_55_1_9_reg} + {{2{s_0_55_1_10_reg[7]}}, s_0_55_1_10_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_55_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_2_2), .q(s_0_55_2_2_reg));

  // Stage 3
    assign s_0_55_3_0 = {{2{s_0_55_2_0_reg[9]}}, s_0_55_2_0_reg} + {{2{s_0_55_2_1_reg[9]}}, s_0_55_2_1_reg} + {{2{s_0_55_2_2_reg[9]}}, s_0_55_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_55_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_3_0), .q(s_0_55_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_55_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_55_3_0_reg[11]}}, s_0_55_3_0_reg}), .q(sum_0_55_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_55 (.i_data(sum_0_55_reg), .o_data(out_0_55_sat));


    // Layer 0, Node 56
      logic  [11:0] s_0_56_3_0;
    logic  [11:0] s_0_56_3_0_reg;
    logic  [7:0] s_0_56_1_0, s_0_56_1_1, s_0_56_1_2, s_0_56_1_3, s_0_56_1_4, s_0_56_1_5;
    logic  [7:0] s_0_56_1_0_reg, s_0_56_1_1_reg, s_0_56_1_2_reg, s_0_56_1_3_reg, s_0_56_1_4_reg, s_0_56_1_5_reg;
    logic  [9:0] s_0_56_2_0, s_0_56_2_1;
    logic  [9:0] s_0_56_2_0_reg, s_0_56_2_1_reg;
    logic [13:0] sum_0_56;
    logic [13:0] sum_0_56_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_348)) 
    rom_0_56_348 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[348]), .o_ld_data(acts_0_56_348));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_457)) 
    rom_0_56_457 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[457]), .o_ld_data(acts_0_56_457));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_458)) 
    rom_0_56_458 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[458]), .o_ld_data(acts_0_56_458));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_460)) 
    rom_0_56_460 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[460]), .o_ld_data(acts_0_56_460));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_462)) 
    rom_0_56_462 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[462]), .o_ld_data(acts_0_56_462));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_489)) 
    rom_0_56_489 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[489]), .o_ld_data(acts_0_56_489));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_509)) 
    rom_0_56_509 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[509]), .o_ld_data(acts_0_56_509));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_537)) 
    rom_0_56_537 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[537]), .o_ld_data(acts_0_56_537));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_538)) 
    rom_0_56_538 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[538]), .o_ld_data(acts_0_56_538));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_539)) 
    rom_0_56_539 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[539]), .o_ld_data(acts_0_56_539));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_540)) 
    rom_0_56_540 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[540]), .o_ld_data(acts_0_56_540));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_541)) 
    rom_0_56_541 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[541]), .o_ld_data(acts_0_56_541));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_546)) 
    rom_0_56_546 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[546]), .o_ld_data(acts_0_56_546));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_570)) 
    rom_0_56_570 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[570]), .o_ld_data(acts_0_56_570));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_571)) 
    rom_0_56_571 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[571]), .o_ld_data(acts_0_56_571));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_572)) 
    rom_0_56_572 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[572]), .o_ld_data(acts_0_56_572));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_578)) 
    rom_0_56_578 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[578]), .o_ld_data(acts_0_56_578));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_597)) 
    rom_0_56_597 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[597]), .o_ld_data(acts_0_56_597));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_600)) 
    rom_0_56_600 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[600]), .o_ld_data(acts_0_56_600));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_682)) 
    rom_0_56_682 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[682]), .o_ld_data(acts_0_56_682));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_684)) 
    rom_0_56_684 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[684]), .o_ld_data(acts_0_56_684));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_709)) 
    rom_0_56_709 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[709]), .o_ld_data(acts_0_56_709));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_711)) 
    rom_0_56_711 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[711]), .o_ld_data(acts_0_56_711));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_56_712)) 
    rom_0_56_712 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[712]), .o_ld_data(acts_0_56_712));

  // Stage 1
    assign s_0_56_1_0 = {{2{acts_0_56_348[5]}}, acts_0_56_348} + {{2{acts_0_56_457[5]}}, acts_0_56_457} + {{2{acts_0_56_458[5]}}, acts_0_56_458} + {{2{acts_0_56_460[5]}}, acts_0_56_460};
    registers #(.ARRAY_WIDTH(8)) r_0_56_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_1_0), .q(s_0_56_1_0_reg));

    assign s_0_56_1_1 = {{2{acts_0_56_462[5]}}, acts_0_56_462} + {{2{acts_0_56_489[5]}}, acts_0_56_489} + {{2{acts_0_56_509[5]}}, acts_0_56_509} + {{2{acts_0_56_537[5]}}, acts_0_56_537};
    registers #(.ARRAY_WIDTH(8)) r_0_56_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_1_1), .q(s_0_56_1_1_reg));

    assign s_0_56_1_2 = {{2{acts_0_56_538[5]}}, acts_0_56_538} + {{2{acts_0_56_539[5]}}, acts_0_56_539} + {{2{acts_0_56_540[5]}}, acts_0_56_540} + {{2{acts_0_56_541[5]}}, acts_0_56_541};
    registers #(.ARRAY_WIDTH(8)) r_0_56_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_1_2), .q(s_0_56_1_2_reg));

    assign s_0_56_1_3 = {{2{acts_0_56_546[5]}}, acts_0_56_546} + {{2{acts_0_56_570[5]}}, acts_0_56_570} + {{2{acts_0_56_571[5]}}, acts_0_56_571} + {{2{acts_0_56_572[5]}}, acts_0_56_572};
    registers #(.ARRAY_WIDTH(8)) r_0_56_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_1_3), .q(s_0_56_1_3_reg));

    assign s_0_56_1_4 = {{2{acts_0_56_578[5]}}, acts_0_56_578} + {{2{acts_0_56_597[5]}}, acts_0_56_597} + {{2{acts_0_56_600[5]}}, acts_0_56_600} + {{2{acts_0_56_682[5]}}, acts_0_56_682};
    registers #(.ARRAY_WIDTH(8)) r_0_56_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_1_4), .q(s_0_56_1_4_reg));

    assign s_0_56_1_5 = {{2{acts_0_56_684[5]}}, acts_0_56_684} + {{2{acts_0_56_709[5]}}, acts_0_56_709} + {{2{acts_0_56_711[5]}}, acts_0_56_711} + {{2{acts_0_56_712[5]}}, acts_0_56_712};
    registers #(.ARRAY_WIDTH(8)) r_0_56_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_1_5), .q(s_0_56_1_5_reg));

  // Stage 2
    assign s_0_56_2_0 = {{2{s_0_56_1_0_reg[7]}}, s_0_56_1_0_reg} + {{2{s_0_56_1_1_reg[7]}}, s_0_56_1_1_reg} + {{2{s_0_56_1_2_reg[7]}}, s_0_56_1_2_reg} + {{2{s_0_56_1_3_reg[7]}}, s_0_56_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_56_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_2_0), .q(s_0_56_2_0_reg));

    assign s_0_56_2_1 = {{2{s_0_56_1_4_reg[7]}}, s_0_56_1_4_reg} + {{2{s_0_56_1_5_reg[7]}}, s_0_56_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_56_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_2_1), .q(s_0_56_2_1_reg));

  // Stage 3
    assign s_0_56_3_0 = {{2{s_0_56_2_0_reg[9]}}, s_0_56_2_0_reg} + {{2{s_0_56_2_1_reg[9]}}, s_0_56_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_56_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_3_0), .q(s_0_56_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_56_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_56_3_0_reg[11]}}, s_0_56_3_0_reg}), .q(sum_0_56_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_56 (.i_data(sum_0_56_reg), .o_data(out_0_56_sat));


    // Layer 0, Node 57
      logic  [11:0] s_0_57_3_0;
    logic  [11:0] s_0_57_3_0_reg;
    logic  [7:0] s_0_57_1_0, s_0_57_1_1, s_0_57_1_2, s_0_57_1_3, s_0_57_1_4, s_0_57_1_5, s_0_57_1_6, s_0_57_1_7, s_0_57_1_8, s_0_57_1_9;
    logic  [7:0] s_0_57_1_0_reg, s_0_57_1_1_reg, s_0_57_1_2_reg, s_0_57_1_3_reg, s_0_57_1_4_reg, s_0_57_1_5_reg, s_0_57_1_6_reg, s_0_57_1_7_reg, s_0_57_1_8_reg, s_0_57_1_9_reg;
    logic  [9:0] s_0_57_2_0, s_0_57_2_1, s_0_57_2_2;
    logic  [9:0] s_0_57_2_0_reg, s_0_57_2_1_reg, s_0_57_2_2_reg;
    logic [13:0] sum_0_57;
    logic [13:0] sum_0_57_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_101)) 
    rom_0_57_101 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[101]), .o_ld_data(acts_0_57_101));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_129)) 
    rom_0_57_129 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[129]), .o_ld_data(acts_0_57_129));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_130)) 
    rom_0_57_130 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[130]), .o_ld_data(acts_0_57_130));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_157)) 
    rom_0_57_157 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[157]), .o_ld_data(acts_0_57_157));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_158)) 
    rom_0_57_158 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[158]), .o_ld_data(acts_0_57_158));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_160)) 
    rom_0_57_160 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[160]), .o_ld_data(acts_0_57_160));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_175)) 
    rom_0_57_175 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[175]), .o_ld_data(acts_0_57_175));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_243)) 
    rom_0_57_243 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[243]), .o_ld_data(acts_0_57_243));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_261)) 
    rom_0_57_261 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[261]), .o_ld_data(acts_0_57_261));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_321)) 
    rom_0_57_321 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[321]), .o_ld_data(acts_0_57_321));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_322)) 
    rom_0_57_322 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[322]), .o_ld_data(acts_0_57_322));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_344)) 
    rom_0_57_344 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[344]), .o_ld_data(acts_0_57_344));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_349)) 
    rom_0_57_349 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[349]), .o_ld_data(acts_0_57_349));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_430)) 
    rom_0_57_430 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[430]), .o_ld_data(acts_0_57_430));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_467)) 
    rom_0_57_467 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[467]), .o_ld_data(acts_0_57_467));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_482)) 
    rom_0_57_482 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[482]), .o_ld_data(acts_0_57_482));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_483)) 
    rom_0_57_483 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[483]), .o_ld_data(acts_0_57_483));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_493)) 
    rom_0_57_493 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[493]), .o_ld_data(acts_0_57_493));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_495)) 
    rom_0_57_495 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[495]), .o_ld_data(acts_0_57_495));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_509)) 
    rom_0_57_509 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[509]), .o_ld_data(acts_0_57_509));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_510)) 
    rom_0_57_510 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[510]), .o_ld_data(acts_0_57_510));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_511)) 
    rom_0_57_511 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[511]), .o_ld_data(acts_0_57_511));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_520)) 
    rom_0_57_520 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[520]), .o_ld_data(acts_0_57_520));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_521)) 
    rom_0_57_521 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[521]), .o_ld_data(acts_0_57_521));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_522)) 
    rom_0_57_522 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[522]), .o_ld_data(acts_0_57_522));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_523)) 
    rom_0_57_523 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[523]), .o_ld_data(acts_0_57_523));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_537)) 
    rom_0_57_537 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[537]), .o_ld_data(acts_0_57_537));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_538)) 
    rom_0_57_538 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[538]), .o_ld_data(acts_0_57_538));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_547)) 
    rom_0_57_547 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[547]), .o_ld_data(acts_0_57_547));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_549)) 
    rom_0_57_549 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[549]), .o_ld_data(acts_0_57_549));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_627)) 
    rom_0_57_627 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[627]), .o_ld_data(acts_0_57_627));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_628)) 
    rom_0_57_628 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[628]), .o_ld_data(acts_0_57_628));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_629)) 
    rom_0_57_629 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[629]), .o_ld_data(acts_0_57_629));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_666)) 
    rom_0_57_666 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[666]), .o_ld_data(acts_0_57_666));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_685)) 
    rom_0_57_685 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[685]), .o_ld_data(acts_0_57_685));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_686)) 
    rom_0_57_686 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[686]), .o_ld_data(acts_0_57_686));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_57_687)) 
    rom_0_57_687 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[687]), .o_ld_data(acts_0_57_687));

  // Stage 1
    assign s_0_57_1_0 = {{2{acts_0_57_101[5]}}, acts_0_57_101} + {{2{acts_0_57_129[5]}}, acts_0_57_129} + {{2{acts_0_57_130[5]}}, acts_0_57_130} + {{2{acts_0_57_157[5]}}, acts_0_57_157};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_0), .q(s_0_57_1_0_reg));

    assign s_0_57_1_1 = {{2{acts_0_57_158[5]}}, acts_0_57_158} + {{2{acts_0_57_160[5]}}, acts_0_57_160} + {{2{acts_0_57_175[5]}}, acts_0_57_175} + {{2{acts_0_57_243[5]}}, acts_0_57_243};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_1), .q(s_0_57_1_1_reg));

    assign s_0_57_1_2 = {{2{acts_0_57_261[5]}}, acts_0_57_261} + {{2{acts_0_57_321[5]}}, acts_0_57_321} + {{2{acts_0_57_322[5]}}, acts_0_57_322} + {{2{acts_0_57_344[5]}}, acts_0_57_344};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_2), .q(s_0_57_1_2_reg));

    assign s_0_57_1_3 = {{2{acts_0_57_349[5]}}, acts_0_57_349} + {{2{acts_0_57_430[5]}}, acts_0_57_430} + {{2{acts_0_57_467[5]}}, acts_0_57_467} + {{2{acts_0_57_482[5]}}, acts_0_57_482};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_3), .q(s_0_57_1_3_reg));

    assign s_0_57_1_4 = {{2{acts_0_57_483[5]}}, acts_0_57_483} + {{2{acts_0_57_493[5]}}, acts_0_57_493} + {{2{acts_0_57_495[5]}}, acts_0_57_495} + {{2{acts_0_57_509[5]}}, acts_0_57_509};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_4), .q(s_0_57_1_4_reg));

    assign s_0_57_1_5 = {{2{acts_0_57_510[5]}}, acts_0_57_510} + {{2{acts_0_57_511[5]}}, acts_0_57_511} + {{2{acts_0_57_520[5]}}, acts_0_57_520} + {{2{acts_0_57_521[5]}}, acts_0_57_521};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_5), .q(s_0_57_1_5_reg));

    assign s_0_57_1_6 = {{2{acts_0_57_522[5]}}, acts_0_57_522} + {{2{acts_0_57_523[5]}}, acts_0_57_523} + {{2{acts_0_57_537[5]}}, acts_0_57_537} + {{2{acts_0_57_538[5]}}, acts_0_57_538};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_6), .q(s_0_57_1_6_reg));

    assign s_0_57_1_7 = {{2{acts_0_57_547[5]}}, acts_0_57_547} + {{2{acts_0_57_549[5]}}, acts_0_57_549} + {{2{acts_0_57_627[5]}}, acts_0_57_627} + {{2{acts_0_57_628[5]}}, acts_0_57_628};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_7), .q(s_0_57_1_7_reg));

    assign s_0_57_1_8 = {{2{acts_0_57_629[5]}}, acts_0_57_629} + {{2{acts_0_57_666[5]}}, acts_0_57_666} + {{2{acts_0_57_685[5]}}, acts_0_57_685} + {{2{acts_0_57_686[5]}}, acts_0_57_686};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_8), .q(s_0_57_1_8_reg));

    assign s_0_57_1_9 = {{2{acts_0_57_687[5]}}, acts_0_57_687};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_9), .q(s_0_57_1_9_reg));

  // Stage 2
    assign s_0_57_2_0 = {{2{s_0_57_1_0_reg[7]}}, s_0_57_1_0_reg} + {{2{s_0_57_1_1_reg[7]}}, s_0_57_1_1_reg} + {{2{s_0_57_1_2_reg[7]}}, s_0_57_1_2_reg} + {{2{s_0_57_1_3_reg[7]}}, s_0_57_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_57_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_2_0), .q(s_0_57_2_0_reg));

    assign s_0_57_2_1 = {{2{s_0_57_1_4_reg[7]}}, s_0_57_1_4_reg} + {{2{s_0_57_1_5_reg[7]}}, s_0_57_1_5_reg} + {{2{s_0_57_1_6_reg[7]}}, s_0_57_1_6_reg} + {{2{s_0_57_1_7_reg[7]}}, s_0_57_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_57_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_2_1), .q(s_0_57_2_1_reg));

    assign s_0_57_2_2 = {{2{s_0_57_1_8_reg[7]}}, s_0_57_1_8_reg} + {{2{s_0_57_1_9_reg[7]}}, s_0_57_1_9_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_57_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_2_2), .q(s_0_57_2_2_reg));

  // Stage 3
    assign s_0_57_3_0 = {{2{s_0_57_2_0_reg[9]}}, s_0_57_2_0_reg} + {{2{s_0_57_2_1_reg[9]}}, s_0_57_2_1_reg} + {{2{s_0_57_2_2_reg[9]}}, s_0_57_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_57_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_3_0), .q(s_0_57_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_57_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_57_3_0_reg[11]}}, s_0_57_3_0_reg}), .q(sum_0_57_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_57 (.i_data(sum_0_57_reg), .o_data(out_0_57_sat));


    // Layer 0, Node 58
      logic  [11:0] s_0_58_3_0;
    logic  [11:0] s_0_58_3_0_reg;
    logic  [7:0] s_0_58_1_0, s_0_58_1_1, s_0_58_1_2, s_0_58_1_3, s_0_58_1_4, s_0_58_1_5, s_0_58_1_6;
    logic  [7:0] s_0_58_1_0_reg, s_0_58_1_1_reg, s_0_58_1_2_reg, s_0_58_1_3_reg, s_0_58_1_4_reg, s_0_58_1_5_reg, s_0_58_1_6_reg;
    logic  [9:0] s_0_58_2_0, s_0_58_2_1;
    logic  [9:0] s_0_58_2_0_reg, s_0_58_2_1_reg;
    logic [13:0] sum_0_58;
    logic [13:0] sum_0_58_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_159)) 
    rom_0_58_159 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[159]), .o_ld_data(acts_0_58_159));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_182)) 
    rom_0_58_182 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[182]), .o_ld_data(acts_0_58_182));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_183)) 
    rom_0_58_183 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[183]), .o_ld_data(acts_0_58_183));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_184)) 
    rom_0_58_184 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[184]), .o_ld_data(acts_0_58_184));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_187)) 
    rom_0_58_187 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[187]), .o_ld_data(acts_0_58_187));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_188)) 
    rom_0_58_188 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[188]), .o_ld_data(acts_0_58_188));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_211)) 
    rom_0_58_211 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[211]), .o_ld_data(acts_0_58_211));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_215)) 
    rom_0_58_215 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[215]), .o_ld_data(acts_0_58_215));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_216)) 
    rom_0_58_216 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[216]), .o_ld_data(acts_0_58_216));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_239)) 
    rom_0_58_239 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[239]), .o_ld_data(acts_0_58_239));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_242)) 
    rom_0_58_242 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[242]), .o_ld_data(acts_0_58_242));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_248)) 
    rom_0_58_248 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[248]), .o_ld_data(acts_0_58_248));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_266)) 
    rom_0_58_266 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[266]), .o_ld_data(acts_0_58_266));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_267)) 
    rom_0_58_267 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[267]), .o_ld_data(acts_0_58_267));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_270)) 
    rom_0_58_270 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[270]), .o_ld_data(acts_0_58_270));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_271)) 
    rom_0_58_271 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[271]), .o_ld_data(acts_0_58_271));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_276)) 
    rom_0_58_276 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[276]), .o_ld_data(acts_0_58_276));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_297)) 
    rom_0_58_297 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[297]), .o_ld_data(acts_0_58_297));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_298)) 
    rom_0_58_298 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[298]), .o_ld_data(acts_0_58_298));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_299)) 
    rom_0_58_299 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[299]), .o_ld_data(acts_0_58_299));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_321)) 
    rom_0_58_321 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[321]), .o_ld_data(acts_0_58_321));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_325)) 
    rom_0_58_325 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[325]), .o_ld_data(acts_0_58_325));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_326)) 
    rom_0_58_326 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[326]), .o_ld_data(acts_0_58_326));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_350)) 
    rom_0_58_350 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[350]), .o_ld_data(acts_0_58_350));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_410)) 
    rom_0_58_410 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[410]), .o_ld_data(acts_0_58_410));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_58_486)) 
    rom_0_58_486 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[486]), .o_ld_data(acts_0_58_486));

  // Stage 1
    assign s_0_58_1_0 = {{2{acts_0_58_159[5]}}, acts_0_58_159} + {{2{acts_0_58_182[5]}}, acts_0_58_182} + {{2{acts_0_58_183[5]}}, acts_0_58_183} + {{2{acts_0_58_184[5]}}, acts_0_58_184};
    registers #(.ARRAY_WIDTH(8)) r_0_58_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_1_0), .q(s_0_58_1_0_reg));

    assign s_0_58_1_1 = {{2{acts_0_58_187[5]}}, acts_0_58_187} + {{2{acts_0_58_188[5]}}, acts_0_58_188} + {{2{acts_0_58_211[5]}}, acts_0_58_211} + {{2{acts_0_58_215[5]}}, acts_0_58_215};
    registers #(.ARRAY_WIDTH(8)) r_0_58_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_1_1), .q(s_0_58_1_1_reg));

    assign s_0_58_1_2 = {{2{acts_0_58_216[5]}}, acts_0_58_216} + {{2{acts_0_58_239[5]}}, acts_0_58_239} + {{2{acts_0_58_242[5]}}, acts_0_58_242} + {{2{acts_0_58_248[5]}}, acts_0_58_248};
    registers #(.ARRAY_WIDTH(8)) r_0_58_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_1_2), .q(s_0_58_1_2_reg));

    assign s_0_58_1_3 = {{2{acts_0_58_266[5]}}, acts_0_58_266} + {{2{acts_0_58_267[5]}}, acts_0_58_267} + {{2{acts_0_58_270[5]}}, acts_0_58_270} + {{2{acts_0_58_271[5]}}, acts_0_58_271};
    registers #(.ARRAY_WIDTH(8)) r_0_58_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_1_3), .q(s_0_58_1_3_reg));

    assign s_0_58_1_4 = {{2{acts_0_58_276[5]}}, acts_0_58_276} + {{2{acts_0_58_297[5]}}, acts_0_58_297} + {{2{acts_0_58_298[5]}}, acts_0_58_298} + {{2{acts_0_58_299[5]}}, acts_0_58_299};
    registers #(.ARRAY_WIDTH(8)) r_0_58_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_1_4), .q(s_0_58_1_4_reg));

    assign s_0_58_1_5 = {{2{acts_0_58_321[5]}}, acts_0_58_321} + {{2{acts_0_58_325[5]}}, acts_0_58_325} + {{2{acts_0_58_326[5]}}, acts_0_58_326} + {{2{acts_0_58_350[5]}}, acts_0_58_350};
    registers #(.ARRAY_WIDTH(8)) r_0_58_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_1_5), .q(s_0_58_1_5_reg));

    assign s_0_58_1_6 = {{2{acts_0_58_410[5]}}, acts_0_58_410} + {{2{acts_0_58_486[5]}}, acts_0_58_486};
    registers #(.ARRAY_WIDTH(8)) r_0_58_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_1_6), .q(s_0_58_1_6_reg));

  // Stage 2
    assign s_0_58_2_0 = {{2{s_0_58_1_0_reg[7]}}, s_0_58_1_0_reg} + {{2{s_0_58_1_1_reg[7]}}, s_0_58_1_1_reg} + {{2{s_0_58_1_2_reg[7]}}, s_0_58_1_2_reg} + {{2{s_0_58_1_3_reg[7]}}, s_0_58_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_58_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_2_0), .q(s_0_58_2_0_reg));

    assign s_0_58_2_1 = {{2{s_0_58_1_4_reg[7]}}, s_0_58_1_4_reg} + {{2{s_0_58_1_5_reg[7]}}, s_0_58_1_5_reg} + {{2{s_0_58_1_6_reg[7]}}, s_0_58_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_58_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_2_1), .q(s_0_58_2_1_reg));

  // Stage 3
    assign s_0_58_3_0 = {{2{s_0_58_2_0_reg[9]}}, s_0_58_2_0_reg} + {{2{s_0_58_2_1_reg[9]}}, s_0_58_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_58_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_3_0), .q(s_0_58_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_58_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_58_3_0_reg[11]}}, s_0_58_3_0_reg}), .q(sum_0_58_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_58 (.i_data(sum_0_58_reg), .o_data(out_0_58_sat));


    // Layer 0, Node 59
      logic  [11:0] s_0_59_3_0;
    logic  [11:0] s_0_59_3_0_reg;
    logic  [7:0] s_0_59_1_0, s_0_59_1_1, s_0_59_1_2, s_0_59_1_3, s_0_59_1_4, s_0_59_1_5, s_0_59_1_6, s_0_59_1_7, s_0_59_1_8, s_0_59_1_9;
    logic  [7:0] s_0_59_1_0_reg, s_0_59_1_1_reg, s_0_59_1_2_reg, s_0_59_1_3_reg, s_0_59_1_4_reg, s_0_59_1_5_reg, s_0_59_1_6_reg, s_0_59_1_7_reg, s_0_59_1_8_reg, s_0_59_1_9_reg;
    logic  [9:0] s_0_59_2_0, s_0_59_2_1, s_0_59_2_2;
    logic  [9:0] s_0_59_2_0_reg, s_0_59_2_1_reg, s_0_59_2_2_reg;
    logic [13:0] sum_0_59;
    logic [13:0] sum_0_59_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_266)) 
    rom_0_59_266 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[266]), .o_ld_data(acts_0_59_266));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_294)) 
    rom_0_59_294 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[294]), .o_ld_data(acts_0_59_294));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_295)) 
    rom_0_59_295 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[295]), .o_ld_data(acts_0_59_295));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_296)) 
    rom_0_59_296 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[296]), .o_ld_data(acts_0_59_296));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_353)) 
    rom_0_59_353 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[353]), .o_ld_data(acts_0_59_353));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_356)) 
    rom_0_59_356 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[356]), .o_ld_data(acts_0_59_356));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_380)) 
    rom_0_59_380 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[380]), .o_ld_data(acts_0_59_380));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_381)) 
    rom_0_59_381 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[381]), .o_ld_data(acts_0_59_381));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_397)) 
    rom_0_59_397 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[397]), .o_ld_data(acts_0_59_397));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_398)) 
    rom_0_59_398 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[398]), .o_ld_data(acts_0_59_398));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_399)) 
    rom_0_59_399 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[399]), .o_ld_data(acts_0_59_399));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_400)) 
    rom_0_59_400 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[400]), .o_ld_data(acts_0_59_400));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_403)) 
    rom_0_59_403 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[403]), .o_ld_data(acts_0_59_403));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_404)) 
    rom_0_59_404 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[404]), .o_ld_data(acts_0_59_404));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_405)) 
    rom_0_59_405 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[405]), .o_ld_data(acts_0_59_405));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_410)) 
    rom_0_59_410 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[410]), .o_ld_data(acts_0_59_410));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_425)) 
    rom_0_59_425 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[425]), .o_ld_data(acts_0_59_425));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_427)) 
    rom_0_59_427 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[427]), .o_ld_data(acts_0_59_427));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_428)) 
    rom_0_59_428 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[428]), .o_ld_data(acts_0_59_428));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_429)) 
    rom_0_59_429 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[429]), .o_ld_data(acts_0_59_429));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_439)) 
    rom_0_59_439 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[439]), .o_ld_data(acts_0_59_439));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_440)) 
    rom_0_59_440 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[440]), .o_ld_data(acts_0_59_440));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_461)) 
    rom_0_59_461 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[461]), .o_ld_data(acts_0_59_461));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_467)) 
    rom_0_59_467 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[467]), .o_ld_data(acts_0_59_467));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_487)) 
    rom_0_59_487 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[487]), .o_ld_data(acts_0_59_487));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_489)) 
    rom_0_59_489 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[489]), .o_ld_data(acts_0_59_489));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_516)) 
    rom_0_59_516 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[516]), .o_ld_data(acts_0_59_516));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_518)) 
    rom_0_59_518 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[518]), .o_ld_data(acts_0_59_518));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_520)) 
    rom_0_59_520 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[520]), .o_ld_data(acts_0_59_520));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_541)) 
    rom_0_59_541 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[541]), .o_ld_data(acts_0_59_541));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_543)) 
    rom_0_59_543 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[543]), .o_ld_data(acts_0_59_543));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_544)) 
    rom_0_59_544 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[544]), .o_ld_data(acts_0_59_544));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_545)) 
    rom_0_59_545 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[545]), .o_ld_data(acts_0_59_545));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_568)) 
    rom_0_59_568 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[568]), .o_ld_data(acts_0_59_568));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_571)) 
    rom_0_59_571 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[571]), .o_ld_data(acts_0_59_571));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_574)) 
    rom_0_59_574 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[574]), .o_ld_data(acts_0_59_574));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_597)) 
    rom_0_59_597 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[597]), .o_ld_data(acts_0_59_597));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_621)) 
    rom_0_59_621 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[621]), .o_ld_data(acts_0_59_621));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_623)) 
    rom_0_59_623 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[623]), .o_ld_data(acts_0_59_623));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_59_625)) 
    rom_0_59_625 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[625]), .o_ld_data(acts_0_59_625));

  // Stage 1
    assign s_0_59_1_0 = {{2{acts_0_59_266[5]}}, acts_0_59_266} + {{2{acts_0_59_294[5]}}, acts_0_59_294} + {{2{acts_0_59_295[5]}}, acts_0_59_295} + {{2{acts_0_59_296[5]}}, acts_0_59_296};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_0), .q(s_0_59_1_0_reg));

    assign s_0_59_1_1 = {{2{acts_0_59_353[5]}}, acts_0_59_353} + {{2{acts_0_59_356[5]}}, acts_0_59_356} + {{2{acts_0_59_380[5]}}, acts_0_59_380} + {{2{acts_0_59_381[5]}}, acts_0_59_381};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_1), .q(s_0_59_1_1_reg));

    assign s_0_59_1_2 = {{2{acts_0_59_397[5]}}, acts_0_59_397} + {{2{acts_0_59_398[5]}}, acts_0_59_398} + {{2{acts_0_59_399[5]}}, acts_0_59_399} + {{2{acts_0_59_400[5]}}, acts_0_59_400};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_2), .q(s_0_59_1_2_reg));

    assign s_0_59_1_3 = {{2{acts_0_59_403[5]}}, acts_0_59_403} + {{2{acts_0_59_404[5]}}, acts_0_59_404} + {{2{acts_0_59_405[5]}}, acts_0_59_405} + {{2{acts_0_59_410[5]}}, acts_0_59_410};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_3), .q(s_0_59_1_3_reg));

    assign s_0_59_1_4 = {{2{acts_0_59_425[5]}}, acts_0_59_425} + {{2{acts_0_59_427[5]}}, acts_0_59_427} + {{2{acts_0_59_428[5]}}, acts_0_59_428} + {{2{acts_0_59_429[5]}}, acts_0_59_429};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_4), .q(s_0_59_1_4_reg));

    assign s_0_59_1_5 = {{2{acts_0_59_439[5]}}, acts_0_59_439} + {{2{acts_0_59_440[5]}}, acts_0_59_440} + {{2{acts_0_59_461[5]}}, acts_0_59_461} + {{2{acts_0_59_467[5]}}, acts_0_59_467};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_5), .q(s_0_59_1_5_reg));

    assign s_0_59_1_6 = {{2{acts_0_59_487[5]}}, acts_0_59_487} + {{2{acts_0_59_489[5]}}, acts_0_59_489} + {{2{acts_0_59_516[5]}}, acts_0_59_516} + {{2{acts_0_59_518[5]}}, acts_0_59_518};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_6), .q(s_0_59_1_6_reg));

    assign s_0_59_1_7 = {{2{acts_0_59_520[5]}}, acts_0_59_520} + {{2{acts_0_59_541[5]}}, acts_0_59_541} + {{2{acts_0_59_543[5]}}, acts_0_59_543} + {{2{acts_0_59_544[5]}}, acts_0_59_544};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_7), .q(s_0_59_1_7_reg));

    assign s_0_59_1_8 = {{2{acts_0_59_545[5]}}, acts_0_59_545} + {{2{acts_0_59_568[5]}}, acts_0_59_568} + {{2{acts_0_59_571[5]}}, acts_0_59_571} + {{2{acts_0_59_574[5]}}, acts_0_59_574};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_8), .q(s_0_59_1_8_reg));

    assign s_0_59_1_9 = {{2{acts_0_59_597[5]}}, acts_0_59_597} + {{2{acts_0_59_621[5]}}, acts_0_59_621} + {{2{acts_0_59_623[5]}}, acts_0_59_623} + {{2{acts_0_59_625[5]}}, acts_0_59_625};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_9), .q(s_0_59_1_9_reg));

  // Stage 2
    assign s_0_59_2_0 = {{2{s_0_59_1_0_reg[7]}}, s_0_59_1_0_reg} + {{2{s_0_59_1_1_reg[7]}}, s_0_59_1_1_reg} + {{2{s_0_59_1_2_reg[7]}}, s_0_59_1_2_reg} + {{2{s_0_59_1_3_reg[7]}}, s_0_59_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_59_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_2_0), .q(s_0_59_2_0_reg));

    assign s_0_59_2_1 = {{2{s_0_59_1_4_reg[7]}}, s_0_59_1_4_reg} + {{2{s_0_59_1_5_reg[7]}}, s_0_59_1_5_reg} + {{2{s_0_59_1_6_reg[7]}}, s_0_59_1_6_reg} + {{2{s_0_59_1_7_reg[7]}}, s_0_59_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_59_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_2_1), .q(s_0_59_2_1_reg));

    assign s_0_59_2_2 = {{2{s_0_59_1_8_reg[7]}}, s_0_59_1_8_reg} + {{2{s_0_59_1_9_reg[7]}}, s_0_59_1_9_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_59_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_2_2), .q(s_0_59_2_2_reg));

  // Stage 3
    assign s_0_59_3_0 = {{2{s_0_59_2_0_reg[9]}}, s_0_59_2_0_reg} + {{2{s_0_59_2_1_reg[9]}}, s_0_59_2_1_reg} + {{2{s_0_59_2_2_reg[9]}}, s_0_59_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_59_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_3_0), .q(s_0_59_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_59_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_59_3_0_reg[11]}}, s_0_59_3_0_reg}), .q(sum_0_59_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_59 (.i_data(sum_0_59_reg), .o_data(out_0_59_sat));


    // Layer 0, Node 60
      logic  [11:0] s_0_60_3_0;
    logic  [11:0] s_0_60_3_0_reg;
    logic  [7:0] s_0_60_1_0, s_0_60_1_1, s_0_60_1_2, s_0_60_1_3, s_0_60_1_4, s_0_60_1_5;
    logic  [7:0] s_0_60_1_0_reg, s_0_60_1_1_reg, s_0_60_1_2_reg, s_0_60_1_3_reg, s_0_60_1_4_reg, s_0_60_1_5_reg;
    logic  [9:0] s_0_60_2_0, s_0_60_2_1;
    logic  [9:0] s_0_60_2_0_reg, s_0_60_2_1_reg;
    logic [13:0] sum_0_60;
    logic [13:0] sum_0_60_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_185)) 
    rom_0_60_185 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[185]), .o_ld_data(acts_0_60_185));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_239)) 
    rom_0_60_239 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[239]), .o_ld_data(acts_0_60_239));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_269)) 
    rom_0_60_269 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[269]), .o_ld_data(acts_0_60_269));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_290)) 
    rom_0_60_290 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[290]), .o_ld_data(acts_0_60_290));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_348)) 
    rom_0_60_348 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[348]), .o_ld_data(acts_0_60_348));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_349)) 
    rom_0_60_349 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[349]), .o_ld_data(acts_0_60_349));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_374)) 
    rom_0_60_374 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[374]), .o_ld_data(acts_0_60_374));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_375)) 
    rom_0_60_375 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[375]), .o_ld_data(acts_0_60_375));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_376)) 
    rom_0_60_376 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[376]), .o_ld_data(acts_0_60_376));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_397)) 
    rom_0_60_397 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[397]), .o_ld_data(acts_0_60_397));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_400)) 
    rom_0_60_400 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[400]), .o_ld_data(acts_0_60_400));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_401)) 
    rom_0_60_401 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[401]), .o_ld_data(acts_0_60_401));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_402)) 
    rom_0_60_402 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[402]), .o_ld_data(acts_0_60_402));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_425)) 
    rom_0_60_425 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[425]), .o_ld_data(acts_0_60_425));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_427)) 
    rom_0_60_427 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[427]), .o_ld_data(acts_0_60_427));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_428)) 
    rom_0_60_428 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[428]), .o_ld_data(acts_0_60_428));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_433)) 
    rom_0_60_433 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[433]), .o_ld_data(acts_0_60_433));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_453)) 
    rom_0_60_453 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[453]), .o_ld_data(acts_0_60_453));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_517)) 
    rom_0_60_517 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[517]), .o_ld_data(acts_0_60_517));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_714)) 
    rom_0_60_714 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[714]), .o_ld_data(acts_0_60_714));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_60_717)) 
    rom_0_60_717 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[717]), .o_ld_data(acts_0_60_717));

  // Stage 1
    assign s_0_60_1_0 = {{2{acts_0_60_185[5]}}, acts_0_60_185} + {{2{acts_0_60_239[5]}}, acts_0_60_239} + {{2{acts_0_60_269[5]}}, acts_0_60_269} + {{2{acts_0_60_290[5]}}, acts_0_60_290};
    registers #(.ARRAY_WIDTH(8)) r_0_60_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_1_0), .q(s_0_60_1_0_reg));

    assign s_0_60_1_1 = {{2{acts_0_60_348[5]}}, acts_0_60_348} + {{2{acts_0_60_349[5]}}, acts_0_60_349} + {{2{acts_0_60_374[5]}}, acts_0_60_374} + {{2{acts_0_60_375[5]}}, acts_0_60_375};
    registers #(.ARRAY_WIDTH(8)) r_0_60_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_1_1), .q(s_0_60_1_1_reg));

    assign s_0_60_1_2 = {{2{acts_0_60_376[5]}}, acts_0_60_376} + {{2{acts_0_60_397[5]}}, acts_0_60_397} + {{2{acts_0_60_400[5]}}, acts_0_60_400} + {{2{acts_0_60_401[5]}}, acts_0_60_401};
    registers #(.ARRAY_WIDTH(8)) r_0_60_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_1_2), .q(s_0_60_1_2_reg));

    assign s_0_60_1_3 = {{2{acts_0_60_402[5]}}, acts_0_60_402} + {{2{acts_0_60_425[5]}}, acts_0_60_425} + {{2{acts_0_60_427[5]}}, acts_0_60_427} + {{2{acts_0_60_428[5]}}, acts_0_60_428};
    registers #(.ARRAY_WIDTH(8)) r_0_60_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_1_3), .q(s_0_60_1_3_reg));

    assign s_0_60_1_4 = {{2{acts_0_60_433[5]}}, acts_0_60_433} + {{2{acts_0_60_453[5]}}, acts_0_60_453} + {{2{acts_0_60_517[5]}}, acts_0_60_517} + {{2{acts_0_60_714[5]}}, acts_0_60_714};
    registers #(.ARRAY_WIDTH(8)) r_0_60_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_1_4), .q(s_0_60_1_4_reg));

    assign s_0_60_1_5 = {{2{acts_0_60_717[5]}}, acts_0_60_717};
    registers #(.ARRAY_WIDTH(8)) r_0_60_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_1_5), .q(s_0_60_1_5_reg));

  // Stage 2
    assign s_0_60_2_0 = {{2{s_0_60_1_0_reg[7]}}, s_0_60_1_0_reg} + {{2{s_0_60_1_1_reg[7]}}, s_0_60_1_1_reg} + {{2{s_0_60_1_2_reg[7]}}, s_0_60_1_2_reg} + {{2{s_0_60_1_3_reg[7]}}, s_0_60_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_60_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_2_0), .q(s_0_60_2_0_reg));

    assign s_0_60_2_1 = {{2{s_0_60_1_4_reg[7]}}, s_0_60_1_4_reg} + {{2{s_0_60_1_5_reg[7]}}, s_0_60_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_60_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_2_1), .q(s_0_60_2_1_reg));

  // Stage 3
    assign s_0_60_3_0 = {{2{s_0_60_2_0_reg[9]}}, s_0_60_2_0_reg} + {{2{s_0_60_2_1_reg[9]}}, s_0_60_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_60_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_3_0), .q(s_0_60_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_60_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_60_3_0_reg[11]}}, s_0_60_3_0_reg}), .q(sum_0_60_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_60 (.i_data(sum_0_60_reg), .o_data(out_0_60_sat));


    // Layer 0, Node 61
      logic  [11:0] s_0_61_3_0;
    logic  [11:0] s_0_61_3_0_reg;
    logic  [7:0] s_0_61_1_0, s_0_61_1_1, s_0_61_1_2, s_0_61_1_3, s_0_61_1_4, s_0_61_1_5, s_0_61_1_6, s_0_61_1_7;
    logic  [7:0] s_0_61_1_0_reg, s_0_61_1_1_reg, s_0_61_1_2_reg, s_0_61_1_3_reg, s_0_61_1_4_reg, s_0_61_1_5_reg, s_0_61_1_6_reg, s_0_61_1_7_reg;
    logic  [9:0] s_0_61_2_0, s_0_61_2_1;
    logic  [9:0] s_0_61_2_0_reg, s_0_61_2_1_reg;
    logic [13:0] sum_0_61;
    logic [13:0] sum_0_61_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_209)) 
    rom_0_61_209 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[209]), .o_ld_data(acts_0_61_209));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_234)) 
    rom_0_61_234 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[234]), .o_ld_data(acts_0_61_234));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_266)) 
    rom_0_61_266 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[266]), .o_ld_data(acts_0_61_266));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_293)) 
    rom_0_61_293 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[293]), .o_ld_data(acts_0_61_293));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_295)) 
    rom_0_61_295 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[295]), .o_ld_data(acts_0_61_295));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_323)) 
    rom_0_61_323 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[323]), .o_ld_data(acts_0_61_323));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_352)) 
    rom_0_61_352 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[352]), .o_ld_data(acts_0_61_352));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_353)) 
    rom_0_61_353 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[353]), .o_ld_data(acts_0_61_353));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_376)) 
    rom_0_61_376 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[376]), .o_ld_data(acts_0_61_376));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_382)) 
    rom_0_61_382 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[382]), .o_ld_data(acts_0_61_382));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_405)) 
    rom_0_61_405 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[405]), .o_ld_data(acts_0_61_405));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_413)) 
    rom_0_61_413 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[413]), .o_ld_data(acts_0_61_413));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_414)) 
    rom_0_61_414 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[414]), .o_ld_data(acts_0_61_414));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_433)) 
    rom_0_61_433 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[433]), .o_ld_data(acts_0_61_433));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_434)) 
    rom_0_61_434 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[434]), .o_ld_data(acts_0_61_434));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_435)) 
    rom_0_61_435 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[435]), .o_ld_data(acts_0_61_435));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_436)) 
    rom_0_61_436 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[436]), .o_ld_data(acts_0_61_436));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_460)) 
    rom_0_61_460 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[460]), .o_ld_data(acts_0_61_460));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_462)) 
    rom_0_61_462 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[462]), .o_ld_data(acts_0_61_462));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_463)) 
    rom_0_61_463 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[463]), .o_ld_data(acts_0_61_463));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_544)) 
    rom_0_61_544 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[544]), .o_ld_data(acts_0_61_544));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_555)) 
    rom_0_61_555 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[555]), .o_ld_data(acts_0_61_555));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_574)) 
    rom_0_61_574 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[574]), .o_ld_data(acts_0_61_574));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_583)) 
    rom_0_61_583 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[583]), .o_ld_data(acts_0_61_583));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_608)) 
    rom_0_61_608 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[608]), .o_ld_data(acts_0_61_608));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_636)) 
    rom_0_61_636 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[636]), .o_ld_data(acts_0_61_636));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_637)) 
    rom_0_61_637 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[637]), .o_ld_data(acts_0_61_637));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_688)) 
    rom_0_61_688 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[688]), .o_ld_data(acts_0_61_688));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_61_691)) 
    rom_0_61_691 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[691]), .o_ld_data(acts_0_61_691));

  // Stage 1
    assign s_0_61_1_0 = {{2{acts_0_61_209[5]}}, acts_0_61_209} + {{2{acts_0_61_234[5]}}, acts_0_61_234} + {{2{acts_0_61_266[5]}}, acts_0_61_266} + {{2{acts_0_61_293[5]}}, acts_0_61_293};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_0), .q(s_0_61_1_0_reg));

    assign s_0_61_1_1 = {{2{acts_0_61_295[5]}}, acts_0_61_295} + {{2{acts_0_61_323[5]}}, acts_0_61_323} + {{2{acts_0_61_352[5]}}, acts_0_61_352} + {{2{acts_0_61_353[5]}}, acts_0_61_353};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_1), .q(s_0_61_1_1_reg));

    assign s_0_61_1_2 = {{2{acts_0_61_376[5]}}, acts_0_61_376} + {{2{acts_0_61_382[5]}}, acts_0_61_382} + {{2{acts_0_61_405[5]}}, acts_0_61_405} + {{2{acts_0_61_413[5]}}, acts_0_61_413};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_2), .q(s_0_61_1_2_reg));

    assign s_0_61_1_3 = {{2{acts_0_61_414[5]}}, acts_0_61_414} + {{2{acts_0_61_433[5]}}, acts_0_61_433} + {{2{acts_0_61_434[5]}}, acts_0_61_434} + {{2{acts_0_61_435[5]}}, acts_0_61_435};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_3), .q(s_0_61_1_3_reg));

    assign s_0_61_1_4 = {{2{acts_0_61_436[5]}}, acts_0_61_436} + {{2{acts_0_61_460[5]}}, acts_0_61_460} + {{2{acts_0_61_462[5]}}, acts_0_61_462} + {{2{acts_0_61_463[5]}}, acts_0_61_463};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_4), .q(s_0_61_1_4_reg));

    assign s_0_61_1_5 = {{2{acts_0_61_544[5]}}, acts_0_61_544} + {{2{acts_0_61_555[5]}}, acts_0_61_555} + {{2{acts_0_61_574[5]}}, acts_0_61_574} + {{2{acts_0_61_583[5]}}, acts_0_61_583};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_5), .q(s_0_61_1_5_reg));

    assign s_0_61_1_6 = {{2{acts_0_61_608[5]}}, acts_0_61_608} + {{2{acts_0_61_636[5]}}, acts_0_61_636} + {{2{acts_0_61_637[5]}}, acts_0_61_637} + {{2{acts_0_61_688[5]}}, acts_0_61_688};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_6), .q(s_0_61_1_6_reg));

    assign s_0_61_1_7 = {{2{acts_0_61_691[5]}}, acts_0_61_691};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_7), .q(s_0_61_1_7_reg));

  // Stage 2
    assign s_0_61_2_0 = {{2{s_0_61_1_0_reg[7]}}, s_0_61_1_0_reg} + {{2{s_0_61_1_1_reg[7]}}, s_0_61_1_1_reg} + {{2{s_0_61_1_2_reg[7]}}, s_0_61_1_2_reg} + {{2{s_0_61_1_3_reg[7]}}, s_0_61_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_61_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_2_0), .q(s_0_61_2_0_reg));

    assign s_0_61_2_1 = {{2{s_0_61_1_4_reg[7]}}, s_0_61_1_4_reg} + {{2{s_0_61_1_5_reg[7]}}, s_0_61_1_5_reg} + {{2{s_0_61_1_6_reg[7]}}, s_0_61_1_6_reg} + {{2{s_0_61_1_7_reg[7]}}, s_0_61_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_61_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_2_1), .q(s_0_61_2_1_reg));

  // Stage 3
    assign s_0_61_3_0 = {{2{s_0_61_2_0_reg[9]}}, s_0_61_2_0_reg} + {{2{s_0_61_2_1_reg[9]}}, s_0_61_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_61_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_3_0), .q(s_0_61_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_61_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_61_3_0_reg[11]}}, s_0_61_3_0_reg}), .q(sum_0_61_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_61 (.i_data(sum_0_61_reg), .o_data(out_0_61_sat));


    // Layer 0, Node 62
      logic  [7:0] s_0_62_1_0, s_0_62_1_1, s_0_62_1_2;
    logic  [7:0] s_0_62_1_0_reg, s_0_62_1_1_reg, s_0_62_1_2_reg;
    logic  [9:0] s_0_62_2_0;
    logic  [9:0] s_0_62_2_0_reg;
    logic [11:0] s_0_62_3_pipe;
    logic [13:0] sum_0_62;
    logic [13:0] sum_0_62_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_62_109)) 
    rom_0_62_109 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[109]), .o_ld_data(acts_0_62_109));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_62_143)) 
    rom_0_62_143 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[143]), .o_ld_data(acts_0_62_143));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_62_288)) 
    rom_0_62_288 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[288]), .o_ld_data(acts_0_62_288));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_62_294)) 
    rom_0_62_294 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[294]), .o_ld_data(acts_0_62_294));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_62_374)) 
    rom_0_62_374 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[374]), .o_ld_data(acts_0_62_374));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_62_375)) 
    rom_0_62_375 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[375]), .o_ld_data(acts_0_62_375));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_62_403)) 
    rom_0_62_403 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[403]), .o_ld_data(acts_0_62_403));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_62_407)) 
    rom_0_62_407 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[407]), .o_ld_data(acts_0_62_407));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_62_408)) 
    rom_0_62_408 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[408]), .o_ld_data(acts_0_62_408));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_62_432)) 
    rom_0_62_432 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[432]), .o_ld_data(acts_0_62_432));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_62_433)) 
    rom_0_62_433 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[433]), .o_ld_data(acts_0_62_433));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_62_445)) 
    rom_0_62_445 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[445]), .o_ld_data(acts_0_62_445));

  // Stage 1
    assign s_0_62_1_0 = {{2{acts_0_62_109[5]}}, acts_0_62_109} + {{2{acts_0_62_143[5]}}, acts_0_62_143} + {{2{acts_0_62_288[5]}}, acts_0_62_288} + {{2{acts_0_62_294[5]}}, acts_0_62_294};
    registers #(.ARRAY_WIDTH(8)) r_0_62_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_62_1_0), .q(s_0_62_1_0_reg));

    assign s_0_62_1_1 = {{2{acts_0_62_374[5]}}, acts_0_62_374} + {{2{acts_0_62_375[5]}}, acts_0_62_375} + {{2{acts_0_62_403[5]}}, acts_0_62_403} + {{2{acts_0_62_407[5]}}, acts_0_62_407};
    registers #(.ARRAY_WIDTH(8)) r_0_62_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_62_1_1), .q(s_0_62_1_1_reg));

    assign s_0_62_1_2 = {{2{acts_0_62_408[5]}}, acts_0_62_408} + {{2{acts_0_62_432[5]}}, acts_0_62_432} + {{2{acts_0_62_433[5]}}, acts_0_62_433} + {{2{acts_0_62_445[5]}}, acts_0_62_445};
    registers #(.ARRAY_WIDTH(8)) r_0_62_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_62_1_2), .q(s_0_62_1_2_reg));

  // Stage 2
    assign s_0_62_2_0 = {{2{s_0_62_1_0_reg[7]}}, s_0_62_1_0_reg} + {{2{s_0_62_1_1_reg[7]}}, s_0_62_1_1_reg} + {{2{s_0_62_1_2_reg[7]}}, s_0_62_1_2_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_62_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_62_2_0), .q(s_0_62_2_0_reg));

  // Stage 3
    registers #(.ARRAY_WIDTH(12)) reg_0_62_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_62_2_0_reg[9]}}, s_0_62_2_0_reg}), .q(s_0_62_3_pipe));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_62_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_62_3_pipe[11]}},s_0_62_3_pipe}), .q(sum_0_62_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_62 (.i_data(sum_0_62_reg), .o_data(out_0_62_sat));


    // Layer 0, Node 63
      logic  [11:0] s_0_63_3_0;
    logic  [11:0] s_0_63_3_0_reg;
    logic  [7:0] s_0_63_1_0, s_0_63_1_1, s_0_63_1_2, s_0_63_1_3, s_0_63_1_4, s_0_63_1_5, s_0_63_1_6, s_0_63_1_7, s_0_63_1_8, s_0_63_1_9;
    logic  [7:0] s_0_63_1_0_reg, s_0_63_1_1_reg, s_0_63_1_2_reg, s_0_63_1_3_reg, s_0_63_1_4_reg, s_0_63_1_5_reg, s_0_63_1_6_reg, s_0_63_1_7_reg, s_0_63_1_8_reg, s_0_63_1_9_reg;
    logic  [9:0] s_0_63_2_0, s_0_63_2_1, s_0_63_2_2;
    logic  [9:0] s_0_63_2_0_reg, s_0_63_2_1_reg, s_0_63_2_2_reg;
    logic [13:0] sum_0_63;
    logic [13:0] sum_0_63_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_125)) 
    rom_0_63_125 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[125]), .o_ld_data(acts_0_63_125));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_214)) 
    rom_0_63_214 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[214]), .o_ld_data(acts_0_63_214));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_243)) 
    rom_0_63_243 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[243]), .o_ld_data(acts_0_63_243));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_268)) 
    rom_0_63_268 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[268]), .o_ld_data(acts_0_63_268));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_271)) 
    rom_0_63_271 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[271]), .o_ld_data(acts_0_63_271));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_272)) 
    rom_0_63_272 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[272]), .o_ld_data(acts_0_63_272));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_297)) 
    rom_0_63_297 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[297]), .o_ld_data(acts_0_63_297));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_300)) 
    rom_0_63_300 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[300]), .o_ld_data(acts_0_63_300));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_301)) 
    rom_0_63_301 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[301]), .o_ld_data(acts_0_63_301));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_325)) 
    rom_0_63_325 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[325]), .o_ld_data(acts_0_63_325));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_331)) 
    rom_0_63_331 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[331]), .o_ld_data(acts_0_63_331));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_354)) 
    rom_0_63_354 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[354]), .o_ld_data(acts_0_63_354));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_357)) 
    rom_0_63_357 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[357]), .o_ld_data(acts_0_63_357));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_359)) 
    rom_0_63_359 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[359]), .o_ld_data(acts_0_63_359));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_381)) 
    rom_0_63_381 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[381]), .o_ld_data(acts_0_63_381));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_403)) 
    rom_0_63_403 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[403]), .o_ld_data(acts_0_63_403));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_408)) 
    rom_0_63_408 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[408]), .o_ld_data(acts_0_63_408));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_435)) 
    rom_0_63_435 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[435]), .o_ld_data(acts_0_63_435));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_436)) 
    rom_0_63_436 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[436]), .o_ld_data(acts_0_63_436));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_439)) 
    rom_0_63_439 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[439]), .o_ld_data(acts_0_63_439));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_440)) 
    rom_0_63_440 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[440]), .o_ld_data(acts_0_63_440));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_441)) 
    rom_0_63_441 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[441]), .o_ld_data(acts_0_63_441));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_457)) 
    rom_0_63_457 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[457]), .o_ld_data(acts_0_63_457));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_460)) 
    rom_0_63_460 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[460]), .o_ld_data(acts_0_63_460));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_461)) 
    rom_0_63_461 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[461]), .o_ld_data(acts_0_63_461));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_462)) 
    rom_0_63_462 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[462]), .o_ld_data(acts_0_63_462));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_483)) 
    rom_0_63_483 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[483]), .o_ld_data(acts_0_63_483));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_485)) 
    rom_0_63_485 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[485]), .o_ld_data(acts_0_63_485));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_486)) 
    rom_0_63_486 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[486]), .o_ld_data(acts_0_63_486));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_487)) 
    rom_0_63_487 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[487]), .o_ld_data(acts_0_63_487));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_488)) 
    rom_0_63_488 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[488]), .o_ld_data(acts_0_63_488));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_514)) 
    rom_0_63_514 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[514]), .o_ld_data(acts_0_63_514));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_515)) 
    rom_0_63_515 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[515]), .o_ld_data(acts_0_63_515));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_539)) 
    rom_0_63_539 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[539]), .o_ld_data(acts_0_63_539));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_540)) 
    rom_0_63_540 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[540]), .o_ld_data(acts_0_63_540));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_627)) 
    rom_0_63_627 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[627]), .o_ld_data(acts_0_63_627));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(1), .INIT(LUT_0_63_651)) 
    rom_0_63_651 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[651]), .o_ld_data(acts_0_63_651));

  // Stage 1
    assign s_0_63_1_0 = {{2{acts_0_63_125[5]}}, acts_0_63_125} + {{2{acts_0_63_214[5]}}, acts_0_63_214} + {{2{acts_0_63_243[5]}}, acts_0_63_243} + {{2{acts_0_63_268[5]}}, acts_0_63_268};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_0), .q(s_0_63_1_0_reg));

    assign s_0_63_1_1 = {{2{acts_0_63_271[5]}}, acts_0_63_271} + {{2{acts_0_63_272[5]}}, acts_0_63_272} + {{2{acts_0_63_297[5]}}, acts_0_63_297} + {{2{acts_0_63_300[5]}}, acts_0_63_300};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_1), .q(s_0_63_1_1_reg));

    assign s_0_63_1_2 = {{2{acts_0_63_301[5]}}, acts_0_63_301} + {{2{acts_0_63_325[5]}}, acts_0_63_325} + {{2{acts_0_63_331[5]}}, acts_0_63_331} + {{2{acts_0_63_354[5]}}, acts_0_63_354};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_2), .q(s_0_63_1_2_reg));

    assign s_0_63_1_3 = {{2{acts_0_63_357[5]}}, acts_0_63_357} + {{2{acts_0_63_359[5]}}, acts_0_63_359} + {{2{acts_0_63_381[5]}}, acts_0_63_381} + {{2{acts_0_63_403[5]}}, acts_0_63_403};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_3), .q(s_0_63_1_3_reg));

    assign s_0_63_1_4 = {{2{acts_0_63_408[5]}}, acts_0_63_408} + {{2{acts_0_63_435[5]}}, acts_0_63_435} + {{2{acts_0_63_436[5]}}, acts_0_63_436} + {{2{acts_0_63_439[5]}}, acts_0_63_439};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_4), .q(s_0_63_1_4_reg));

    assign s_0_63_1_5 = {{2{acts_0_63_440[5]}}, acts_0_63_440} + {{2{acts_0_63_441[5]}}, acts_0_63_441} + {{2{acts_0_63_457[5]}}, acts_0_63_457} + {{2{acts_0_63_460[5]}}, acts_0_63_460};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_5), .q(s_0_63_1_5_reg));

    assign s_0_63_1_6 = {{2{acts_0_63_461[5]}}, acts_0_63_461} + {{2{acts_0_63_462[5]}}, acts_0_63_462} + {{2{acts_0_63_483[5]}}, acts_0_63_483} + {{2{acts_0_63_485[5]}}, acts_0_63_485};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_6), .q(s_0_63_1_6_reg));

    assign s_0_63_1_7 = {{2{acts_0_63_486[5]}}, acts_0_63_486} + {{2{acts_0_63_487[5]}}, acts_0_63_487} + {{2{acts_0_63_488[5]}}, acts_0_63_488} + {{2{acts_0_63_514[5]}}, acts_0_63_514};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_7), .q(s_0_63_1_7_reg));

    assign s_0_63_1_8 = {{2{acts_0_63_515[5]}}, acts_0_63_515} + {{2{acts_0_63_539[5]}}, acts_0_63_539} + {{2{acts_0_63_540[5]}}, acts_0_63_540} + {{2{acts_0_63_627[5]}}, acts_0_63_627};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_8), .q(s_0_63_1_8_reg));

    assign s_0_63_1_9 = {{2{acts_0_63_651[5]}}, acts_0_63_651};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_9), .q(s_0_63_1_9_reg));

  // Stage 2
    assign s_0_63_2_0 = {{2{s_0_63_1_0_reg[7]}}, s_0_63_1_0_reg} + {{2{s_0_63_1_1_reg[7]}}, s_0_63_1_1_reg} + {{2{s_0_63_1_2_reg[7]}}, s_0_63_1_2_reg} + {{2{s_0_63_1_3_reg[7]}}, s_0_63_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_63_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_2_0), .q(s_0_63_2_0_reg));

    assign s_0_63_2_1 = {{2{s_0_63_1_4_reg[7]}}, s_0_63_1_4_reg} + {{2{s_0_63_1_5_reg[7]}}, s_0_63_1_5_reg} + {{2{s_0_63_1_6_reg[7]}}, s_0_63_1_6_reg} + {{2{s_0_63_1_7_reg[7]}}, s_0_63_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_63_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_2_1), .q(s_0_63_2_1_reg));

    assign s_0_63_2_2 = {{2{s_0_63_1_8_reg[7]}}, s_0_63_1_8_reg} + {{2{s_0_63_1_9_reg[7]}}, s_0_63_1_9_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_63_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_2_2), .q(s_0_63_2_2_reg));

  // Stage 3
    assign s_0_63_3_0 = {{2{s_0_63_2_0_reg[9]}}, s_0_63_2_0_reg} + {{2{s_0_63_2_1_reg[9]}}, s_0_63_2_1_reg} + {{2{s_0_63_2_2_reg[9]}}, s_0_63_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_63_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_3_0), .q(s_0_63_3_0_reg));

  // Stage 4
    registers #(.ARRAY_WIDTH(14)) reg_0_63_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_63_3_0_reg[11]}}, s_0_63_3_0_reg}), .q(sum_0_63_reg));

    saturate_clip #(.IN_WIDTH(14), .OUT_WIDTH(6)) sat_0_63 (.i_data(sum_0_63_reg), .o_data(out_0_63_sat));


  registers #(.ARRAY_WIDTH(6)) node_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_0_sat), .q(out_0_0_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_1_sat), .q(out_0_1_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_2_sat), .q(out_0_2_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_3_sat), .q(out_0_3_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_4_sat), .q(out_0_4_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_5_sat), .q(out_0_5_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_6_sat), .q(out_0_6_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_7_sat), .q(out_0_7_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_8_sat), .q(out_0_8_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_9_sat), .q(out_0_9_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_10_sat), .q(out_0_10_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_11_sat), .q(out_0_11_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_12_sat), .q(out_0_12_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_13_sat), .q(out_0_13_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_14_sat), .q(out_0_14_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_15_sat), .q(out_0_15_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_16_sat), .q(out_0_16_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_17_sat), .q(out_0_17_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_18_sat), .q(out_0_18_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_19_sat), .q(out_0_19_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_20_sat), .q(out_0_20_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_21_sat), .q(out_0_21_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_22_sat), .q(out_0_22_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_23_sat), .q(out_0_23_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_24_sat), .q(out_0_24_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_25_sat), .q(out_0_25_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_26_sat), .q(out_0_26_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_27_sat), .q(out_0_27_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_28_sat), .q(out_0_28_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_29_sat), .q(out_0_29_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_30_sat), .q(out_0_30_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_31_sat), .q(out_0_31_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_32_sat), .q(out_0_32_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_33_sat), .q(out_0_33_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_34_sat), .q(out_0_34_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_35_sat), .q(out_0_35_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_36_sat), .q(out_0_36_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_37_sat), .q(out_0_37_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_38_sat), .q(out_0_38_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_39_sat), .q(out_0_39_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_40_sat), .q(out_0_40_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_41_sat), .q(out_0_41_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_42_sat), .q(out_0_42_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_43_sat), .q(out_0_43_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_44_sat), .q(out_0_44_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_45_sat), .q(out_0_45_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_46_sat), .q(out_0_46_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_47_sat), .q(out_0_47_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_48_sat), .q(out_0_48_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_49_sat), .q(out_0_49_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_50_sat), .q(out_0_50_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_51_sat), .q(out_0_51_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_52_sat), .q(out_0_52_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_53_sat), .q(out_0_53_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_54_sat), .q(out_0_54_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_55_sat), .q(out_0_55_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_56_sat), .q(out_0_56_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_57_sat), .q(out_0_57_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_58_sat), .q(out_0_58_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_59_sat), .q(out_0_59_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_60_sat), .q(out_0_60_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_61_sat), .q(out_0_61_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_62_sat), .q(out_0_62_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_63_sat), .q(out_0_63_reg));


    // Layer 1, Node 0
      logic  [7:0] s_1_0_1_0, s_1_0_1_1, s_1_0_1_2, s_1_0_1_3, s_1_0_1_4, s_1_0_1_5, s_1_0_1_6, s_1_0_1_7, s_1_0_1_8, s_1_0_1_9, s_1_0_1_10, s_1_0_1_11, s_1_0_1_12;
    logic  [7:0] s_1_0_1_0_reg, s_1_0_1_1_reg, s_1_0_1_2_reg, s_1_0_1_3_reg, s_1_0_1_4_reg, s_1_0_1_5_reg, s_1_0_1_6_reg, s_1_0_1_7_reg, s_1_0_1_8_reg, s_1_0_1_9_reg, s_1_0_1_10_reg, s_1_0_1_11_reg, s_1_0_1_12_reg;
    logic  [9:0] s_1_0_2_0, s_1_0_2_1, s_1_0_2_2, s_1_0_2_3;
    logic  [9:0] s_1_0_2_0_reg, s_1_0_2_1_reg, s_1_0_2_2_reg, s_1_0_2_3_reg;
    logic [11:0] sum_1_0;
    logic [11:0] sum_1_0_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_0)) 
    rom_1_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_0_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_1)) 
    rom_1_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_0_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_2)) 
    rom_1_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_0_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_3)) 
    rom_1_0_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_0_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_5)) 
    rom_1_0_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_0_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_6)) 
    rom_1_0_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_0_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_8)) 
    rom_1_0_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_0_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_10)) 
    rom_1_0_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_0_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_11)) 
    rom_1_0_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_0_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_12)) 
    rom_1_0_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_0_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_14)) 
    rom_1_0_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_0_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_16)) 
    rom_1_0_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_0_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_17)) 
    rom_1_0_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_0_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_18)) 
    rom_1_0_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_0_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_19)) 
    rom_1_0_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_0_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_20)) 
    rom_1_0_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_0_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_23)) 
    rom_1_0_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_0_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_24)) 
    rom_1_0_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_0_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_25)) 
    rom_1_0_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_0_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_26)) 
    rom_1_0_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_0_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_27)) 
    rom_1_0_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_0_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_28)) 
    rom_1_0_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_0_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_29)) 
    rom_1_0_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_0_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_30)) 
    rom_1_0_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_0_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_31)) 
    rom_1_0_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_0_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_32)) 
    rom_1_0_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_0_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_33)) 
    rom_1_0_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_0_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_34)) 
    rom_1_0_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_0_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_38)) 
    rom_1_0_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_0_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_39)) 
    rom_1_0_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_0_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_40)) 
    rom_1_0_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_0_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_41)) 
    rom_1_0_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_0_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_42)) 
    rom_1_0_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_0_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_43)) 
    rom_1_0_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_0_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_45)) 
    rom_1_0_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_0_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_49)) 
    rom_1_0_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_0_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_50)) 
    rom_1_0_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_0_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_51)) 
    rom_1_0_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_0_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_53)) 
    rom_1_0_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_0_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_54)) 
    rom_1_0_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_0_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_55)) 
    rom_1_0_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_0_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_56)) 
    rom_1_0_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_0_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_57)) 
    rom_1_0_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_0_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_58)) 
    rom_1_0_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_0_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_59)) 
    rom_1_0_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_0_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_60)) 
    rom_1_0_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_0_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_61)) 
    rom_1_0_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_0_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_62)) 
    rom_1_0_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_0_62));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_63)) 
    rom_1_0_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_0_63));

  // Stage 1
    assign s_1_0_1_0 = {{2{acts_1_0_0[5]}}, acts_1_0_0} + {{2{acts_1_0_1[5]}}, acts_1_0_1} + {{2{acts_1_0_2[5]}}, acts_1_0_2} + {{2{acts_1_0_3[5]}}, acts_1_0_3};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_0), .q(s_1_0_1_0_reg));

    assign s_1_0_1_1 = {{2{acts_1_0_5[5]}}, acts_1_0_5} + {{2{acts_1_0_6[5]}}, acts_1_0_6} + {{2{acts_1_0_8[5]}}, acts_1_0_8} + {{2{acts_1_0_10[5]}}, acts_1_0_10};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_1), .q(s_1_0_1_1_reg));

    assign s_1_0_1_2 = {{2{acts_1_0_11[5]}}, acts_1_0_11} + {{2{acts_1_0_12[5]}}, acts_1_0_12} + {{2{acts_1_0_14[5]}}, acts_1_0_14} + {{2{acts_1_0_16[5]}}, acts_1_0_16};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_2), .q(s_1_0_1_2_reg));

    assign s_1_0_1_3 = {{2{acts_1_0_17[5]}}, acts_1_0_17} + {{2{acts_1_0_18[5]}}, acts_1_0_18} + {{2{acts_1_0_19[5]}}, acts_1_0_19} + {{2{acts_1_0_20[5]}}, acts_1_0_20};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_3), .q(s_1_0_1_3_reg));

    assign s_1_0_1_4 = {{2{acts_1_0_23[5]}}, acts_1_0_23} + {{2{acts_1_0_24[5]}}, acts_1_0_24} + {{2{acts_1_0_25[5]}}, acts_1_0_25} + {{2{acts_1_0_26[5]}}, acts_1_0_26};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_4), .q(s_1_0_1_4_reg));

    assign s_1_0_1_5 = {{2{acts_1_0_27[5]}}, acts_1_0_27} + {{2{acts_1_0_28[5]}}, acts_1_0_28} + {{2{acts_1_0_29[5]}}, acts_1_0_29} + {{2{acts_1_0_30[5]}}, acts_1_0_30};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_5), .q(s_1_0_1_5_reg));

    assign s_1_0_1_6 = {{2{acts_1_0_31[5]}}, acts_1_0_31} + {{2{acts_1_0_32[5]}}, acts_1_0_32} + {{2{acts_1_0_33[5]}}, acts_1_0_33} + {{2{acts_1_0_34[5]}}, acts_1_0_34};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_6), .q(s_1_0_1_6_reg));

    assign s_1_0_1_7 = {{2{acts_1_0_38[5]}}, acts_1_0_38} + {{2{acts_1_0_39[5]}}, acts_1_0_39} + {{2{acts_1_0_40[5]}}, acts_1_0_40} + {{2{acts_1_0_41[5]}}, acts_1_0_41};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_7), .q(s_1_0_1_7_reg));

    assign s_1_0_1_8 = {{2{acts_1_0_42[5]}}, acts_1_0_42} + {{2{acts_1_0_43[5]}}, acts_1_0_43} + {{2{acts_1_0_45[5]}}, acts_1_0_45} + {{2{acts_1_0_49[5]}}, acts_1_0_49};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_8), .q(s_1_0_1_8_reg));

    assign s_1_0_1_9 = {{2{acts_1_0_50[5]}}, acts_1_0_50} + {{2{acts_1_0_51[5]}}, acts_1_0_51} + {{2{acts_1_0_53[5]}}, acts_1_0_53} + {{2{acts_1_0_54[5]}}, acts_1_0_54};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_9), .q(s_1_0_1_9_reg));

    assign s_1_0_1_10 = {{2{acts_1_0_55[5]}}, acts_1_0_55} + {{2{acts_1_0_56[5]}}, acts_1_0_56} + {{2{acts_1_0_57[5]}}, acts_1_0_57} + {{2{acts_1_0_58[5]}}, acts_1_0_58};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_10), .q(s_1_0_1_10_reg));

    assign s_1_0_1_11 = {{2{acts_1_0_59[5]}}, acts_1_0_59} + {{2{acts_1_0_60[5]}}, acts_1_0_60} + {{2{acts_1_0_61[5]}}, acts_1_0_61} + {{2{acts_1_0_62[5]}}, acts_1_0_62};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_11), .q(s_1_0_1_11_reg));

    assign s_1_0_1_12 = {{2{acts_1_0_63[5]}}, acts_1_0_63};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_12), .q(s_1_0_1_12_reg));

  // Stage 2
    assign s_1_0_2_0 = {{2{s_1_0_1_0_reg[7]}}, s_1_0_1_0_reg} + {{2{s_1_0_1_1_reg[7]}}, s_1_0_1_1_reg} + {{2{s_1_0_1_2_reg[7]}}, s_1_0_1_2_reg} + {{2{s_1_0_1_3_reg[7]}}, s_1_0_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_0_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_2_0), .q(s_1_0_2_0_reg));

    assign s_1_0_2_1 = {{2{s_1_0_1_4_reg[7]}}, s_1_0_1_4_reg} + {{2{s_1_0_1_5_reg[7]}}, s_1_0_1_5_reg} + {{2{s_1_0_1_6_reg[7]}}, s_1_0_1_6_reg} + {{2{s_1_0_1_7_reg[7]}}, s_1_0_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_0_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_2_1), .q(s_1_0_2_1_reg));

    assign s_1_0_2_2 = {{2{s_1_0_1_8_reg[7]}}, s_1_0_1_8_reg} + {{2{s_1_0_1_9_reg[7]}}, s_1_0_1_9_reg} + {{2{s_1_0_1_10_reg[7]}}, s_1_0_1_10_reg} + {{2{s_1_0_1_11_reg[7]}}, s_1_0_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_0_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_2_2), .q(s_1_0_2_2_reg));

    assign s_1_0_2_3 = {{2{s_1_0_1_12_reg[7]}}, s_1_0_1_12_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_0_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_2_3), .q(s_1_0_2_3_reg));

  // Stage 3
    assign sum_1_0 = {{2{s_1_0_2_0_reg[9]}}, s_1_0_2_0_reg} + {{2{s_1_0_2_1_reg[9]}}, s_1_0_2_1_reg} + {{2{s_1_0_2_2_reg[9]}}, s_1_0_2_2_reg} + {{2{s_1_0_2_3_reg[9]}}, s_1_0_2_3_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_0), .q(sum_1_0_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_0 (.i_data(sum_1_0_reg), .o_data(o_vector[0]));


    // Layer 1, Node 1
      logic  [7:0] s_1_1_1_0, s_1_1_1_1, s_1_1_1_2, s_1_1_1_3, s_1_1_1_4, s_1_1_1_5, s_1_1_1_6, s_1_1_1_7, s_1_1_1_8, s_1_1_1_9, s_1_1_1_10, s_1_1_1_11, s_1_1_1_12;
    logic  [7:0] s_1_1_1_0_reg, s_1_1_1_1_reg, s_1_1_1_2_reg, s_1_1_1_3_reg, s_1_1_1_4_reg, s_1_1_1_5_reg, s_1_1_1_6_reg, s_1_1_1_7_reg, s_1_1_1_8_reg, s_1_1_1_9_reg, s_1_1_1_10_reg, s_1_1_1_11_reg, s_1_1_1_12_reg;
    logic  [9:0] s_1_1_2_0, s_1_1_2_1, s_1_1_2_2, s_1_1_2_3;
    logic  [9:0] s_1_1_2_0_reg, s_1_1_2_1_reg, s_1_1_2_2_reg, s_1_1_2_3_reg;
    logic [11:0] sum_1_1;
    logic [11:0] sum_1_1_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_0)) 
    rom_1_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_1_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_1)) 
    rom_1_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_1_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_3)) 
    rom_1_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_1_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_4)) 
    rom_1_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_1_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_5)) 
    rom_1_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_1_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_6)) 
    rom_1_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_1_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_7)) 
    rom_1_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_1_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_8)) 
    rom_1_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_1_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_9)) 
    rom_1_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_1_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_11)) 
    rom_1_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_1_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_12)) 
    rom_1_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_1_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_17)) 
    rom_1_1_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_1_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_18)) 
    rom_1_1_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_1_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_19)) 
    rom_1_1_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_1_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_20)) 
    rom_1_1_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_1_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_21)) 
    rom_1_1_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_1_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_22)) 
    rom_1_1_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_1_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_24)) 
    rom_1_1_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_1_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_25)) 
    rom_1_1_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_1_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_27)) 
    rom_1_1_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_1_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_28)) 
    rom_1_1_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_1_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_29)) 
    rom_1_1_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_1_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_30)) 
    rom_1_1_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_1_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_31)) 
    rom_1_1_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_1_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_32)) 
    rom_1_1_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_1_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_33)) 
    rom_1_1_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_1_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_34)) 
    rom_1_1_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_1_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_35)) 
    rom_1_1_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_1_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_37)) 
    rom_1_1_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_1_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_40)) 
    rom_1_1_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_1_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_41)) 
    rom_1_1_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_1_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_42)) 
    rom_1_1_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_1_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_43)) 
    rom_1_1_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_1_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_45)) 
    rom_1_1_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_1_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_47)) 
    rom_1_1_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_1_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_48)) 
    rom_1_1_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_1_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_49)) 
    rom_1_1_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_1_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_50)) 
    rom_1_1_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_1_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_51)) 
    rom_1_1_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_1_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_52)) 
    rom_1_1_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_1_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_53)) 
    rom_1_1_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_1_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_54)) 
    rom_1_1_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_1_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_55)) 
    rom_1_1_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_1_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_56)) 
    rom_1_1_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_1_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_57)) 
    rom_1_1_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_1_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_58)) 
    rom_1_1_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_1_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_59)) 
    rom_1_1_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_1_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_62)) 
    rom_1_1_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_1_62));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_63)) 
    rom_1_1_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_1_63));

  // Stage 1
    assign s_1_1_1_0 = {{2{acts_1_1_0[5]}}, acts_1_1_0} + {{2{acts_1_1_1[5]}}, acts_1_1_1} + {{2{acts_1_1_3[5]}}, acts_1_1_3} + {{2{acts_1_1_4[5]}}, acts_1_1_4};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_0), .q(s_1_1_1_0_reg));

    assign s_1_1_1_1 = {{2{acts_1_1_5[5]}}, acts_1_1_5} + {{2{acts_1_1_6[5]}}, acts_1_1_6} + {{2{acts_1_1_7[5]}}, acts_1_1_7} + {{2{acts_1_1_8[5]}}, acts_1_1_8};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_1), .q(s_1_1_1_1_reg));

    assign s_1_1_1_2 = {{2{acts_1_1_9[5]}}, acts_1_1_9} + {{2{acts_1_1_11[5]}}, acts_1_1_11} + {{2{acts_1_1_12[5]}}, acts_1_1_12} + {{2{acts_1_1_17[5]}}, acts_1_1_17};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_2), .q(s_1_1_1_2_reg));

    assign s_1_1_1_3 = {{2{acts_1_1_18[5]}}, acts_1_1_18} + {{2{acts_1_1_19[5]}}, acts_1_1_19} + {{2{acts_1_1_20[5]}}, acts_1_1_20} + {{2{acts_1_1_21[5]}}, acts_1_1_21};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_3), .q(s_1_1_1_3_reg));

    assign s_1_1_1_4 = {{2{acts_1_1_22[5]}}, acts_1_1_22} + {{2{acts_1_1_24[5]}}, acts_1_1_24} + {{2{acts_1_1_25[5]}}, acts_1_1_25} + {{2{acts_1_1_27[5]}}, acts_1_1_27};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_4), .q(s_1_1_1_4_reg));

    assign s_1_1_1_5 = {{2{acts_1_1_28[5]}}, acts_1_1_28} + {{2{acts_1_1_29[5]}}, acts_1_1_29} + {{2{acts_1_1_30[5]}}, acts_1_1_30} + {{2{acts_1_1_31[5]}}, acts_1_1_31};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_5), .q(s_1_1_1_5_reg));

    assign s_1_1_1_6 = {{2{acts_1_1_32[5]}}, acts_1_1_32} + {{2{acts_1_1_33[5]}}, acts_1_1_33} + {{2{acts_1_1_34[5]}}, acts_1_1_34} + {{2{acts_1_1_35[5]}}, acts_1_1_35};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_6), .q(s_1_1_1_6_reg));

    assign s_1_1_1_7 = {{2{acts_1_1_37[5]}}, acts_1_1_37} + {{2{acts_1_1_40[5]}}, acts_1_1_40} + {{2{acts_1_1_41[5]}}, acts_1_1_41} + {{2{acts_1_1_42[5]}}, acts_1_1_42};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_7), .q(s_1_1_1_7_reg));

    assign s_1_1_1_8 = {{2{acts_1_1_43[5]}}, acts_1_1_43} + {{2{acts_1_1_45[5]}}, acts_1_1_45} + {{2{acts_1_1_47[5]}}, acts_1_1_47} + {{2{acts_1_1_48[5]}}, acts_1_1_48};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_8), .q(s_1_1_1_8_reg));

    assign s_1_1_1_9 = {{2{acts_1_1_49[5]}}, acts_1_1_49} + {{2{acts_1_1_50[5]}}, acts_1_1_50} + {{2{acts_1_1_51[5]}}, acts_1_1_51} + {{2{acts_1_1_52[5]}}, acts_1_1_52};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_9), .q(s_1_1_1_9_reg));

    assign s_1_1_1_10 = {{2{acts_1_1_53[5]}}, acts_1_1_53} + {{2{acts_1_1_54[5]}}, acts_1_1_54} + {{2{acts_1_1_55[5]}}, acts_1_1_55} + {{2{acts_1_1_56[5]}}, acts_1_1_56};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_10), .q(s_1_1_1_10_reg));

    assign s_1_1_1_11 = {{2{acts_1_1_57[5]}}, acts_1_1_57} + {{2{acts_1_1_58[5]}}, acts_1_1_58} + {{2{acts_1_1_59[5]}}, acts_1_1_59} + {{2{acts_1_1_62[5]}}, acts_1_1_62};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_11), .q(s_1_1_1_11_reg));

    assign s_1_1_1_12 = {{2{acts_1_1_63[5]}}, acts_1_1_63};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_12), .q(s_1_1_1_12_reg));

  // Stage 2
    assign s_1_1_2_0 = {{2{s_1_1_1_0_reg[7]}}, s_1_1_1_0_reg} + {{2{s_1_1_1_1_reg[7]}}, s_1_1_1_1_reg} + {{2{s_1_1_1_2_reg[7]}}, s_1_1_1_2_reg} + {{2{s_1_1_1_3_reg[7]}}, s_1_1_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_1_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_2_0), .q(s_1_1_2_0_reg));

    assign s_1_1_2_1 = {{2{s_1_1_1_4_reg[7]}}, s_1_1_1_4_reg} + {{2{s_1_1_1_5_reg[7]}}, s_1_1_1_5_reg} + {{2{s_1_1_1_6_reg[7]}}, s_1_1_1_6_reg} + {{2{s_1_1_1_7_reg[7]}}, s_1_1_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_1_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_2_1), .q(s_1_1_2_1_reg));

    assign s_1_1_2_2 = {{2{s_1_1_1_8_reg[7]}}, s_1_1_1_8_reg} + {{2{s_1_1_1_9_reg[7]}}, s_1_1_1_9_reg} + {{2{s_1_1_1_10_reg[7]}}, s_1_1_1_10_reg} + {{2{s_1_1_1_11_reg[7]}}, s_1_1_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_1_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_2_2), .q(s_1_1_2_2_reg));

    assign s_1_1_2_3 = {{2{s_1_1_1_12_reg[7]}}, s_1_1_1_12_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_1_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_2_3), .q(s_1_1_2_3_reg));

  // Stage 3
    assign sum_1_1 = {{2{s_1_1_2_0_reg[9]}}, s_1_1_2_0_reg} + {{2{s_1_1_2_1_reg[9]}}, s_1_1_2_1_reg} + {{2{s_1_1_2_2_reg[9]}}, s_1_1_2_2_reg} + {{2{s_1_1_2_3_reg[9]}}, s_1_1_2_3_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_1), .q(sum_1_1_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_1 (.i_data(sum_1_1_reg), .o_data(o_vector[1]));


    // Layer 1, Node 2
      logic  [7:0] s_1_2_1_0, s_1_2_1_1, s_1_2_1_2, s_1_2_1_3, s_1_2_1_4, s_1_2_1_5, s_1_2_1_6, s_1_2_1_7, s_1_2_1_8, s_1_2_1_9, s_1_2_1_10, s_1_2_1_11;
    logic  [7:0] s_1_2_1_0_reg, s_1_2_1_1_reg, s_1_2_1_2_reg, s_1_2_1_3_reg, s_1_2_1_4_reg, s_1_2_1_5_reg, s_1_2_1_6_reg, s_1_2_1_7_reg, s_1_2_1_8_reg, s_1_2_1_9_reg, s_1_2_1_10_reg, s_1_2_1_11_reg;
    logic  [9:0] s_1_2_2_0, s_1_2_2_1, s_1_2_2_2;
    logic  [9:0] s_1_2_2_0_reg, s_1_2_2_1_reg, s_1_2_2_2_reg;
    logic [11:0] sum_1_2;
    logic [11:0] sum_1_2_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_0)) 
    rom_1_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_2_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_1)) 
    rom_1_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_2_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_2)) 
    rom_1_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_2_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_3)) 
    rom_1_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_2_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_4)) 
    rom_1_2_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_2_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_5)) 
    rom_1_2_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_2_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_6)) 
    rom_1_2_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_2_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_8)) 
    rom_1_2_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_2_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_9)) 
    rom_1_2_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_2_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_10)) 
    rom_1_2_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_2_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_11)) 
    rom_1_2_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_2_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_12)) 
    rom_1_2_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_2_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_14)) 
    rom_1_2_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_2_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_15)) 
    rom_1_2_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_2_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_16)) 
    rom_1_2_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_2_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_19)) 
    rom_1_2_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_2_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_20)) 
    rom_1_2_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_2_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_21)) 
    rom_1_2_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_2_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_24)) 
    rom_1_2_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_2_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_26)) 
    rom_1_2_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_2_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_27)) 
    rom_1_2_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_2_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_29)) 
    rom_1_2_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_2_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_31)) 
    rom_1_2_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_2_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_32)) 
    rom_1_2_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_2_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_33)) 
    rom_1_2_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_2_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_34)) 
    rom_1_2_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_2_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_35)) 
    rom_1_2_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_2_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_38)) 
    rom_1_2_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_2_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_39)) 
    rom_1_2_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_2_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_41)) 
    rom_1_2_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_2_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_43)) 
    rom_1_2_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_2_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_45)) 
    rom_1_2_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_2_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_46)) 
    rom_1_2_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_2_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_48)) 
    rom_1_2_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_2_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_50)) 
    rom_1_2_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_2_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_51)) 
    rom_1_2_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_2_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_52)) 
    rom_1_2_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_2_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_53)) 
    rom_1_2_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_2_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_54)) 
    rom_1_2_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_2_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_55)) 
    rom_1_2_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_2_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_56)) 
    rom_1_2_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_2_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_57)) 
    rom_1_2_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_2_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_59)) 
    rom_1_2_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_2_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_60)) 
    rom_1_2_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_2_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_61)) 
    rom_1_2_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_2_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_62)) 
    rom_1_2_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_2_62));

  // Stage 1
    assign s_1_2_1_0 = {{2{acts_1_2_0[5]}}, acts_1_2_0} + {{2{acts_1_2_1[5]}}, acts_1_2_1} + {{2{acts_1_2_2[5]}}, acts_1_2_2} + {{2{acts_1_2_3[5]}}, acts_1_2_3};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_0), .q(s_1_2_1_0_reg));

    assign s_1_2_1_1 = {{2{acts_1_2_4[5]}}, acts_1_2_4} + {{2{acts_1_2_5[5]}}, acts_1_2_5} + {{2{acts_1_2_6[5]}}, acts_1_2_6} + {{2{acts_1_2_8[5]}}, acts_1_2_8};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_1), .q(s_1_2_1_1_reg));

    assign s_1_2_1_2 = {{2{acts_1_2_9[5]}}, acts_1_2_9} + {{2{acts_1_2_10[5]}}, acts_1_2_10} + {{2{acts_1_2_11[5]}}, acts_1_2_11} + {{2{acts_1_2_12[5]}}, acts_1_2_12};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_2), .q(s_1_2_1_2_reg));

    assign s_1_2_1_3 = {{2{acts_1_2_14[5]}}, acts_1_2_14} + {{2{acts_1_2_15[5]}}, acts_1_2_15} + {{2{acts_1_2_16[5]}}, acts_1_2_16} + {{2{acts_1_2_19[5]}}, acts_1_2_19};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_3), .q(s_1_2_1_3_reg));

    assign s_1_2_1_4 = {{2{acts_1_2_20[5]}}, acts_1_2_20} + {{2{acts_1_2_21[5]}}, acts_1_2_21} + {{2{acts_1_2_24[5]}}, acts_1_2_24} + {{2{acts_1_2_26[5]}}, acts_1_2_26};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_4), .q(s_1_2_1_4_reg));

    assign s_1_2_1_5 = {{2{acts_1_2_27[5]}}, acts_1_2_27} + {{2{acts_1_2_29[5]}}, acts_1_2_29} + {{2{acts_1_2_31[5]}}, acts_1_2_31} + {{2{acts_1_2_32[5]}}, acts_1_2_32};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_5), .q(s_1_2_1_5_reg));

    assign s_1_2_1_6 = {{2{acts_1_2_33[5]}}, acts_1_2_33} + {{2{acts_1_2_34[5]}}, acts_1_2_34} + {{2{acts_1_2_35[5]}}, acts_1_2_35} + {{2{acts_1_2_38[5]}}, acts_1_2_38};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_6), .q(s_1_2_1_6_reg));

    assign s_1_2_1_7 = {{2{acts_1_2_39[5]}}, acts_1_2_39} + {{2{acts_1_2_41[5]}}, acts_1_2_41} + {{2{acts_1_2_43[5]}}, acts_1_2_43} + {{2{acts_1_2_45[5]}}, acts_1_2_45};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_7), .q(s_1_2_1_7_reg));

    assign s_1_2_1_8 = {{2{acts_1_2_46[5]}}, acts_1_2_46} + {{2{acts_1_2_48[5]}}, acts_1_2_48} + {{2{acts_1_2_50[5]}}, acts_1_2_50} + {{2{acts_1_2_51[5]}}, acts_1_2_51};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_8), .q(s_1_2_1_8_reg));

    assign s_1_2_1_9 = {{2{acts_1_2_52[5]}}, acts_1_2_52} + {{2{acts_1_2_53[5]}}, acts_1_2_53} + {{2{acts_1_2_54[5]}}, acts_1_2_54} + {{2{acts_1_2_55[5]}}, acts_1_2_55};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_9), .q(s_1_2_1_9_reg));

    assign s_1_2_1_10 = {{2{acts_1_2_56[5]}}, acts_1_2_56} + {{2{acts_1_2_57[5]}}, acts_1_2_57} + {{2{acts_1_2_59[5]}}, acts_1_2_59} + {{2{acts_1_2_60[5]}}, acts_1_2_60};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_10), .q(s_1_2_1_10_reg));

    assign s_1_2_1_11 = {{2{acts_1_2_61[5]}}, acts_1_2_61} + {{2{acts_1_2_62[5]}}, acts_1_2_62};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_11), .q(s_1_2_1_11_reg));

  // Stage 2
    assign s_1_2_2_0 = {{2{s_1_2_1_0_reg[7]}}, s_1_2_1_0_reg} + {{2{s_1_2_1_1_reg[7]}}, s_1_2_1_1_reg} + {{2{s_1_2_1_2_reg[7]}}, s_1_2_1_2_reg} + {{2{s_1_2_1_3_reg[7]}}, s_1_2_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_2_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_2_0), .q(s_1_2_2_0_reg));

    assign s_1_2_2_1 = {{2{s_1_2_1_4_reg[7]}}, s_1_2_1_4_reg} + {{2{s_1_2_1_5_reg[7]}}, s_1_2_1_5_reg} + {{2{s_1_2_1_6_reg[7]}}, s_1_2_1_6_reg} + {{2{s_1_2_1_7_reg[7]}}, s_1_2_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_2_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_2_1), .q(s_1_2_2_1_reg));

    assign s_1_2_2_2 = {{2{s_1_2_1_8_reg[7]}}, s_1_2_1_8_reg} + {{2{s_1_2_1_9_reg[7]}}, s_1_2_1_9_reg} + {{2{s_1_2_1_10_reg[7]}}, s_1_2_1_10_reg} + {{2{s_1_2_1_11_reg[7]}}, s_1_2_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_2_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_2_2), .q(s_1_2_2_2_reg));

  // Stage 3
    assign sum_1_2 = {{2{s_1_2_2_0_reg[9]}}, s_1_2_2_0_reg} + {{2{s_1_2_2_1_reg[9]}}, s_1_2_2_1_reg} + {{2{s_1_2_2_2_reg[9]}}, s_1_2_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_2), .q(sum_1_2_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_2 (.i_data(sum_1_2_reg), .o_data(o_vector[2]));


    // Layer 1, Node 3
      logic  [7:0] s_1_3_1_0, s_1_3_1_1, s_1_3_1_2, s_1_3_1_3, s_1_3_1_4, s_1_3_1_5, s_1_3_1_6, s_1_3_1_7, s_1_3_1_8, s_1_3_1_9, s_1_3_1_10, s_1_3_1_11;
    logic  [7:0] s_1_3_1_0_reg, s_1_3_1_1_reg, s_1_3_1_2_reg, s_1_3_1_3_reg, s_1_3_1_4_reg, s_1_3_1_5_reg, s_1_3_1_6_reg, s_1_3_1_7_reg, s_1_3_1_8_reg, s_1_3_1_9_reg, s_1_3_1_10_reg, s_1_3_1_11_reg;
    logic  [9:0] s_1_3_2_0, s_1_3_2_1, s_1_3_2_2;
    logic  [9:0] s_1_3_2_0_reg, s_1_3_2_1_reg, s_1_3_2_2_reg;
    logic [11:0] sum_1_3;
    logic [11:0] sum_1_3_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_0)) 
    rom_1_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_3_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_1)) 
    rom_1_3_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_3_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_2)) 
    rom_1_3_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_3_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_3)) 
    rom_1_3_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_3_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_5)) 
    rom_1_3_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_3_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_6)) 
    rom_1_3_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_3_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_7)) 
    rom_1_3_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_3_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_9)) 
    rom_1_3_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_3_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_11)) 
    rom_1_3_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_3_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_12)) 
    rom_1_3_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_3_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_13)) 
    rom_1_3_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_3_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_14)) 
    rom_1_3_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_3_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_16)) 
    rom_1_3_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_3_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_17)) 
    rom_1_3_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_3_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_19)) 
    rom_1_3_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_3_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_20)) 
    rom_1_3_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_3_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_21)) 
    rom_1_3_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_3_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_22)) 
    rom_1_3_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_3_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_23)) 
    rom_1_3_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_3_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_24)) 
    rom_1_3_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_3_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_25)) 
    rom_1_3_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_3_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_28)) 
    rom_1_3_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_3_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_29)) 
    rom_1_3_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_3_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_30)) 
    rom_1_3_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_3_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_31)) 
    rom_1_3_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_3_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_32)) 
    rom_1_3_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_3_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_34)) 
    rom_1_3_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_3_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_35)) 
    rom_1_3_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_3_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_38)) 
    rom_1_3_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_3_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_40)) 
    rom_1_3_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_3_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_41)) 
    rom_1_3_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_3_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_42)) 
    rom_1_3_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_3_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_43)) 
    rom_1_3_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_3_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_46)) 
    rom_1_3_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_3_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_47)) 
    rom_1_3_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_3_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_49)) 
    rom_1_3_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_3_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_50)) 
    rom_1_3_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_3_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_51)) 
    rom_1_3_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_3_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_52)) 
    rom_1_3_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_3_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_54)) 
    rom_1_3_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_3_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_55)) 
    rom_1_3_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_3_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_56)) 
    rom_1_3_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_3_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_57)) 
    rom_1_3_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_3_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_58)) 
    rom_1_3_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_3_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_59)) 
    rom_1_3_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_3_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_60)) 
    rom_1_3_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_3_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_61)) 
    rom_1_3_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_3_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_63)) 
    rom_1_3_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_3_63));

  // Stage 1
    assign s_1_3_1_0 = {{2{acts_1_3_0[5]}}, acts_1_3_0} + {{2{acts_1_3_1[5]}}, acts_1_3_1} + {{2{acts_1_3_2[5]}}, acts_1_3_2} + {{2{acts_1_3_3[5]}}, acts_1_3_3};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_0), .q(s_1_3_1_0_reg));

    assign s_1_3_1_1 = {{2{acts_1_3_5[5]}}, acts_1_3_5} + {{2{acts_1_3_6[5]}}, acts_1_3_6} + {{2{acts_1_3_7[5]}}, acts_1_3_7} + {{2{acts_1_3_9[5]}}, acts_1_3_9};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_1), .q(s_1_3_1_1_reg));

    assign s_1_3_1_2 = {{2{acts_1_3_11[5]}}, acts_1_3_11} + {{2{acts_1_3_12[5]}}, acts_1_3_12} + {{2{acts_1_3_13[5]}}, acts_1_3_13} + {{2{acts_1_3_14[5]}}, acts_1_3_14};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_2), .q(s_1_3_1_2_reg));

    assign s_1_3_1_3 = {{2{acts_1_3_16[5]}}, acts_1_3_16} + {{2{acts_1_3_17[5]}}, acts_1_3_17} + {{2{acts_1_3_19[5]}}, acts_1_3_19} + {{2{acts_1_3_20[5]}}, acts_1_3_20};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_3), .q(s_1_3_1_3_reg));

    assign s_1_3_1_4 = {{2{acts_1_3_21[5]}}, acts_1_3_21} + {{2{acts_1_3_22[5]}}, acts_1_3_22} + {{2{acts_1_3_23[5]}}, acts_1_3_23} + {{2{acts_1_3_24[5]}}, acts_1_3_24};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_4), .q(s_1_3_1_4_reg));

    assign s_1_3_1_5 = {{2{acts_1_3_25[5]}}, acts_1_3_25} + {{2{acts_1_3_28[5]}}, acts_1_3_28} + {{2{acts_1_3_29[5]}}, acts_1_3_29} + {{2{acts_1_3_30[5]}}, acts_1_3_30};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_5), .q(s_1_3_1_5_reg));

    assign s_1_3_1_6 = {{2{acts_1_3_31[5]}}, acts_1_3_31} + {{2{acts_1_3_32[5]}}, acts_1_3_32} + {{2{acts_1_3_34[5]}}, acts_1_3_34} + {{2{acts_1_3_35[5]}}, acts_1_3_35};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_6), .q(s_1_3_1_6_reg));

    assign s_1_3_1_7 = {{2{acts_1_3_38[5]}}, acts_1_3_38} + {{2{acts_1_3_40[5]}}, acts_1_3_40} + {{2{acts_1_3_41[5]}}, acts_1_3_41} + {{2{acts_1_3_42[5]}}, acts_1_3_42};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_7), .q(s_1_3_1_7_reg));

    assign s_1_3_1_8 = {{2{acts_1_3_43[5]}}, acts_1_3_43} + {{2{acts_1_3_46[5]}}, acts_1_3_46} + {{2{acts_1_3_47[5]}}, acts_1_3_47} + {{2{acts_1_3_49[5]}}, acts_1_3_49};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_8), .q(s_1_3_1_8_reg));

    assign s_1_3_1_9 = {{2{acts_1_3_50[5]}}, acts_1_3_50} + {{2{acts_1_3_51[5]}}, acts_1_3_51} + {{2{acts_1_3_52[5]}}, acts_1_3_52} + {{2{acts_1_3_54[5]}}, acts_1_3_54};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_9), .q(s_1_3_1_9_reg));

    assign s_1_3_1_10 = {{2{acts_1_3_55[5]}}, acts_1_3_55} + {{2{acts_1_3_56[5]}}, acts_1_3_56} + {{2{acts_1_3_57[5]}}, acts_1_3_57} + {{2{acts_1_3_58[5]}}, acts_1_3_58};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_10), .q(s_1_3_1_10_reg));

    assign s_1_3_1_11 = {{2{acts_1_3_59[5]}}, acts_1_3_59} + {{2{acts_1_3_60[5]}}, acts_1_3_60} + {{2{acts_1_3_61[5]}}, acts_1_3_61} + {{2{acts_1_3_63[5]}}, acts_1_3_63};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_11), .q(s_1_3_1_11_reg));

  // Stage 2
    assign s_1_3_2_0 = {{2{s_1_3_1_0_reg[7]}}, s_1_3_1_0_reg} + {{2{s_1_3_1_1_reg[7]}}, s_1_3_1_1_reg} + {{2{s_1_3_1_2_reg[7]}}, s_1_3_1_2_reg} + {{2{s_1_3_1_3_reg[7]}}, s_1_3_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_3_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_2_0), .q(s_1_3_2_0_reg));

    assign s_1_3_2_1 = {{2{s_1_3_1_4_reg[7]}}, s_1_3_1_4_reg} + {{2{s_1_3_1_5_reg[7]}}, s_1_3_1_5_reg} + {{2{s_1_3_1_6_reg[7]}}, s_1_3_1_6_reg} + {{2{s_1_3_1_7_reg[7]}}, s_1_3_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_3_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_2_1), .q(s_1_3_2_1_reg));

    assign s_1_3_2_2 = {{2{s_1_3_1_8_reg[7]}}, s_1_3_1_8_reg} + {{2{s_1_3_1_9_reg[7]}}, s_1_3_1_9_reg} + {{2{s_1_3_1_10_reg[7]}}, s_1_3_1_10_reg} + {{2{s_1_3_1_11_reg[7]}}, s_1_3_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_3_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_2_2), .q(s_1_3_2_2_reg));

  // Stage 3
    assign sum_1_3 = {{2{s_1_3_2_0_reg[9]}}, s_1_3_2_0_reg} + {{2{s_1_3_2_1_reg[9]}}, s_1_3_2_1_reg} + {{2{s_1_3_2_2_reg[9]}}, s_1_3_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_3), .q(sum_1_3_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_3 (.i_data(sum_1_3_reg), .o_data(o_vector[3]));


    // Layer 1, Node 4
      logic  [7:0] s_1_4_1_0, s_1_4_1_1, s_1_4_1_2, s_1_4_1_3, s_1_4_1_4, s_1_4_1_5, s_1_4_1_6, s_1_4_1_7, s_1_4_1_8, s_1_4_1_9, s_1_4_1_10, s_1_4_1_11;
    logic  [7:0] s_1_4_1_0_reg, s_1_4_1_1_reg, s_1_4_1_2_reg, s_1_4_1_3_reg, s_1_4_1_4_reg, s_1_4_1_5_reg, s_1_4_1_6_reg, s_1_4_1_7_reg, s_1_4_1_8_reg, s_1_4_1_9_reg, s_1_4_1_10_reg, s_1_4_1_11_reg;
    logic  [9:0] s_1_4_2_0, s_1_4_2_1, s_1_4_2_2;
    logic  [9:0] s_1_4_2_0_reg, s_1_4_2_1_reg, s_1_4_2_2_reg;
    logic [11:0] sum_1_4;
    logic [11:0] sum_1_4_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_3)) 
    rom_1_4_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_4_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_4)) 
    rom_1_4_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_4_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_5)) 
    rom_1_4_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_4_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_6)) 
    rom_1_4_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_4_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_7)) 
    rom_1_4_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_4_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_8)) 
    rom_1_4_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_4_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_9)) 
    rom_1_4_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_4_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_11)) 
    rom_1_4_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_4_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_12)) 
    rom_1_4_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_4_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_14)) 
    rom_1_4_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_4_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_15)) 
    rom_1_4_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_4_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_16)) 
    rom_1_4_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_4_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_17)) 
    rom_1_4_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_4_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_18)) 
    rom_1_4_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_4_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_20)) 
    rom_1_4_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_4_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_21)) 
    rom_1_4_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_4_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_22)) 
    rom_1_4_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_4_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_23)) 
    rom_1_4_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_4_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_24)) 
    rom_1_4_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_4_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_25)) 
    rom_1_4_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_4_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_26)) 
    rom_1_4_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_4_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_28)) 
    rom_1_4_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_4_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_30)) 
    rom_1_4_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_4_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_31)) 
    rom_1_4_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_4_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_32)) 
    rom_1_4_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_4_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_35)) 
    rom_1_4_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_4_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_38)) 
    rom_1_4_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_4_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_39)) 
    rom_1_4_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_4_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_42)) 
    rom_1_4_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_4_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_44)) 
    rom_1_4_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_4_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_45)) 
    rom_1_4_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_4_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_46)) 
    rom_1_4_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_4_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_47)) 
    rom_1_4_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_4_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_48)) 
    rom_1_4_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_4_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_49)) 
    rom_1_4_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_4_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_50)) 
    rom_1_4_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_4_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_54)) 
    rom_1_4_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_4_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_56)) 
    rom_1_4_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_4_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_57)) 
    rom_1_4_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_4_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_58)) 
    rom_1_4_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_4_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_59)) 
    rom_1_4_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_4_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_60)) 
    rom_1_4_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_4_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_61)) 
    rom_1_4_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_4_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_62)) 
    rom_1_4_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_4_62));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_63)) 
    rom_1_4_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_4_63));

  // Stage 1
    assign s_1_4_1_0 = {{2{acts_1_4_3[5]}}, acts_1_4_3} + {{2{acts_1_4_4[5]}}, acts_1_4_4} + {{2{acts_1_4_5[5]}}, acts_1_4_5} + {{2{acts_1_4_6[5]}}, acts_1_4_6};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_0), .q(s_1_4_1_0_reg));

    assign s_1_4_1_1 = {{2{acts_1_4_7[5]}}, acts_1_4_7} + {{2{acts_1_4_8[5]}}, acts_1_4_8} + {{2{acts_1_4_9[5]}}, acts_1_4_9} + {{2{acts_1_4_11[5]}}, acts_1_4_11};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_1), .q(s_1_4_1_1_reg));

    assign s_1_4_1_2 = {{2{acts_1_4_12[5]}}, acts_1_4_12} + {{2{acts_1_4_14[5]}}, acts_1_4_14} + {{2{acts_1_4_15[5]}}, acts_1_4_15} + {{2{acts_1_4_16[5]}}, acts_1_4_16};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_2), .q(s_1_4_1_2_reg));

    assign s_1_4_1_3 = {{2{acts_1_4_17[5]}}, acts_1_4_17} + {{2{acts_1_4_18[5]}}, acts_1_4_18} + {{2{acts_1_4_20[5]}}, acts_1_4_20} + {{2{acts_1_4_21[5]}}, acts_1_4_21};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_3), .q(s_1_4_1_3_reg));

    assign s_1_4_1_4 = {{2{acts_1_4_22[5]}}, acts_1_4_22} + {{2{acts_1_4_23[5]}}, acts_1_4_23} + {{2{acts_1_4_24[5]}}, acts_1_4_24} + {{2{acts_1_4_25[5]}}, acts_1_4_25};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_4), .q(s_1_4_1_4_reg));

    assign s_1_4_1_5 = {{2{acts_1_4_26[5]}}, acts_1_4_26} + {{2{acts_1_4_28[5]}}, acts_1_4_28} + {{2{acts_1_4_30[5]}}, acts_1_4_30} + {{2{acts_1_4_31[5]}}, acts_1_4_31};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_5), .q(s_1_4_1_5_reg));

    assign s_1_4_1_6 = {{2{acts_1_4_32[5]}}, acts_1_4_32} + {{2{acts_1_4_35[5]}}, acts_1_4_35} + {{2{acts_1_4_38[5]}}, acts_1_4_38} + {{2{acts_1_4_39[5]}}, acts_1_4_39};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_6), .q(s_1_4_1_6_reg));

    assign s_1_4_1_7 = {{2{acts_1_4_42[5]}}, acts_1_4_42} + {{2{acts_1_4_44[5]}}, acts_1_4_44} + {{2{acts_1_4_45[5]}}, acts_1_4_45} + {{2{acts_1_4_46[5]}}, acts_1_4_46};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_7), .q(s_1_4_1_7_reg));

    assign s_1_4_1_8 = {{2{acts_1_4_47[5]}}, acts_1_4_47} + {{2{acts_1_4_48[5]}}, acts_1_4_48} + {{2{acts_1_4_49[5]}}, acts_1_4_49} + {{2{acts_1_4_50[5]}}, acts_1_4_50};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_8), .q(s_1_4_1_8_reg));

    assign s_1_4_1_9 = {{2{acts_1_4_54[5]}}, acts_1_4_54} + {{2{acts_1_4_56[5]}}, acts_1_4_56} + {{2{acts_1_4_57[5]}}, acts_1_4_57} + {{2{acts_1_4_58[5]}}, acts_1_4_58};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_9), .q(s_1_4_1_9_reg));

    assign s_1_4_1_10 = {{2{acts_1_4_59[5]}}, acts_1_4_59} + {{2{acts_1_4_60[5]}}, acts_1_4_60} + {{2{acts_1_4_61[5]}}, acts_1_4_61} + {{2{acts_1_4_62[5]}}, acts_1_4_62};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_10), .q(s_1_4_1_10_reg));

    assign s_1_4_1_11 = {{2{acts_1_4_63[5]}}, acts_1_4_63};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_11), .q(s_1_4_1_11_reg));

  // Stage 2
    assign s_1_4_2_0 = {{2{s_1_4_1_0_reg[7]}}, s_1_4_1_0_reg} + {{2{s_1_4_1_1_reg[7]}}, s_1_4_1_1_reg} + {{2{s_1_4_1_2_reg[7]}}, s_1_4_1_2_reg} + {{2{s_1_4_1_3_reg[7]}}, s_1_4_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_4_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_2_0), .q(s_1_4_2_0_reg));

    assign s_1_4_2_1 = {{2{s_1_4_1_4_reg[7]}}, s_1_4_1_4_reg} + {{2{s_1_4_1_5_reg[7]}}, s_1_4_1_5_reg} + {{2{s_1_4_1_6_reg[7]}}, s_1_4_1_6_reg} + {{2{s_1_4_1_7_reg[7]}}, s_1_4_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_4_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_2_1), .q(s_1_4_2_1_reg));

    assign s_1_4_2_2 = {{2{s_1_4_1_8_reg[7]}}, s_1_4_1_8_reg} + {{2{s_1_4_1_9_reg[7]}}, s_1_4_1_9_reg} + {{2{s_1_4_1_10_reg[7]}}, s_1_4_1_10_reg} + {{2{s_1_4_1_11_reg[7]}}, s_1_4_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_4_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_2_2), .q(s_1_4_2_2_reg));

  // Stage 3
    assign sum_1_4 = {{2{s_1_4_2_0_reg[9]}}, s_1_4_2_0_reg} + {{2{s_1_4_2_1_reg[9]}}, s_1_4_2_1_reg} + {{2{s_1_4_2_2_reg[9]}}, s_1_4_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_4), .q(sum_1_4_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_4 (.i_data(sum_1_4_reg), .o_data(o_vector[4]));


    // Layer 1, Node 5
      logic  [7:0] s_1_5_1_0, s_1_5_1_1, s_1_5_1_2, s_1_5_1_3, s_1_5_1_4, s_1_5_1_5, s_1_5_1_6, s_1_5_1_7, s_1_5_1_8, s_1_5_1_9, s_1_5_1_10, s_1_5_1_11, s_1_5_1_12;
    logic  [7:0] s_1_5_1_0_reg, s_1_5_1_1_reg, s_1_5_1_2_reg, s_1_5_1_3_reg, s_1_5_1_4_reg, s_1_5_1_5_reg, s_1_5_1_6_reg, s_1_5_1_7_reg, s_1_5_1_8_reg, s_1_5_1_9_reg, s_1_5_1_10_reg, s_1_5_1_11_reg, s_1_5_1_12_reg;
    logic  [9:0] s_1_5_2_0, s_1_5_2_1, s_1_5_2_2, s_1_5_2_3;
    logic  [9:0] s_1_5_2_0_reg, s_1_5_2_1_reg, s_1_5_2_2_reg, s_1_5_2_3_reg;
    logic [11:0] sum_1_5;
    logic [11:0] sum_1_5_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_0)) 
    rom_1_5_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_5_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_1)) 
    rom_1_5_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_5_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_2)) 
    rom_1_5_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_5_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_3)) 
    rom_1_5_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_5_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_4)) 
    rom_1_5_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_5_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_5)) 
    rom_1_5_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_5_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_6)) 
    rom_1_5_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_5_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_8)) 
    rom_1_5_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_5_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_9)) 
    rom_1_5_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_5_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_11)) 
    rom_1_5_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_5_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_12)) 
    rom_1_5_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_5_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_13)) 
    rom_1_5_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_5_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_14)) 
    rom_1_5_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_5_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_15)) 
    rom_1_5_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_5_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_16)) 
    rom_1_5_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_5_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_18)) 
    rom_1_5_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_5_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_19)) 
    rom_1_5_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_5_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_21)) 
    rom_1_5_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_5_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_22)) 
    rom_1_5_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_5_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_23)) 
    rom_1_5_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_5_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_24)) 
    rom_1_5_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_5_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_25)) 
    rom_1_5_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_5_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_26)) 
    rom_1_5_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_5_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_28)) 
    rom_1_5_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_5_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_29)) 
    rom_1_5_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_5_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_30)) 
    rom_1_5_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_5_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_31)) 
    rom_1_5_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_5_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_32)) 
    rom_1_5_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_5_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_33)) 
    rom_1_5_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_5_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_35)) 
    rom_1_5_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_5_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_40)) 
    rom_1_5_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_5_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_41)) 
    rom_1_5_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_5_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_42)) 
    rom_1_5_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_5_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_43)) 
    rom_1_5_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_5_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_45)) 
    rom_1_5_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_5_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_46)) 
    rom_1_5_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_5_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_47)) 
    rom_1_5_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_5_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_49)) 
    rom_1_5_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_5_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_50)) 
    rom_1_5_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_5_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_51)) 
    rom_1_5_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_5_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_52)) 
    rom_1_5_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_5_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_53)) 
    rom_1_5_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_5_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_54)) 
    rom_1_5_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_5_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_55)) 
    rom_1_5_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_5_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_56)) 
    rom_1_5_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_5_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_57)) 
    rom_1_5_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_5_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_58)) 
    rom_1_5_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_5_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_59)) 
    rom_1_5_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_5_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_62)) 
    rom_1_5_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_5_62));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_63)) 
    rom_1_5_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_5_63));

  // Stage 1
    assign s_1_5_1_0 = {{2{acts_1_5_0[5]}}, acts_1_5_0} + {{2{acts_1_5_1[5]}}, acts_1_5_1} + {{2{acts_1_5_2[5]}}, acts_1_5_2} + {{2{acts_1_5_3[5]}}, acts_1_5_3};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_0), .q(s_1_5_1_0_reg));

    assign s_1_5_1_1 = {{2{acts_1_5_4[5]}}, acts_1_5_4} + {{2{acts_1_5_5[5]}}, acts_1_5_5} + {{2{acts_1_5_6[5]}}, acts_1_5_6} + {{2{acts_1_5_8[5]}}, acts_1_5_8};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_1), .q(s_1_5_1_1_reg));

    assign s_1_5_1_2 = {{2{acts_1_5_9[5]}}, acts_1_5_9} + {{2{acts_1_5_11[5]}}, acts_1_5_11} + {{2{acts_1_5_12[5]}}, acts_1_5_12} + {{2{acts_1_5_13[5]}}, acts_1_5_13};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_2), .q(s_1_5_1_2_reg));

    assign s_1_5_1_3 = {{2{acts_1_5_14[5]}}, acts_1_5_14} + {{2{acts_1_5_15[5]}}, acts_1_5_15} + {{2{acts_1_5_16[5]}}, acts_1_5_16} + {{2{acts_1_5_18[5]}}, acts_1_5_18};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_3), .q(s_1_5_1_3_reg));

    assign s_1_5_1_4 = {{2{acts_1_5_19[5]}}, acts_1_5_19} + {{2{acts_1_5_21[5]}}, acts_1_5_21} + {{2{acts_1_5_22[5]}}, acts_1_5_22} + {{2{acts_1_5_23[5]}}, acts_1_5_23};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_4), .q(s_1_5_1_4_reg));

    assign s_1_5_1_5 = {{2{acts_1_5_24[5]}}, acts_1_5_24} + {{2{acts_1_5_25[5]}}, acts_1_5_25} + {{2{acts_1_5_26[5]}}, acts_1_5_26} + {{2{acts_1_5_28[5]}}, acts_1_5_28};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_5), .q(s_1_5_1_5_reg));

    assign s_1_5_1_6 = {{2{acts_1_5_29[5]}}, acts_1_5_29} + {{2{acts_1_5_30[5]}}, acts_1_5_30} + {{2{acts_1_5_31[5]}}, acts_1_5_31} + {{2{acts_1_5_32[5]}}, acts_1_5_32};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_6), .q(s_1_5_1_6_reg));

    assign s_1_5_1_7 = {{2{acts_1_5_33[5]}}, acts_1_5_33} + {{2{acts_1_5_35[5]}}, acts_1_5_35} + {{2{acts_1_5_40[5]}}, acts_1_5_40} + {{2{acts_1_5_41[5]}}, acts_1_5_41};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_7), .q(s_1_5_1_7_reg));

    assign s_1_5_1_8 = {{2{acts_1_5_42[5]}}, acts_1_5_42} + {{2{acts_1_5_43[5]}}, acts_1_5_43} + {{2{acts_1_5_45[5]}}, acts_1_5_45} + {{2{acts_1_5_46[5]}}, acts_1_5_46};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_8), .q(s_1_5_1_8_reg));

    assign s_1_5_1_9 = {{2{acts_1_5_47[5]}}, acts_1_5_47} + {{2{acts_1_5_49[5]}}, acts_1_5_49} + {{2{acts_1_5_50[5]}}, acts_1_5_50} + {{2{acts_1_5_51[5]}}, acts_1_5_51};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_9), .q(s_1_5_1_9_reg));

    assign s_1_5_1_10 = {{2{acts_1_5_52[5]}}, acts_1_5_52} + {{2{acts_1_5_53[5]}}, acts_1_5_53} + {{2{acts_1_5_54[5]}}, acts_1_5_54} + {{2{acts_1_5_55[5]}}, acts_1_5_55};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_10), .q(s_1_5_1_10_reg));

    assign s_1_5_1_11 = {{2{acts_1_5_56[5]}}, acts_1_5_56} + {{2{acts_1_5_57[5]}}, acts_1_5_57} + {{2{acts_1_5_58[5]}}, acts_1_5_58} + {{2{acts_1_5_59[5]}}, acts_1_5_59};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_11), .q(s_1_5_1_11_reg));

    assign s_1_5_1_12 = {{2{acts_1_5_62[5]}}, acts_1_5_62} + {{2{acts_1_5_63[5]}}, acts_1_5_63};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_12), .q(s_1_5_1_12_reg));

  // Stage 2
    assign s_1_5_2_0 = {{2{s_1_5_1_0_reg[7]}}, s_1_5_1_0_reg} + {{2{s_1_5_1_1_reg[7]}}, s_1_5_1_1_reg} + {{2{s_1_5_1_2_reg[7]}}, s_1_5_1_2_reg} + {{2{s_1_5_1_3_reg[7]}}, s_1_5_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_5_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_2_0), .q(s_1_5_2_0_reg));

    assign s_1_5_2_1 = {{2{s_1_5_1_4_reg[7]}}, s_1_5_1_4_reg} + {{2{s_1_5_1_5_reg[7]}}, s_1_5_1_5_reg} + {{2{s_1_5_1_6_reg[7]}}, s_1_5_1_6_reg} + {{2{s_1_5_1_7_reg[7]}}, s_1_5_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_5_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_2_1), .q(s_1_5_2_1_reg));

    assign s_1_5_2_2 = {{2{s_1_5_1_8_reg[7]}}, s_1_5_1_8_reg} + {{2{s_1_5_1_9_reg[7]}}, s_1_5_1_9_reg} + {{2{s_1_5_1_10_reg[7]}}, s_1_5_1_10_reg} + {{2{s_1_5_1_11_reg[7]}}, s_1_5_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_5_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_2_2), .q(s_1_5_2_2_reg));

    assign s_1_5_2_3 = {{2{s_1_5_1_12_reg[7]}}, s_1_5_1_12_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_5_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_2_3), .q(s_1_5_2_3_reg));

  // Stage 3
    assign sum_1_5 = {{2{s_1_5_2_0_reg[9]}}, s_1_5_2_0_reg} + {{2{s_1_5_2_1_reg[9]}}, s_1_5_2_1_reg} + {{2{s_1_5_2_2_reg[9]}}, s_1_5_2_2_reg} + {{2{s_1_5_2_3_reg[9]}}, s_1_5_2_3_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_5), .q(sum_1_5_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_5 (.i_data(sum_1_5_reg), .o_data(o_vector[5]));


    // Layer 1, Node 6
      logic  [7:0] s_1_6_1_0, s_1_6_1_1, s_1_6_1_2, s_1_6_1_3, s_1_6_1_4, s_1_6_1_5, s_1_6_1_6, s_1_6_1_7, s_1_6_1_8, s_1_6_1_9, s_1_6_1_10, s_1_6_1_11, s_1_6_1_12;
    logic  [7:0] s_1_6_1_0_reg, s_1_6_1_1_reg, s_1_6_1_2_reg, s_1_6_1_3_reg, s_1_6_1_4_reg, s_1_6_1_5_reg, s_1_6_1_6_reg, s_1_6_1_7_reg, s_1_6_1_8_reg, s_1_6_1_9_reg, s_1_6_1_10_reg, s_1_6_1_11_reg, s_1_6_1_12_reg;
    logic  [9:0] s_1_6_2_0, s_1_6_2_1, s_1_6_2_2, s_1_6_2_3;
    logic  [9:0] s_1_6_2_0_reg, s_1_6_2_1_reg, s_1_6_2_2_reg, s_1_6_2_3_reg;
    logic [11:0] sum_1_6;
    logic [11:0] sum_1_6_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_0)) 
    rom_1_6_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_6_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_1)) 
    rom_1_6_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_6_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_2)) 
    rom_1_6_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_6_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_3)) 
    rom_1_6_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_6_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_4)) 
    rom_1_6_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_6_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_5)) 
    rom_1_6_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_6_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_6)) 
    rom_1_6_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_6_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_7)) 
    rom_1_6_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_6_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_8)) 
    rom_1_6_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_6_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_10)) 
    rom_1_6_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_6_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_11)) 
    rom_1_6_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_6_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_13)) 
    rom_1_6_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_6_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_14)) 
    rom_1_6_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_6_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_16)) 
    rom_1_6_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_6_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_17)) 
    rom_1_6_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_6_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_18)) 
    rom_1_6_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_6_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_19)) 
    rom_1_6_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_6_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_20)) 
    rom_1_6_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_6_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_21)) 
    rom_1_6_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_6_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_23)) 
    rom_1_6_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_6_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_24)) 
    rom_1_6_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_6_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_25)) 
    rom_1_6_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_6_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_26)) 
    rom_1_6_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_6_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_28)) 
    rom_1_6_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_6_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_29)) 
    rom_1_6_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_6_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_30)) 
    rom_1_6_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_6_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_31)) 
    rom_1_6_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_6_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_32)) 
    rom_1_6_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_6_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_33)) 
    rom_1_6_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_6_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_35)) 
    rom_1_6_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_6_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_37)) 
    rom_1_6_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_6_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_39)) 
    rom_1_6_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_6_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_40)) 
    rom_1_6_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_6_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_42)) 
    rom_1_6_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_6_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_43)) 
    rom_1_6_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_6_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_44)) 
    rom_1_6_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_6_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_45)) 
    rom_1_6_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_6_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_46)) 
    rom_1_6_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_6_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_47)) 
    rom_1_6_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_6_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_48)) 
    rom_1_6_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_6_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_49)) 
    rom_1_6_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_6_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_50)) 
    rom_1_6_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_6_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_51)) 
    rom_1_6_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_6_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_52)) 
    rom_1_6_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_6_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_54)) 
    rom_1_6_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_6_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_55)) 
    rom_1_6_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_6_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_56)) 
    rom_1_6_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_6_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_57)) 
    rom_1_6_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_6_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_58)) 
    rom_1_6_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_6_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_60)) 
    rom_1_6_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_6_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_61)) 
    rom_1_6_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_6_61));

  // Stage 1
    assign s_1_6_1_0 = {{2{acts_1_6_0[5]}}, acts_1_6_0} + {{2{acts_1_6_1[5]}}, acts_1_6_1} + {{2{acts_1_6_2[5]}}, acts_1_6_2} + {{2{acts_1_6_3[5]}}, acts_1_6_3};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_0), .q(s_1_6_1_0_reg));

    assign s_1_6_1_1 = {{2{acts_1_6_4[5]}}, acts_1_6_4} + {{2{acts_1_6_5[5]}}, acts_1_6_5} + {{2{acts_1_6_6[5]}}, acts_1_6_6} + {{2{acts_1_6_7[5]}}, acts_1_6_7};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_1), .q(s_1_6_1_1_reg));

    assign s_1_6_1_2 = {{2{acts_1_6_8[5]}}, acts_1_6_8} + {{2{acts_1_6_10[5]}}, acts_1_6_10} + {{2{acts_1_6_11[5]}}, acts_1_6_11} + {{2{acts_1_6_13[5]}}, acts_1_6_13};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_2), .q(s_1_6_1_2_reg));

    assign s_1_6_1_3 = {{2{acts_1_6_14[5]}}, acts_1_6_14} + {{2{acts_1_6_16[5]}}, acts_1_6_16} + {{2{acts_1_6_17[5]}}, acts_1_6_17} + {{2{acts_1_6_18[5]}}, acts_1_6_18};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_3), .q(s_1_6_1_3_reg));

    assign s_1_6_1_4 = {{2{acts_1_6_19[5]}}, acts_1_6_19} + {{2{acts_1_6_20[5]}}, acts_1_6_20} + {{2{acts_1_6_21[5]}}, acts_1_6_21} + {{2{acts_1_6_23[5]}}, acts_1_6_23};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_4), .q(s_1_6_1_4_reg));

    assign s_1_6_1_5 = {{2{acts_1_6_24[5]}}, acts_1_6_24} + {{2{acts_1_6_25[5]}}, acts_1_6_25} + {{2{acts_1_6_26[5]}}, acts_1_6_26} + {{2{acts_1_6_28[5]}}, acts_1_6_28};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_5), .q(s_1_6_1_5_reg));

    assign s_1_6_1_6 = {{2{acts_1_6_29[5]}}, acts_1_6_29} + {{2{acts_1_6_30[5]}}, acts_1_6_30} + {{2{acts_1_6_31[5]}}, acts_1_6_31} + {{2{acts_1_6_32[5]}}, acts_1_6_32};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_6), .q(s_1_6_1_6_reg));

    assign s_1_6_1_7 = {{2{acts_1_6_33[5]}}, acts_1_6_33} + {{2{acts_1_6_35[5]}}, acts_1_6_35} + {{2{acts_1_6_37[5]}}, acts_1_6_37} + {{2{acts_1_6_39[5]}}, acts_1_6_39};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_7), .q(s_1_6_1_7_reg));

    assign s_1_6_1_8 = {{2{acts_1_6_40[5]}}, acts_1_6_40} + {{2{acts_1_6_42[5]}}, acts_1_6_42} + {{2{acts_1_6_43[5]}}, acts_1_6_43} + {{2{acts_1_6_44[5]}}, acts_1_6_44};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_8), .q(s_1_6_1_8_reg));

    assign s_1_6_1_9 = {{2{acts_1_6_45[5]}}, acts_1_6_45} + {{2{acts_1_6_46[5]}}, acts_1_6_46} + {{2{acts_1_6_47[5]}}, acts_1_6_47} + {{2{acts_1_6_48[5]}}, acts_1_6_48};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_9), .q(s_1_6_1_9_reg));

    assign s_1_6_1_10 = {{2{acts_1_6_49[5]}}, acts_1_6_49} + {{2{acts_1_6_50[5]}}, acts_1_6_50} + {{2{acts_1_6_51[5]}}, acts_1_6_51} + {{2{acts_1_6_52[5]}}, acts_1_6_52};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_10), .q(s_1_6_1_10_reg));

    assign s_1_6_1_11 = {{2{acts_1_6_54[5]}}, acts_1_6_54} + {{2{acts_1_6_55[5]}}, acts_1_6_55} + {{2{acts_1_6_56[5]}}, acts_1_6_56} + {{2{acts_1_6_57[5]}}, acts_1_6_57};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_11), .q(s_1_6_1_11_reg));

    assign s_1_6_1_12 = {{2{acts_1_6_58[5]}}, acts_1_6_58} + {{2{acts_1_6_60[5]}}, acts_1_6_60} + {{2{acts_1_6_61[5]}}, acts_1_6_61};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_12), .q(s_1_6_1_12_reg));

  // Stage 2
    assign s_1_6_2_0 = {{2{s_1_6_1_0_reg[7]}}, s_1_6_1_0_reg} + {{2{s_1_6_1_1_reg[7]}}, s_1_6_1_1_reg} + {{2{s_1_6_1_2_reg[7]}}, s_1_6_1_2_reg} + {{2{s_1_6_1_3_reg[7]}}, s_1_6_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_6_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_2_0), .q(s_1_6_2_0_reg));

    assign s_1_6_2_1 = {{2{s_1_6_1_4_reg[7]}}, s_1_6_1_4_reg} + {{2{s_1_6_1_5_reg[7]}}, s_1_6_1_5_reg} + {{2{s_1_6_1_6_reg[7]}}, s_1_6_1_6_reg} + {{2{s_1_6_1_7_reg[7]}}, s_1_6_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_6_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_2_1), .q(s_1_6_2_1_reg));

    assign s_1_6_2_2 = {{2{s_1_6_1_8_reg[7]}}, s_1_6_1_8_reg} + {{2{s_1_6_1_9_reg[7]}}, s_1_6_1_9_reg} + {{2{s_1_6_1_10_reg[7]}}, s_1_6_1_10_reg} + {{2{s_1_6_1_11_reg[7]}}, s_1_6_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_6_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_2_2), .q(s_1_6_2_2_reg));

    assign s_1_6_2_3 = {{2{s_1_6_1_12_reg[7]}}, s_1_6_1_12_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_6_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_2_3), .q(s_1_6_2_3_reg));

  // Stage 3
    assign sum_1_6 = {{2{s_1_6_2_0_reg[9]}}, s_1_6_2_0_reg} + {{2{s_1_6_2_1_reg[9]}}, s_1_6_2_1_reg} + {{2{s_1_6_2_2_reg[9]}}, s_1_6_2_2_reg} + {{2{s_1_6_2_3_reg[9]}}, s_1_6_2_3_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_6), .q(sum_1_6_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_6 (.i_data(sum_1_6_reg), .o_data(o_vector[6]));


    // Layer 1, Node 7
      logic  [7:0] s_1_7_1_0, s_1_7_1_1, s_1_7_1_2, s_1_7_1_3, s_1_7_1_4, s_1_7_1_5, s_1_7_1_6, s_1_7_1_7, s_1_7_1_8, s_1_7_1_9, s_1_7_1_10, s_1_7_1_11;
    logic  [7:0] s_1_7_1_0_reg, s_1_7_1_1_reg, s_1_7_1_2_reg, s_1_7_1_3_reg, s_1_7_1_4_reg, s_1_7_1_5_reg, s_1_7_1_6_reg, s_1_7_1_7_reg, s_1_7_1_8_reg, s_1_7_1_9_reg, s_1_7_1_10_reg, s_1_7_1_11_reg;
    logic  [9:0] s_1_7_2_0, s_1_7_2_1, s_1_7_2_2;
    logic  [9:0] s_1_7_2_0_reg, s_1_7_2_1_reg, s_1_7_2_2_reg;
    logic [11:0] sum_1_7;
    logic [11:0] sum_1_7_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_0)) 
    rom_1_7_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_7_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_1)) 
    rom_1_7_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_7_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_2)) 
    rom_1_7_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_7_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_3)) 
    rom_1_7_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_7_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_4)) 
    rom_1_7_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_7_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_5)) 
    rom_1_7_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_7_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_7)) 
    rom_1_7_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_7_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_8)) 
    rom_1_7_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_7_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_9)) 
    rom_1_7_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_7_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_10)) 
    rom_1_7_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_7_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_13)) 
    rom_1_7_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_7_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_14)) 
    rom_1_7_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_7_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_15)) 
    rom_1_7_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_7_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_16)) 
    rom_1_7_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_7_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_17)) 
    rom_1_7_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_7_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_18)) 
    rom_1_7_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_7_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_20)) 
    rom_1_7_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_7_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_21)) 
    rom_1_7_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_7_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_22)) 
    rom_1_7_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_7_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_24)) 
    rom_1_7_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_7_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_25)) 
    rom_1_7_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_7_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_26)) 
    rom_1_7_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_7_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_28)) 
    rom_1_7_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_7_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_29)) 
    rom_1_7_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_7_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_30)) 
    rom_1_7_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_7_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_31)) 
    rom_1_7_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_7_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_32)) 
    rom_1_7_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_7_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_33)) 
    rom_1_7_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_7_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_37)) 
    rom_1_7_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_7_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_40)) 
    rom_1_7_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_7_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_42)) 
    rom_1_7_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_7_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_43)) 
    rom_1_7_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_7_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_44)) 
    rom_1_7_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_7_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_46)) 
    rom_1_7_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_7_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_47)) 
    rom_1_7_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_7_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_49)) 
    rom_1_7_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_7_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_50)) 
    rom_1_7_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_7_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_51)) 
    rom_1_7_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_7_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_52)) 
    rom_1_7_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_7_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_55)) 
    rom_1_7_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_7_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_56)) 
    rom_1_7_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_7_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_57)) 
    rom_1_7_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_7_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_58)) 
    rom_1_7_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_7_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_59)) 
    rom_1_7_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_7_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_60)) 
    rom_1_7_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_7_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_61)) 
    rom_1_7_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_7_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_62)) 
    rom_1_7_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_7_62));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_63)) 
    rom_1_7_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_7_63));

  // Stage 1
    assign s_1_7_1_0 = {{2{acts_1_7_0[5]}}, acts_1_7_0} + {{2{acts_1_7_1[5]}}, acts_1_7_1} + {{2{acts_1_7_2[5]}}, acts_1_7_2} + {{2{acts_1_7_3[5]}}, acts_1_7_3};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_0), .q(s_1_7_1_0_reg));

    assign s_1_7_1_1 = {{2{acts_1_7_4[5]}}, acts_1_7_4} + {{2{acts_1_7_5[5]}}, acts_1_7_5} + {{2{acts_1_7_7[5]}}, acts_1_7_7} + {{2{acts_1_7_8[5]}}, acts_1_7_8};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_1), .q(s_1_7_1_1_reg));

    assign s_1_7_1_2 = {{2{acts_1_7_9[5]}}, acts_1_7_9} + {{2{acts_1_7_10[5]}}, acts_1_7_10} + {{2{acts_1_7_13[5]}}, acts_1_7_13} + {{2{acts_1_7_14[5]}}, acts_1_7_14};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_2), .q(s_1_7_1_2_reg));

    assign s_1_7_1_3 = {{2{acts_1_7_15[5]}}, acts_1_7_15} + {{2{acts_1_7_16[5]}}, acts_1_7_16} + {{2{acts_1_7_17[5]}}, acts_1_7_17} + {{2{acts_1_7_18[5]}}, acts_1_7_18};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_3), .q(s_1_7_1_3_reg));

    assign s_1_7_1_4 = {{2{acts_1_7_20[5]}}, acts_1_7_20} + {{2{acts_1_7_21[5]}}, acts_1_7_21} + {{2{acts_1_7_22[5]}}, acts_1_7_22} + {{2{acts_1_7_24[5]}}, acts_1_7_24};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_4), .q(s_1_7_1_4_reg));

    assign s_1_7_1_5 = {{2{acts_1_7_25[5]}}, acts_1_7_25} + {{2{acts_1_7_26[5]}}, acts_1_7_26} + {{2{acts_1_7_28[5]}}, acts_1_7_28} + {{2{acts_1_7_29[5]}}, acts_1_7_29};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_5), .q(s_1_7_1_5_reg));

    assign s_1_7_1_6 = {{2{acts_1_7_30[5]}}, acts_1_7_30} + {{2{acts_1_7_31[5]}}, acts_1_7_31} + {{2{acts_1_7_32[5]}}, acts_1_7_32} + {{2{acts_1_7_33[5]}}, acts_1_7_33};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_6), .q(s_1_7_1_6_reg));

    assign s_1_7_1_7 = {{2{acts_1_7_37[5]}}, acts_1_7_37} + {{2{acts_1_7_40[5]}}, acts_1_7_40} + {{2{acts_1_7_42[5]}}, acts_1_7_42} + {{2{acts_1_7_43[5]}}, acts_1_7_43};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_7), .q(s_1_7_1_7_reg));

    assign s_1_7_1_8 = {{2{acts_1_7_44[5]}}, acts_1_7_44} + {{2{acts_1_7_46[5]}}, acts_1_7_46} + {{2{acts_1_7_47[5]}}, acts_1_7_47} + {{2{acts_1_7_49[5]}}, acts_1_7_49};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_8), .q(s_1_7_1_8_reg));

    assign s_1_7_1_9 = {{2{acts_1_7_50[5]}}, acts_1_7_50} + {{2{acts_1_7_51[5]}}, acts_1_7_51} + {{2{acts_1_7_52[5]}}, acts_1_7_52} + {{2{acts_1_7_55[5]}}, acts_1_7_55};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_9), .q(s_1_7_1_9_reg));

    assign s_1_7_1_10 = {{2{acts_1_7_56[5]}}, acts_1_7_56} + {{2{acts_1_7_57[5]}}, acts_1_7_57} + {{2{acts_1_7_58[5]}}, acts_1_7_58} + {{2{acts_1_7_59[5]}}, acts_1_7_59};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_10), .q(s_1_7_1_10_reg));

    assign s_1_7_1_11 = {{2{acts_1_7_60[5]}}, acts_1_7_60} + {{2{acts_1_7_61[5]}}, acts_1_7_61} + {{2{acts_1_7_62[5]}}, acts_1_7_62} + {{2{acts_1_7_63[5]}}, acts_1_7_63};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_11), .q(s_1_7_1_11_reg));

  // Stage 2
    assign s_1_7_2_0 = {{2{s_1_7_1_0_reg[7]}}, s_1_7_1_0_reg} + {{2{s_1_7_1_1_reg[7]}}, s_1_7_1_1_reg} + {{2{s_1_7_1_2_reg[7]}}, s_1_7_1_2_reg} + {{2{s_1_7_1_3_reg[7]}}, s_1_7_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_7_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_2_0), .q(s_1_7_2_0_reg));

    assign s_1_7_2_1 = {{2{s_1_7_1_4_reg[7]}}, s_1_7_1_4_reg} + {{2{s_1_7_1_5_reg[7]}}, s_1_7_1_5_reg} + {{2{s_1_7_1_6_reg[7]}}, s_1_7_1_6_reg} + {{2{s_1_7_1_7_reg[7]}}, s_1_7_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_7_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_2_1), .q(s_1_7_2_1_reg));

    assign s_1_7_2_2 = {{2{s_1_7_1_8_reg[7]}}, s_1_7_1_8_reg} + {{2{s_1_7_1_9_reg[7]}}, s_1_7_1_9_reg} + {{2{s_1_7_1_10_reg[7]}}, s_1_7_1_10_reg} + {{2{s_1_7_1_11_reg[7]}}, s_1_7_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_7_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_2_2), .q(s_1_7_2_2_reg));

  // Stage 3
    assign sum_1_7 = {{2{s_1_7_2_0_reg[9]}}, s_1_7_2_0_reg} + {{2{s_1_7_2_1_reg[9]}}, s_1_7_2_1_reg} + {{2{s_1_7_2_2_reg[9]}}, s_1_7_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_7), .q(sum_1_7_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_7 (.i_data(sum_1_7_reg), .o_data(o_vector[7]));


    // Layer 1, Node 8
      logic  [7:0] s_1_8_1_0, s_1_8_1_1, s_1_8_1_2, s_1_8_1_3, s_1_8_1_4, s_1_8_1_5, s_1_8_1_6, s_1_8_1_7, s_1_8_1_8, s_1_8_1_9, s_1_8_1_10;
    logic  [7:0] s_1_8_1_0_reg, s_1_8_1_1_reg, s_1_8_1_2_reg, s_1_8_1_3_reg, s_1_8_1_4_reg, s_1_8_1_5_reg, s_1_8_1_6_reg, s_1_8_1_7_reg, s_1_8_1_8_reg, s_1_8_1_9_reg, s_1_8_1_10_reg;
    logic  [9:0] s_1_8_2_0, s_1_8_2_1, s_1_8_2_2;
    logic  [9:0] s_1_8_2_0_reg, s_1_8_2_1_reg, s_1_8_2_2_reg;
    logic [11:0] sum_1_8;
    logic [11:0] sum_1_8_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_1)) 
    rom_1_8_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_8_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_3)) 
    rom_1_8_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_8_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_5)) 
    rom_1_8_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_8_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_6)) 
    rom_1_8_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_8_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_7)) 
    rom_1_8_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_8_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_8)) 
    rom_1_8_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_8_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_9)) 
    rom_1_8_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_8_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_11)) 
    rom_1_8_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_8_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_12)) 
    rom_1_8_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_8_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_13)) 
    rom_1_8_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_8_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_16)) 
    rom_1_8_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_8_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_19)) 
    rom_1_8_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_8_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_22)) 
    rom_1_8_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_8_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_23)) 
    rom_1_8_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_8_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_24)) 
    rom_1_8_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_8_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_26)) 
    rom_1_8_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_8_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_27)) 
    rom_1_8_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_8_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_28)) 
    rom_1_8_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_8_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_29)) 
    rom_1_8_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_8_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_30)) 
    rom_1_8_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_8_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_31)) 
    rom_1_8_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_8_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_32)) 
    rom_1_8_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_8_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_34)) 
    rom_1_8_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_8_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_35)) 
    rom_1_8_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_8_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_38)) 
    rom_1_8_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_8_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_41)) 
    rom_1_8_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_8_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_42)) 
    rom_1_8_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_8_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_43)) 
    rom_1_8_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_8_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_44)) 
    rom_1_8_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_8_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_45)) 
    rom_1_8_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_8_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_46)) 
    rom_1_8_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_8_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_47)) 
    rom_1_8_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_8_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_48)) 
    rom_1_8_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_8_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_49)) 
    rom_1_8_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_8_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_50)) 
    rom_1_8_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_8_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_52)) 
    rom_1_8_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_8_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_53)) 
    rom_1_8_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_8_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_54)) 
    rom_1_8_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_8_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_56)) 
    rom_1_8_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_8_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_58)) 
    rom_1_8_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_8_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_59)) 
    rom_1_8_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_8_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_60)) 
    rom_1_8_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_8_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_61)) 
    rom_1_8_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_8_61));

  // Stage 1
    assign s_1_8_1_0 = {{2{acts_1_8_1[5]}}, acts_1_8_1} + {{2{acts_1_8_3[5]}}, acts_1_8_3} + {{2{acts_1_8_5[5]}}, acts_1_8_5} + {{2{acts_1_8_6[5]}}, acts_1_8_6};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_0), .q(s_1_8_1_0_reg));

    assign s_1_8_1_1 = {{2{acts_1_8_7[5]}}, acts_1_8_7} + {{2{acts_1_8_8[5]}}, acts_1_8_8} + {{2{acts_1_8_9[5]}}, acts_1_8_9} + {{2{acts_1_8_11[5]}}, acts_1_8_11};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_1), .q(s_1_8_1_1_reg));

    assign s_1_8_1_2 = {{2{acts_1_8_12[5]}}, acts_1_8_12} + {{2{acts_1_8_13[5]}}, acts_1_8_13} + {{2{acts_1_8_16[5]}}, acts_1_8_16} + {{2{acts_1_8_19[5]}}, acts_1_8_19};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_2), .q(s_1_8_1_2_reg));

    assign s_1_8_1_3 = {{2{acts_1_8_22[5]}}, acts_1_8_22} + {{2{acts_1_8_23[5]}}, acts_1_8_23} + {{2{acts_1_8_24[5]}}, acts_1_8_24} + {{2{acts_1_8_26[5]}}, acts_1_8_26};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_3), .q(s_1_8_1_3_reg));

    assign s_1_8_1_4 = {{2{acts_1_8_27[5]}}, acts_1_8_27} + {{2{acts_1_8_28[5]}}, acts_1_8_28} + {{2{acts_1_8_29[5]}}, acts_1_8_29} + {{2{acts_1_8_30[5]}}, acts_1_8_30};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_4), .q(s_1_8_1_4_reg));

    assign s_1_8_1_5 = {{2{acts_1_8_31[5]}}, acts_1_8_31} + {{2{acts_1_8_32[5]}}, acts_1_8_32} + {{2{acts_1_8_34[5]}}, acts_1_8_34} + {{2{acts_1_8_35[5]}}, acts_1_8_35};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_5), .q(s_1_8_1_5_reg));

    assign s_1_8_1_6 = {{2{acts_1_8_38[5]}}, acts_1_8_38} + {{2{acts_1_8_41[5]}}, acts_1_8_41} + {{2{acts_1_8_42[5]}}, acts_1_8_42} + {{2{acts_1_8_43[5]}}, acts_1_8_43};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_6), .q(s_1_8_1_6_reg));

    assign s_1_8_1_7 = {{2{acts_1_8_44[5]}}, acts_1_8_44} + {{2{acts_1_8_45[5]}}, acts_1_8_45} + {{2{acts_1_8_46[5]}}, acts_1_8_46} + {{2{acts_1_8_47[5]}}, acts_1_8_47};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_7), .q(s_1_8_1_7_reg));

    assign s_1_8_1_8 = {{2{acts_1_8_48[5]}}, acts_1_8_48} + {{2{acts_1_8_49[5]}}, acts_1_8_49} + {{2{acts_1_8_50[5]}}, acts_1_8_50} + {{2{acts_1_8_52[5]}}, acts_1_8_52};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_8), .q(s_1_8_1_8_reg));

    assign s_1_8_1_9 = {{2{acts_1_8_53[5]}}, acts_1_8_53} + {{2{acts_1_8_54[5]}}, acts_1_8_54} + {{2{acts_1_8_56[5]}}, acts_1_8_56} + {{2{acts_1_8_58[5]}}, acts_1_8_58};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_9), .q(s_1_8_1_9_reg));

    assign s_1_8_1_10 = {{2{acts_1_8_59[5]}}, acts_1_8_59} + {{2{acts_1_8_60[5]}}, acts_1_8_60} + {{2{acts_1_8_61[5]}}, acts_1_8_61};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_10), .q(s_1_8_1_10_reg));

  // Stage 2
    assign s_1_8_2_0 = {{2{s_1_8_1_0_reg[7]}}, s_1_8_1_0_reg} + {{2{s_1_8_1_1_reg[7]}}, s_1_8_1_1_reg} + {{2{s_1_8_1_2_reg[7]}}, s_1_8_1_2_reg} + {{2{s_1_8_1_3_reg[7]}}, s_1_8_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_8_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_2_0), .q(s_1_8_2_0_reg));

    assign s_1_8_2_1 = {{2{s_1_8_1_4_reg[7]}}, s_1_8_1_4_reg} + {{2{s_1_8_1_5_reg[7]}}, s_1_8_1_5_reg} + {{2{s_1_8_1_6_reg[7]}}, s_1_8_1_6_reg} + {{2{s_1_8_1_7_reg[7]}}, s_1_8_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_8_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_2_1), .q(s_1_8_2_1_reg));

    assign s_1_8_2_2 = {{2{s_1_8_1_8_reg[7]}}, s_1_8_1_8_reg} + {{2{s_1_8_1_9_reg[7]}}, s_1_8_1_9_reg} + {{2{s_1_8_1_10_reg[7]}}, s_1_8_1_10_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_8_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_2_2), .q(s_1_8_2_2_reg));

  // Stage 3
    assign sum_1_8 = {{2{s_1_8_2_0_reg[9]}}, s_1_8_2_0_reg} + {{2{s_1_8_2_1_reg[9]}}, s_1_8_2_1_reg} + {{2{s_1_8_2_2_reg[9]}}, s_1_8_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_8), .q(sum_1_8_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_8 (.i_data(sum_1_8_reg), .o_data(o_vector[8]));


    // Layer 1, Node 9
      logic  [7:0] s_1_9_1_0, s_1_9_1_1, s_1_9_1_2, s_1_9_1_3, s_1_9_1_4, s_1_9_1_5, s_1_9_1_6, s_1_9_1_7, s_1_9_1_8, s_1_9_1_9, s_1_9_1_10, s_1_9_1_11, s_1_9_1_12, s_1_9_1_13;
    logic  [7:0] s_1_9_1_0_reg, s_1_9_1_1_reg, s_1_9_1_2_reg, s_1_9_1_3_reg, s_1_9_1_4_reg, s_1_9_1_5_reg, s_1_9_1_6_reg, s_1_9_1_7_reg, s_1_9_1_8_reg, s_1_9_1_9_reg, s_1_9_1_10_reg, s_1_9_1_11_reg, s_1_9_1_12_reg, s_1_9_1_13_reg;
    logic  [9:0] s_1_9_2_0, s_1_9_2_1, s_1_9_2_2, s_1_9_2_3;
    logic  [9:0] s_1_9_2_0_reg, s_1_9_2_1_reg, s_1_9_2_2_reg, s_1_9_2_3_reg;
    logic [11:0] sum_1_9;
    logic [11:0] sum_1_9_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_0)) 
    rom_1_9_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_9_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_1)) 
    rom_1_9_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_9_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_2)) 
    rom_1_9_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_9_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_3)) 
    rom_1_9_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_9_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_4)) 
    rom_1_9_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_9_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_5)) 
    rom_1_9_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_9_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_6)) 
    rom_1_9_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_9_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_7)) 
    rom_1_9_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_9_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_8)) 
    rom_1_9_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_9_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_9)) 
    rom_1_9_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_9_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_10)) 
    rom_1_9_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_9_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_11)) 
    rom_1_9_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_9_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_12)) 
    rom_1_9_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_9_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_13)) 
    rom_1_9_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_9_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_15)) 
    rom_1_9_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_9_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_17)) 
    rom_1_9_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_9_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_18)) 
    rom_1_9_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_9_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_20)) 
    rom_1_9_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_9_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_21)) 
    rom_1_9_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_9_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_22)) 
    rom_1_9_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_9_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_23)) 
    rom_1_9_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_9_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_24)) 
    rom_1_9_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_9_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_25)) 
    rom_1_9_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_9_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_28)) 
    rom_1_9_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_9_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_29)) 
    rom_1_9_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_9_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_30)) 
    rom_1_9_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_9_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_31)) 
    rom_1_9_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_9_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_32)) 
    rom_1_9_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_9_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_33)) 
    rom_1_9_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_9_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_34)) 
    rom_1_9_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_9_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_35)) 
    rom_1_9_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_9_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_36)) 
    rom_1_9_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_9_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_37)) 
    rom_1_9_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_9_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_38)) 
    rom_1_9_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_9_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_39)) 
    rom_1_9_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_9_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_40)) 
    rom_1_9_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_9_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_41)) 
    rom_1_9_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_9_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_42)) 
    rom_1_9_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_9_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_43)) 
    rom_1_9_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_9_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_44)) 
    rom_1_9_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_9_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_45)) 
    rom_1_9_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_9_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_46)) 
    rom_1_9_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_9_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_49)) 
    rom_1_9_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_9_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_50)) 
    rom_1_9_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_9_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_52)) 
    rom_1_9_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_9_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_53)) 
    rom_1_9_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_9_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_54)) 
    rom_1_9_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_9_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_55)) 
    rom_1_9_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_9_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_58)) 
    rom_1_9_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_9_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_59)) 
    rom_1_9_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_9_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_60)) 
    rom_1_9_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_9_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_61)) 
    rom_1_9_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_9_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_62)) 
    rom_1_9_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_9_62));

  // Stage 1
    assign s_1_9_1_0 = {{2{acts_1_9_0[5]}}, acts_1_9_0} + {{2{acts_1_9_1[5]}}, acts_1_9_1} + {{2{acts_1_9_2[5]}}, acts_1_9_2} + {{2{acts_1_9_3[5]}}, acts_1_9_3};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_0), .q(s_1_9_1_0_reg));

    assign s_1_9_1_1 = {{2{acts_1_9_4[5]}}, acts_1_9_4} + {{2{acts_1_9_5[5]}}, acts_1_9_5} + {{2{acts_1_9_6[5]}}, acts_1_9_6} + {{2{acts_1_9_7[5]}}, acts_1_9_7};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_1), .q(s_1_9_1_1_reg));

    assign s_1_9_1_2 = {{2{acts_1_9_8[5]}}, acts_1_9_8} + {{2{acts_1_9_9[5]}}, acts_1_9_9} + {{2{acts_1_9_10[5]}}, acts_1_9_10} + {{2{acts_1_9_11[5]}}, acts_1_9_11};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_2), .q(s_1_9_1_2_reg));

    assign s_1_9_1_3 = {{2{acts_1_9_12[5]}}, acts_1_9_12} + {{2{acts_1_9_13[5]}}, acts_1_9_13} + {{2{acts_1_9_15[5]}}, acts_1_9_15} + {{2{acts_1_9_17[5]}}, acts_1_9_17};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_3), .q(s_1_9_1_3_reg));

    assign s_1_9_1_4 = {{2{acts_1_9_18[5]}}, acts_1_9_18} + {{2{acts_1_9_20[5]}}, acts_1_9_20} + {{2{acts_1_9_21[5]}}, acts_1_9_21} + {{2{acts_1_9_22[5]}}, acts_1_9_22};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_4), .q(s_1_9_1_4_reg));

    assign s_1_9_1_5 = {{2{acts_1_9_23[5]}}, acts_1_9_23} + {{2{acts_1_9_24[5]}}, acts_1_9_24} + {{2{acts_1_9_25[5]}}, acts_1_9_25} + {{2{acts_1_9_28[5]}}, acts_1_9_28};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_5), .q(s_1_9_1_5_reg));

    assign s_1_9_1_6 = {{2{acts_1_9_29[5]}}, acts_1_9_29} + {{2{acts_1_9_30[5]}}, acts_1_9_30} + {{2{acts_1_9_31[5]}}, acts_1_9_31} + {{2{acts_1_9_32[5]}}, acts_1_9_32};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_6), .q(s_1_9_1_6_reg));

    assign s_1_9_1_7 = {{2{acts_1_9_33[5]}}, acts_1_9_33} + {{2{acts_1_9_34[5]}}, acts_1_9_34} + {{2{acts_1_9_35[5]}}, acts_1_9_35} + {{2{acts_1_9_36[5]}}, acts_1_9_36};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_7), .q(s_1_9_1_7_reg));

    assign s_1_9_1_8 = {{2{acts_1_9_37[5]}}, acts_1_9_37} + {{2{acts_1_9_38[5]}}, acts_1_9_38} + {{2{acts_1_9_39[5]}}, acts_1_9_39} + {{2{acts_1_9_40[5]}}, acts_1_9_40};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_8), .q(s_1_9_1_8_reg));

    assign s_1_9_1_9 = {{2{acts_1_9_41[5]}}, acts_1_9_41} + {{2{acts_1_9_42[5]}}, acts_1_9_42} + {{2{acts_1_9_43[5]}}, acts_1_9_43} + {{2{acts_1_9_44[5]}}, acts_1_9_44};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_9), .q(s_1_9_1_9_reg));

    assign s_1_9_1_10 = {{2{acts_1_9_45[5]}}, acts_1_9_45} + {{2{acts_1_9_46[5]}}, acts_1_9_46} + {{2{acts_1_9_49[5]}}, acts_1_9_49} + {{2{acts_1_9_50[5]}}, acts_1_9_50};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_10), .q(s_1_9_1_10_reg));

    assign s_1_9_1_11 = {{2{acts_1_9_52[5]}}, acts_1_9_52} + {{2{acts_1_9_53[5]}}, acts_1_9_53} + {{2{acts_1_9_54[5]}}, acts_1_9_54} + {{2{acts_1_9_55[5]}}, acts_1_9_55};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_11), .q(s_1_9_1_11_reg));

    assign s_1_9_1_12 = {{2{acts_1_9_58[5]}}, acts_1_9_58} + {{2{acts_1_9_59[5]}}, acts_1_9_59} + {{2{acts_1_9_60[5]}}, acts_1_9_60} + {{2{acts_1_9_61[5]}}, acts_1_9_61};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_12), .q(s_1_9_1_12_reg));

    assign s_1_9_1_13 = {{2{acts_1_9_62[5]}}, acts_1_9_62};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_13), .q(s_1_9_1_13_reg));

  // Stage 2
    assign s_1_9_2_0 = {{2{s_1_9_1_0_reg[7]}}, s_1_9_1_0_reg} + {{2{s_1_9_1_1_reg[7]}}, s_1_9_1_1_reg} + {{2{s_1_9_1_2_reg[7]}}, s_1_9_1_2_reg} + {{2{s_1_9_1_3_reg[7]}}, s_1_9_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_9_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_2_0), .q(s_1_9_2_0_reg));

    assign s_1_9_2_1 = {{2{s_1_9_1_4_reg[7]}}, s_1_9_1_4_reg} + {{2{s_1_9_1_5_reg[7]}}, s_1_9_1_5_reg} + {{2{s_1_9_1_6_reg[7]}}, s_1_9_1_6_reg} + {{2{s_1_9_1_7_reg[7]}}, s_1_9_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_9_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_2_1), .q(s_1_9_2_1_reg));

    assign s_1_9_2_2 = {{2{s_1_9_1_8_reg[7]}}, s_1_9_1_8_reg} + {{2{s_1_9_1_9_reg[7]}}, s_1_9_1_9_reg} + {{2{s_1_9_1_10_reg[7]}}, s_1_9_1_10_reg} + {{2{s_1_9_1_11_reg[7]}}, s_1_9_1_11_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_9_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_2_2), .q(s_1_9_2_2_reg));

    assign s_1_9_2_3 = {{2{s_1_9_1_12_reg[7]}}, s_1_9_1_12_reg} + {{2{s_1_9_1_13_reg[7]}}, s_1_9_1_13_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_9_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_2_3), .q(s_1_9_2_3_reg));

  // Stage 3
    assign sum_1_9 = {{2{s_1_9_2_0_reg[9]}}, s_1_9_2_0_reg} + {{2{s_1_9_2_1_reg[9]}}, s_1_9_2_1_reg} + {{2{s_1_9_2_2_reg[9]}}, s_1_9_2_2_reg} + {{2{s_1_9_2_3_reg[9]}}, s_1_9_2_3_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_9), .q(sum_1_9_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_9 (.i_data(sum_1_9_reg), .o_data(o_vector[9]));


endmodule