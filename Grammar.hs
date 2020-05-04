{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,371) ([63984,145,2052,0,0,0,0,0,64832,127,16384,0,0,0,0,0,0,0,0,8,0,1024,0,0,2,0,256,0,32768,0,0,64,0,8192,59328,583,57360,9203,2049,63984,145,4,62720,1535,0,0,0,64768,95,8095,16393,53120,1167,49184,18407,4098,62432,291,61448,37369,1024,64760,72,31746,9342,256,16190,32786,40704,2335,32832,36815,8196,59328,583,57360,9203,2049,63984,145,63492,18684,512,32380,36,15873,4671,128,8095,16393,53120,1167,49184,18407,4098,62432,291,61448,37369,1024,64760,72,31746,9342,256,0,24573,0,0,0,16384,62,0,8096,2,53248,271,0,59368,0,62464,115,0,0,0,33024,0,32768,64,0,14400,0,8192,28,0,3984,0,0,0,0,0,0,0,0,16384,32765,1,65184,191,20480,24575,0,65448,47,54272,6143,0,65514,3,62720,1535,0,0,0,0,0,8095,16393,0,0,0,0,0,0,0,0,2,0,256,0,0,0,256,16190,32786,0,0,128,0,0,0,0,57344,9203,2049,0,65514,11,2,0,0,0,15873,4671,128,40960,49150,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exp","int","var","True","False","If","Then","Else","While","Print","incrementStream","reduceStream","getStream","streamLength","'!!'","'='","'=='","'!'","'&&'","'+'","'-'","'*'","'/'","'^'","'<'","'>'","'<='","'>='","'|'","','","';'","'('","')'","'['","']'","%eof"]
        bit_start = st * 39
        bit_end = (st + 1) * 39
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..38]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (5) = happyShift action_2
action_0 (6) = happyShift action_4
action_0 (7) = happyShift action_5
action_0 (8) = happyShift action_6
action_0 (9) = happyShift action_7
action_0 (12) = happyShift action_8
action_0 (13) = happyShift action_9
action_0 (14) = happyShift action_10
action_0 (15) = happyShift action_11
action_0 (16) = happyShift action_12
action_0 (17) = happyShift action_13
action_0 (21) = happyShift action_14
action_0 (24) = happyShift action_15
action_0 (35) = happyShift action_16
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (5) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (18) = happyShift action_28
action_3 (20) = happyShift action_29
action_3 (22) = happyShift action_30
action_3 (23) = happyShift action_31
action_3 (24) = happyShift action_32
action_3 (25) = happyShift action_33
action_3 (26) = happyShift action_34
action_3 (27) = happyShift action_35
action_3 (28) = happyShift action_36
action_3 (29) = happyShift action_37
action_3 (30) = happyShift action_38
action_3 (31) = happyShift action_39
action_3 (32) = happyShift action_40
action_3 (33) = happyShift action_41
action_3 (34) = happyShift action_42
action_3 (39) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (19) = happyShift action_27
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_2

action_6 _ = happyReduce_3

action_7 (35) = happyShift action_26
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (35) = happyShift action_25
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (35) = happyShift action_24
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (35) = happyShift action_23
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (35) = happyShift action_22
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (35) = happyShift action_21
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (35) = happyShift action_20
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (5) = happyShift action_2
action_14 (6) = happyShift action_4
action_14 (7) = happyShift action_5
action_14 (8) = happyShift action_6
action_14 (9) = happyShift action_7
action_14 (12) = happyShift action_8
action_14 (13) = happyShift action_9
action_14 (14) = happyShift action_10
action_14 (15) = happyShift action_11
action_14 (16) = happyShift action_12
action_14 (17) = happyShift action_13
action_14 (21) = happyShift action_14
action_14 (24) = happyShift action_15
action_14 (35) = happyShift action_16
action_14 (4) = happyGoto action_19
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (5) = happyShift action_2
action_15 (6) = happyShift action_4
action_15 (7) = happyShift action_5
action_15 (8) = happyShift action_6
action_15 (9) = happyShift action_7
action_15 (12) = happyShift action_8
action_15 (13) = happyShift action_9
action_15 (14) = happyShift action_10
action_15 (15) = happyShift action_11
action_15 (16) = happyShift action_12
action_15 (17) = happyShift action_13
action_15 (21) = happyShift action_14
action_15 (24) = happyShift action_15
action_15 (35) = happyShift action_16
action_15 (4) = happyGoto action_18
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (5) = happyShift action_2
action_16 (6) = happyShift action_4
action_16 (7) = happyShift action_5
action_16 (8) = happyShift action_6
action_16 (9) = happyShift action_7
action_16 (12) = happyShift action_8
action_16 (13) = happyShift action_9
action_16 (14) = happyShift action_10
action_16 (15) = happyShift action_11
action_16 (16) = happyShift action_12
action_16 (17) = happyShift action_13
action_16 (21) = happyShift action_14
action_16 (24) = happyShift action_15
action_16 (35) = happyShift action_16
action_16 (4) = happyGoto action_17
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (18) = happyShift action_28
action_17 (20) = happyShift action_29
action_17 (22) = happyShift action_30
action_17 (23) = happyShift action_31
action_17 (24) = happyShift action_32
action_17 (25) = happyShift action_33
action_17 (26) = happyShift action_34
action_17 (27) = happyShift action_35
action_17 (28) = happyShift action_36
action_17 (29) = happyShift action_37
action_17 (30) = happyShift action_38
action_17 (31) = happyShift action_39
action_17 (32) = happyShift action_40
action_17 (33) = happyShift action_41
action_17 (34) = happyShift action_42
action_17 (36) = happyShift action_66
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (18) = happyShift action_28
action_18 (33) = happyShift action_41
action_18 _ = happyReduce_7

action_19 (18) = happyShift action_28
action_19 (20) = happyShift action_29
action_19 (22) = happyShift action_30
action_19 (23) = happyShift action_31
action_19 (24) = happyShift action_32
action_19 (25) = happyShift action_33
action_19 (26) = happyShift action_34
action_19 (27) = happyShift action_35
action_19 (28) = happyShift action_36
action_19 (29) = happyShift action_37
action_19 (30) = happyShift action_38
action_19 (31) = happyShift action_39
action_19 (32) = happyShift action_40
action_19 (33) = happyShift action_41
action_19 (34) = happyShift action_42
action_19 _ = happyReduce_5

action_20 (5) = happyShift action_2
action_20 (6) = happyShift action_4
action_20 (7) = happyShift action_5
action_20 (8) = happyShift action_6
action_20 (9) = happyShift action_7
action_20 (12) = happyShift action_8
action_20 (13) = happyShift action_9
action_20 (14) = happyShift action_10
action_20 (15) = happyShift action_11
action_20 (16) = happyShift action_12
action_20 (17) = happyShift action_13
action_20 (21) = happyShift action_14
action_20 (24) = happyShift action_15
action_20 (35) = happyShift action_16
action_20 (4) = happyGoto action_65
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (5) = happyShift action_2
action_21 (6) = happyShift action_4
action_21 (7) = happyShift action_5
action_21 (8) = happyShift action_6
action_21 (9) = happyShift action_7
action_21 (12) = happyShift action_8
action_21 (13) = happyShift action_9
action_21 (14) = happyShift action_10
action_21 (15) = happyShift action_11
action_21 (16) = happyShift action_12
action_21 (17) = happyShift action_13
action_21 (21) = happyShift action_14
action_21 (24) = happyShift action_15
action_21 (35) = happyShift action_16
action_21 (4) = happyGoto action_64
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (5) = happyShift action_2
action_22 (6) = happyShift action_4
action_22 (7) = happyShift action_5
action_22 (8) = happyShift action_6
action_22 (9) = happyShift action_7
action_22 (12) = happyShift action_8
action_22 (13) = happyShift action_9
action_22 (14) = happyShift action_10
action_22 (15) = happyShift action_11
action_22 (16) = happyShift action_12
action_22 (17) = happyShift action_13
action_22 (21) = happyShift action_14
action_22 (24) = happyShift action_15
action_22 (35) = happyShift action_16
action_22 (4) = happyGoto action_63
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (5) = happyShift action_2
action_23 (6) = happyShift action_4
action_23 (7) = happyShift action_5
action_23 (8) = happyShift action_6
action_23 (9) = happyShift action_7
action_23 (12) = happyShift action_8
action_23 (13) = happyShift action_9
action_23 (14) = happyShift action_10
action_23 (15) = happyShift action_11
action_23 (16) = happyShift action_12
action_23 (17) = happyShift action_13
action_23 (21) = happyShift action_14
action_23 (24) = happyShift action_15
action_23 (35) = happyShift action_16
action_23 (4) = happyGoto action_62
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (5) = happyShift action_2
action_24 (6) = happyShift action_4
action_24 (7) = happyShift action_5
action_24 (8) = happyShift action_6
action_24 (9) = happyShift action_7
action_24 (12) = happyShift action_8
action_24 (13) = happyShift action_9
action_24 (14) = happyShift action_10
action_24 (15) = happyShift action_11
action_24 (16) = happyShift action_12
action_24 (17) = happyShift action_13
action_24 (21) = happyShift action_14
action_24 (24) = happyShift action_15
action_24 (35) = happyShift action_16
action_24 (4) = happyGoto action_61
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (5) = happyShift action_2
action_25 (6) = happyShift action_4
action_25 (7) = happyShift action_5
action_25 (8) = happyShift action_6
action_25 (9) = happyShift action_7
action_25 (12) = happyShift action_8
action_25 (13) = happyShift action_9
action_25 (14) = happyShift action_10
action_25 (15) = happyShift action_11
action_25 (16) = happyShift action_12
action_25 (17) = happyShift action_13
action_25 (21) = happyShift action_14
action_25 (24) = happyShift action_15
action_25 (35) = happyShift action_16
action_25 (4) = happyGoto action_60
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (5) = happyShift action_2
action_26 (6) = happyShift action_4
action_26 (7) = happyShift action_5
action_26 (8) = happyShift action_6
action_26 (9) = happyShift action_7
action_26 (12) = happyShift action_8
action_26 (13) = happyShift action_9
action_26 (14) = happyShift action_10
action_26 (15) = happyShift action_11
action_26 (16) = happyShift action_12
action_26 (17) = happyShift action_13
action_26 (21) = happyShift action_14
action_26 (24) = happyShift action_15
action_26 (35) = happyShift action_16
action_26 (4) = happyGoto action_59
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (5) = happyShift action_2
action_27 (6) = happyShift action_4
action_27 (7) = happyShift action_5
action_27 (8) = happyShift action_6
action_27 (9) = happyShift action_7
action_27 (12) = happyShift action_8
action_27 (13) = happyShift action_9
action_27 (14) = happyShift action_10
action_27 (15) = happyShift action_11
action_27 (16) = happyShift action_12
action_27 (17) = happyShift action_13
action_27 (21) = happyShift action_14
action_27 (24) = happyShift action_15
action_27 (35) = happyShift action_16
action_27 (4) = happyGoto action_58
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (5) = happyShift action_2
action_28 (6) = happyShift action_4
action_28 (7) = happyShift action_5
action_28 (8) = happyShift action_6
action_28 (9) = happyShift action_7
action_28 (12) = happyShift action_8
action_28 (13) = happyShift action_9
action_28 (14) = happyShift action_10
action_28 (15) = happyShift action_11
action_28 (16) = happyShift action_12
action_28 (17) = happyShift action_13
action_28 (21) = happyShift action_14
action_28 (24) = happyShift action_15
action_28 (35) = happyShift action_16
action_28 (4) = happyGoto action_57
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (5) = happyShift action_2
action_29 (6) = happyShift action_4
action_29 (7) = happyShift action_5
action_29 (8) = happyShift action_6
action_29 (9) = happyShift action_7
action_29 (12) = happyShift action_8
action_29 (13) = happyShift action_9
action_29 (14) = happyShift action_10
action_29 (15) = happyShift action_11
action_29 (16) = happyShift action_12
action_29 (17) = happyShift action_13
action_29 (21) = happyShift action_14
action_29 (24) = happyShift action_15
action_29 (35) = happyShift action_16
action_29 (4) = happyGoto action_56
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (5) = happyShift action_2
action_30 (6) = happyShift action_4
action_30 (7) = happyShift action_5
action_30 (8) = happyShift action_6
action_30 (9) = happyShift action_7
action_30 (12) = happyShift action_8
action_30 (13) = happyShift action_9
action_30 (14) = happyShift action_10
action_30 (15) = happyShift action_11
action_30 (16) = happyShift action_12
action_30 (17) = happyShift action_13
action_30 (21) = happyShift action_14
action_30 (24) = happyShift action_15
action_30 (35) = happyShift action_16
action_30 (4) = happyGoto action_55
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (5) = happyShift action_2
action_31 (6) = happyShift action_4
action_31 (7) = happyShift action_5
action_31 (8) = happyShift action_6
action_31 (9) = happyShift action_7
action_31 (12) = happyShift action_8
action_31 (13) = happyShift action_9
action_31 (14) = happyShift action_10
action_31 (15) = happyShift action_11
action_31 (16) = happyShift action_12
action_31 (17) = happyShift action_13
action_31 (21) = happyShift action_14
action_31 (24) = happyShift action_15
action_31 (35) = happyShift action_16
action_31 (4) = happyGoto action_54
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (5) = happyShift action_2
action_32 (6) = happyShift action_4
action_32 (7) = happyShift action_5
action_32 (8) = happyShift action_6
action_32 (9) = happyShift action_7
action_32 (12) = happyShift action_8
action_32 (13) = happyShift action_9
action_32 (14) = happyShift action_10
action_32 (15) = happyShift action_11
action_32 (16) = happyShift action_12
action_32 (17) = happyShift action_13
action_32 (21) = happyShift action_14
action_32 (24) = happyShift action_15
action_32 (35) = happyShift action_16
action_32 (4) = happyGoto action_53
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (5) = happyShift action_2
action_33 (6) = happyShift action_4
action_33 (7) = happyShift action_5
action_33 (8) = happyShift action_6
action_33 (9) = happyShift action_7
action_33 (12) = happyShift action_8
action_33 (13) = happyShift action_9
action_33 (14) = happyShift action_10
action_33 (15) = happyShift action_11
action_33 (16) = happyShift action_12
action_33 (17) = happyShift action_13
action_33 (21) = happyShift action_14
action_33 (24) = happyShift action_15
action_33 (35) = happyShift action_16
action_33 (4) = happyGoto action_52
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (5) = happyShift action_2
action_34 (6) = happyShift action_4
action_34 (7) = happyShift action_5
action_34 (8) = happyShift action_6
action_34 (9) = happyShift action_7
action_34 (12) = happyShift action_8
action_34 (13) = happyShift action_9
action_34 (14) = happyShift action_10
action_34 (15) = happyShift action_11
action_34 (16) = happyShift action_12
action_34 (17) = happyShift action_13
action_34 (21) = happyShift action_14
action_34 (24) = happyShift action_15
action_34 (35) = happyShift action_16
action_34 (4) = happyGoto action_51
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (5) = happyShift action_2
action_35 (6) = happyShift action_4
action_35 (7) = happyShift action_5
action_35 (8) = happyShift action_6
action_35 (9) = happyShift action_7
action_35 (12) = happyShift action_8
action_35 (13) = happyShift action_9
action_35 (14) = happyShift action_10
action_35 (15) = happyShift action_11
action_35 (16) = happyShift action_12
action_35 (17) = happyShift action_13
action_35 (21) = happyShift action_14
action_35 (24) = happyShift action_15
action_35 (35) = happyShift action_16
action_35 (4) = happyGoto action_50
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (5) = happyShift action_2
action_36 (6) = happyShift action_4
action_36 (7) = happyShift action_5
action_36 (8) = happyShift action_6
action_36 (9) = happyShift action_7
action_36 (12) = happyShift action_8
action_36 (13) = happyShift action_9
action_36 (14) = happyShift action_10
action_36 (15) = happyShift action_11
action_36 (16) = happyShift action_12
action_36 (17) = happyShift action_13
action_36 (21) = happyShift action_14
action_36 (24) = happyShift action_15
action_36 (35) = happyShift action_16
action_36 (4) = happyGoto action_49
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (5) = happyShift action_2
action_37 (6) = happyShift action_4
action_37 (7) = happyShift action_5
action_37 (8) = happyShift action_6
action_37 (9) = happyShift action_7
action_37 (12) = happyShift action_8
action_37 (13) = happyShift action_9
action_37 (14) = happyShift action_10
action_37 (15) = happyShift action_11
action_37 (16) = happyShift action_12
action_37 (17) = happyShift action_13
action_37 (21) = happyShift action_14
action_37 (24) = happyShift action_15
action_37 (35) = happyShift action_16
action_37 (4) = happyGoto action_48
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (5) = happyShift action_2
action_38 (6) = happyShift action_4
action_38 (7) = happyShift action_5
action_38 (8) = happyShift action_6
action_38 (9) = happyShift action_7
action_38 (12) = happyShift action_8
action_38 (13) = happyShift action_9
action_38 (14) = happyShift action_10
action_38 (15) = happyShift action_11
action_38 (16) = happyShift action_12
action_38 (17) = happyShift action_13
action_38 (21) = happyShift action_14
action_38 (24) = happyShift action_15
action_38 (35) = happyShift action_16
action_38 (4) = happyGoto action_47
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (5) = happyShift action_2
action_39 (6) = happyShift action_4
action_39 (7) = happyShift action_5
action_39 (8) = happyShift action_6
action_39 (9) = happyShift action_7
action_39 (12) = happyShift action_8
action_39 (13) = happyShift action_9
action_39 (14) = happyShift action_10
action_39 (15) = happyShift action_11
action_39 (16) = happyShift action_12
action_39 (17) = happyShift action_13
action_39 (21) = happyShift action_14
action_39 (24) = happyShift action_15
action_39 (35) = happyShift action_16
action_39 (4) = happyGoto action_46
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (5) = happyShift action_2
action_40 (6) = happyShift action_4
action_40 (7) = happyShift action_5
action_40 (8) = happyShift action_6
action_40 (9) = happyShift action_7
action_40 (12) = happyShift action_8
action_40 (13) = happyShift action_9
action_40 (14) = happyShift action_10
action_40 (15) = happyShift action_11
action_40 (16) = happyShift action_12
action_40 (17) = happyShift action_13
action_40 (21) = happyShift action_14
action_40 (24) = happyShift action_15
action_40 (35) = happyShift action_16
action_40 (4) = happyGoto action_45
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (5) = happyShift action_2
action_41 (6) = happyShift action_4
action_41 (7) = happyShift action_5
action_41 (8) = happyShift action_6
action_41 (9) = happyShift action_7
action_41 (12) = happyShift action_8
action_41 (13) = happyShift action_9
action_41 (14) = happyShift action_10
action_41 (15) = happyShift action_11
action_41 (16) = happyShift action_12
action_41 (17) = happyShift action_13
action_41 (21) = happyShift action_14
action_41 (24) = happyShift action_15
action_41 (35) = happyShift action_16
action_41 (4) = happyGoto action_44
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (5) = happyShift action_2
action_42 (6) = happyShift action_4
action_42 (7) = happyShift action_5
action_42 (8) = happyShift action_6
action_42 (9) = happyShift action_7
action_42 (12) = happyShift action_8
action_42 (13) = happyShift action_9
action_42 (14) = happyShift action_10
action_42 (15) = happyShift action_11
action_42 (16) = happyShift action_12
action_42 (17) = happyShift action_13
action_42 (21) = happyShift action_14
action_42 (24) = happyShift action_15
action_42 (35) = happyShift action_16
action_42 (4) = happyGoto action_43
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (18) = happyShift action_28
action_43 (20) = happyShift action_29
action_43 (22) = happyShift action_30
action_43 (23) = happyShift action_31
action_43 (24) = happyShift action_32
action_43 (25) = happyShift action_33
action_43 (26) = happyShift action_34
action_43 (27) = happyShift action_35
action_43 (28) = happyShift action_36
action_43 (29) = happyShift action_37
action_43 (30) = happyShift action_38
action_43 (31) = happyShift action_39
action_43 (32) = happyShift action_40
action_43 (33) = happyShift action_41
action_43 (34) = happyShift action_42
action_43 _ = happyReduce_27

action_44 (18) = happyShift action_28
action_44 (20) = happyShift action_29
action_44 (22) = happyShift action_30
action_44 (23) = happyShift action_31
action_44 (24) = happyShift action_32
action_44 (25) = happyShift action_33
action_44 (26) = happyShift action_34
action_44 (27) = happyShift action_35
action_44 (28) = happyShift action_36
action_44 (29) = happyShift action_37
action_44 (30) = happyShift action_38
action_44 (31) = happyShift action_39
action_44 (32) = happyShift action_40
action_44 (33) = happyShift action_41
action_44 (34) = happyShift action_42
action_44 _ = happyReduce_26

action_45 (18) = happyShift action_28
action_45 (20) = happyShift action_29
action_45 (23) = happyShift action_31
action_45 (24) = happyShift action_32
action_45 (25) = happyShift action_33
action_45 (26) = happyShift action_34
action_45 (27) = happyShift action_35
action_45 (33) = happyShift action_41
action_45 _ = happyReduce_17

action_46 (18) = happyShift action_28
action_46 (20) = happyShift action_29
action_46 (22) = happyShift action_30
action_46 (23) = happyShift action_31
action_46 (24) = happyShift action_32
action_46 (25) = happyShift action_33
action_46 (26) = happyShift action_34
action_46 (27) = happyShift action_35
action_46 (32) = happyShift action_40
action_46 (33) = happyShift action_41
action_46 _ = happyReduce_16

action_47 (18) = happyShift action_28
action_47 (20) = happyShift action_29
action_47 (22) = happyShift action_30
action_47 (23) = happyShift action_31
action_47 (24) = happyShift action_32
action_47 (25) = happyShift action_33
action_47 (26) = happyShift action_34
action_47 (27) = happyShift action_35
action_47 (32) = happyShift action_40
action_47 (33) = happyShift action_41
action_47 _ = happyReduce_15

action_48 (18) = happyShift action_28
action_48 (20) = happyShift action_29
action_48 (22) = happyShift action_30
action_48 (23) = happyShift action_31
action_48 (24) = happyShift action_32
action_48 (25) = happyShift action_33
action_48 (26) = happyShift action_34
action_48 (27) = happyShift action_35
action_48 (28) = happyFail []
action_48 (29) = happyFail []
action_48 (30) = happyShift action_38
action_48 (31) = happyShift action_39
action_48 (32) = happyShift action_40
action_48 (33) = happyShift action_41
action_48 _ = happyReduce_14

action_49 (18) = happyShift action_28
action_49 (20) = happyShift action_29
action_49 (22) = happyShift action_30
action_49 (23) = happyShift action_31
action_49 (24) = happyShift action_32
action_49 (25) = happyShift action_33
action_49 (26) = happyShift action_34
action_49 (27) = happyShift action_35
action_49 (28) = happyFail []
action_49 (29) = happyFail []
action_49 (30) = happyShift action_38
action_49 (31) = happyShift action_39
action_49 (32) = happyShift action_40
action_49 (33) = happyShift action_41
action_49 _ = happyReduce_13

action_50 (18) = happyShift action_28
action_50 (33) = happyShift action_41
action_50 _ = happyReduce_12

action_51 (18) = happyShift action_28
action_51 (20) = happyShift action_29
action_51 (27) = happyShift action_35
action_51 (33) = happyShift action_41
action_51 _ = happyReduce_11

action_52 (18) = happyShift action_28
action_52 (20) = happyShift action_29
action_52 (27) = happyShift action_35
action_52 (33) = happyShift action_41
action_52 _ = happyReduce_10

action_53 (18) = happyShift action_28
action_53 (20) = happyShift action_29
action_53 (25) = happyShift action_33
action_53 (26) = happyShift action_34
action_53 (27) = happyShift action_35
action_53 (33) = happyShift action_41
action_53 _ = happyReduce_9

action_54 (18) = happyShift action_28
action_54 (20) = happyShift action_29
action_54 (25) = happyShift action_33
action_54 (26) = happyShift action_34
action_54 (27) = happyShift action_35
action_54 (33) = happyShift action_41
action_54 _ = happyReduce_8

action_55 (18) = happyShift action_28
action_55 (20) = happyShift action_29
action_55 (23) = happyShift action_31
action_55 (24) = happyShift action_32
action_55 (25) = happyShift action_33
action_55 (26) = happyShift action_34
action_55 (27) = happyShift action_35
action_55 (33) = happyShift action_41
action_55 _ = happyReduce_6

action_56 (18) = happyShift action_28
action_56 (33) = happyShift action_41
action_56 _ = happyReduce_4

action_57 (18) = happyShift action_28
action_57 (20) = happyShift action_29
action_57 (22) = happyShift action_30
action_57 (23) = happyShift action_31
action_57 (24) = happyShift action_32
action_57 (25) = happyShift action_33
action_57 (26) = happyShift action_34
action_57 (27) = happyShift action_35
action_57 (28) = happyShift action_36
action_57 (29) = happyShift action_37
action_57 (30) = happyShift action_38
action_57 (31) = happyShift action_39
action_57 (32) = happyShift action_40
action_57 (33) = happyShift action_41
action_57 (34) = happyShift action_42
action_57 _ = happyReduce_25

action_58 (18) = happyShift action_28
action_58 (20) = happyShift action_29
action_58 (22) = happyShift action_30
action_58 (23) = happyShift action_31
action_58 (24) = happyShift action_32
action_58 (25) = happyShift action_33
action_58 (26) = happyShift action_34
action_58 (27) = happyShift action_35
action_58 (28) = happyShift action_36
action_58 (29) = happyShift action_37
action_58 (30) = happyShift action_38
action_58 (31) = happyShift action_39
action_58 (32) = happyShift action_40
action_58 (33) = happyShift action_41
action_58 (34) = happyShift action_42
action_58 _ = happyReduce_28

action_59 (18) = happyShift action_28
action_59 (20) = happyShift action_29
action_59 (22) = happyShift action_30
action_59 (23) = happyShift action_31
action_59 (24) = happyShift action_32
action_59 (25) = happyShift action_33
action_59 (26) = happyShift action_34
action_59 (27) = happyShift action_35
action_59 (28) = happyShift action_36
action_59 (29) = happyShift action_37
action_59 (30) = happyShift action_38
action_59 (31) = happyShift action_39
action_59 (32) = happyShift action_40
action_59 (33) = happyShift action_41
action_59 (34) = happyShift action_42
action_59 (36) = happyShift action_73
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (18) = happyShift action_28
action_60 (20) = happyShift action_29
action_60 (22) = happyShift action_30
action_60 (23) = happyShift action_31
action_60 (24) = happyShift action_32
action_60 (25) = happyShift action_33
action_60 (26) = happyShift action_34
action_60 (27) = happyShift action_35
action_60 (28) = happyShift action_36
action_60 (29) = happyShift action_37
action_60 (30) = happyShift action_38
action_60 (31) = happyShift action_39
action_60 (32) = happyShift action_40
action_60 (33) = happyShift action_41
action_60 (34) = happyShift action_42
action_60 (36) = happyShift action_72
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (18) = happyShift action_28
action_61 (20) = happyShift action_29
action_61 (22) = happyShift action_30
action_61 (23) = happyShift action_31
action_61 (24) = happyShift action_32
action_61 (25) = happyShift action_33
action_61 (26) = happyShift action_34
action_61 (27) = happyShift action_35
action_61 (28) = happyShift action_36
action_61 (29) = happyShift action_37
action_61 (30) = happyShift action_38
action_61 (31) = happyShift action_39
action_61 (32) = happyShift action_40
action_61 (33) = happyShift action_41
action_61 (34) = happyShift action_42
action_61 (36) = happyShift action_71
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (18) = happyShift action_28
action_62 (20) = happyShift action_29
action_62 (22) = happyShift action_30
action_62 (23) = happyShift action_31
action_62 (24) = happyShift action_32
action_62 (25) = happyShift action_33
action_62 (26) = happyShift action_34
action_62 (27) = happyShift action_35
action_62 (28) = happyShift action_36
action_62 (29) = happyShift action_37
action_62 (30) = happyShift action_38
action_62 (31) = happyShift action_39
action_62 (32) = happyShift action_40
action_62 (33) = happyShift action_41
action_62 (34) = happyShift action_42
action_62 (36) = happyShift action_70
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (18) = happyShift action_28
action_63 (20) = happyShift action_29
action_63 (22) = happyShift action_30
action_63 (23) = happyShift action_31
action_63 (24) = happyShift action_32
action_63 (25) = happyShift action_33
action_63 (26) = happyShift action_34
action_63 (27) = happyShift action_35
action_63 (28) = happyShift action_36
action_63 (29) = happyShift action_37
action_63 (30) = happyShift action_38
action_63 (31) = happyShift action_39
action_63 (32) = happyShift action_40
action_63 (33) = happyShift action_41
action_63 (34) = happyShift action_42
action_63 (36) = happyShift action_69
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (18) = happyShift action_28
action_64 (20) = happyShift action_29
action_64 (22) = happyShift action_30
action_64 (23) = happyShift action_31
action_64 (24) = happyShift action_32
action_64 (25) = happyShift action_33
action_64 (26) = happyShift action_34
action_64 (27) = happyShift action_35
action_64 (28) = happyShift action_36
action_64 (29) = happyShift action_37
action_64 (30) = happyShift action_38
action_64 (31) = happyShift action_39
action_64 (32) = happyShift action_40
action_64 (33) = happyShift action_68
action_64 (34) = happyShift action_42
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (18) = happyShift action_28
action_65 (20) = happyShift action_29
action_65 (22) = happyShift action_30
action_65 (23) = happyShift action_31
action_65 (24) = happyShift action_32
action_65 (25) = happyShift action_33
action_65 (26) = happyShift action_34
action_65 (27) = happyShift action_35
action_65 (28) = happyShift action_36
action_65 (29) = happyShift action_37
action_65 (30) = happyShift action_38
action_65 (31) = happyShift action_39
action_65 (32) = happyShift action_40
action_65 (33) = happyShift action_41
action_65 (34) = happyShift action_42
action_65 (36) = happyShift action_67
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_29

action_67 _ = happyReduce_24

action_68 (5) = happyShift action_2
action_68 (6) = happyShift action_4
action_68 (7) = happyShift action_5
action_68 (8) = happyShift action_6
action_68 (9) = happyShift action_7
action_68 (12) = happyShift action_8
action_68 (13) = happyShift action_9
action_68 (14) = happyShift action_10
action_68 (15) = happyShift action_11
action_68 (16) = happyShift action_12
action_68 (17) = happyShift action_13
action_68 (21) = happyShift action_14
action_68 (24) = happyShift action_15
action_68 (35) = happyShift action_16
action_68 (4) = happyGoto action_76
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_22

action_70 _ = happyReduce_21

action_71 _ = happyReduce_19

action_72 (10) = happyShift action_75
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (10) = happyShift action_74
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (35) = happyShift action_79
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (5) = happyShift action_2
action_75 (6) = happyShift action_4
action_75 (7) = happyShift action_5
action_75 (8) = happyShift action_6
action_75 (9) = happyShift action_7
action_75 (12) = happyShift action_8
action_75 (13) = happyShift action_9
action_75 (14) = happyShift action_10
action_75 (15) = happyShift action_11
action_75 (16) = happyShift action_12
action_75 (17) = happyShift action_13
action_75 (21) = happyShift action_14
action_75 (24) = happyShift action_15
action_75 (35) = happyShift action_16
action_75 (4) = happyGoto action_78
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (18) = happyShift action_28
action_76 (20) = happyShift action_29
action_76 (22) = happyShift action_30
action_76 (23) = happyShift action_31
action_76 (24) = happyShift action_32
action_76 (25) = happyShift action_33
action_76 (26) = happyShift action_34
action_76 (27) = happyShift action_35
action_76 (28) = happyShift action_36
action_76 (29) = happyShift action_37
action_76 (30) = happyShift action_38
action_76 (31) = happyShift action_39
action_76 (32) = happyShift action_40
action_76 (33) = happyShift action_41
action_76 (34) = happyShift action_42
action_76 (36) = happyShift action_77
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_23

action_78 (18) = happyShift action_28
action_78 (20) = happyShift action_29
action_78 (22) = happyShift action_30
action_78 (23) = happyShift action_31
action_78 (24) = happyShift action_32
action_78 (25) = happyShift action_33
action_78 (26) = happyShift action_34
action_78 (27) = happyShift action_35
action_78 (28) = happyShift action_36
action_78 (29) = happyShift action_37
action_78 (30) = happyShift action_38
action_78 (31) = happyShift action_39
action_78 (32) = happyShift action_40
action_78 (33) = happyShift action_41
action_78 (34) = happyShift action_42
action_78 _ = happyReduce_20

action_79 (5) = happyShift action_2
action_79 (6) = happyShift action_4
action_79 (7) = happyShift action_5
action_79 (8) = happyShift action_6
action_79 (9) = happyShift action_7
action_79 (12) = happyShift action_8
action_79 (13) = happyShift action_9
action_79 (14) = happyShift action_10
action_79 (15) = happyShift action_11
action_79 (16) = happyShift action_12
action_79 (17) = happyShift action_13
action_79 (21) = happyShift action_14
action_79 (24) = happyShift action_15
action_79 (35) = happyShift action_16
action_79 (4) = happyGoto action_80
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (18) = happyShift action_28
action_80 (20) = happyShift action_29
action_80 (22) = happyShift action_30
action_80 (23) = happyShift action_31
action_80 (24) = happyShift action_32
action_80 (25) = happyShift action_33
action_80 (26) = happyShift action_34
action_80 (27) = happyShift action_35
action_80 (28) = happyShift action_36
action_80 (29) = happyShift action_37
action_80 (30) = happyShift action_38
action_80 (31) = happyShift action_39
action_80 (32) = happyShift action_40
action_80 (33) = happyShift action_41
action_80 (34) = happyShift action_42
action_80 (36) = happyShift action_81
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (11) = happyShift action_82
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (35) = happyShift action_83
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (5) = happyShift action_2
action_83 (6) = happyShift action_4
action_83 (7) = happyShift action_5
action_83 (8) = happyShift action_6
action_83 (9) = happyShift action_7
action_83 (12) = happyShift action_8
action_83 (13) = happyShift action_9
action_83 (14) = happyShift action_10
action_83 (15) = happyShift action_11
action_83 (16) = happyShift action_12
action_83 (17) = happyShift action_13
action_83 (21) = happyShift action_14
action_83 (24) = happyShift action_15
action_83 (35) = happyShift action_16
action_83 (4) = happyGoto action_84
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (18) = happyShift action_28
action_84 (20) = happyShift action_29
action_84 (22) = happyShift action_30
action_84 (23) = happyShift action_31
action_84 (24) = happyShift action_32
action_84 (25) = happyShift action_33
action_84 (26) = happyShift action_34
action_84 (27) = happyShift action_35
action_84 (28) = happyShift action_36
action_84 (29) = happyShift action_37
action_84 (30) = happyShift action_38
action_84 (31) = happyShift action_39
action_84 (32) = happyShift action_40
action_84 (33) = happyShift action_41
action_84 (34) = happyShift action_42
action_84 (36) = happyShift action_85
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_18

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn4
		 (EInt happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 _
	 =  HappyAbsSyn4
		 (EBool True
	)

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (EBool False
	)

happyReduce_4 = happySpecReduce_3  4 happyReduction_4
happyReduction_4 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Equivalent happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Not happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (And happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Negative happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Add happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Minus happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Multiply happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Divide happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  4 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Exponential happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  4 happyReduction_13
happyReduction_13 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Lesser happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Greater happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (LesserEqual happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (GreaterEqual happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  4 happyReduction_17
happyReduction_17 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Or happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 12 4 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_11) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (EIf happy_var_3 happy_var_7 happy_var_11
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 4 4 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (EPrint happy_var_3
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 6 4 happyReduction_20
happyReduction_20 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (EWhile happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 4 4 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (EIncS happy_var_3
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 4 4 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ERedS happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 6 4 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (EGetS happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 4 4 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ELenS happy_var_3
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_3  4 happyReduction_25
happyReduction_25 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (EIndex happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  4 happyReduction_26
happyReduction_26 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Comma happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  4 happyReduction_27
happyReduction_27 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (End happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  4 happyReduction_28
happyReduction_28 (HappyAbsSyn4  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn4
		 (EAssignment happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  4 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 39 39 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt _ happy_dollar_dollar -> cont 5;
	TokenVar _ happy_dollar_dollar -> cont 6;
	TokenTrue _ -> cont 7;
	TokenFalse _ -> cont 8;
	TokenIf _ -> cont 9;
	TokenThen _ -> cont 10;
	TokenElse _ -> cont 11;
	TokenWhile _ -> cont 12;
	TokenPrint _ -> cont 13;
	TokenIncrementS _ -> cont 14;
	TokenReduceS _ -> cont 15;
	TokenGetS _ happy_dollar_dollar -> cont 16;
	TokenLengthS _ -> cont 17;
	TokenIndex _ -> cont 18;
	TokenEqual _ -> cont 19;
	TokenEquivalent _ -> cont 20;
	TokenNot _ -> cont 21;
	TokenAnd _ -> cont 22;
	TokenAdd _ -> cont 23;
	TokenMinus _ -> cont 24;
	TokenMultiply _ -> cont 25;
	TokenDivide _ -> cont 26;
	TokenExponential _ -> cont 27;
	TokenLesser _ -> cont 28;
	TokenGreater _ -> cont 29;
	TokenLesserEqual _ -> cont 30;
	TokenGreaterEqual  _ -> cont 31;
	TokenOr _ -> cont 32;
	TokenComma _ -> cont 33;
	TokenEndExp _ -> cont 34;
	TokenLeftParen _ -> cont 35;
	TokenRightParen _ -> cont 36;
	TokenLeftBracket _ -> cont 37;
	TokenRightBracket _ -> cont 38;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 39 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))


data Exp = EInt Int
         | EString String
         | Var String
         | EBool Bool
         | Equivalent Exp Exp
         | Not Exp
         | And Exp Exp 
         | Negative Exp		 
         | Add Exp Exp 
         | Minus Exp Exp
         | Multiply Exp Exp 
         | Divide Exp Exp 
         | Exponential Exp Exp
         | Lesser Exp Exp
         | Greater Exp Exp
         | LesserEqual Exp Exp
         | GreaterEqual Exp Exp         
         | Or Exp Exp
         | EIf Exp Exp Exp
         | EPrint Exp
         | EWhile Exp Exp
         | EIncS Exp
         | ERedS Exp
         | EGetS Exp Exp
         | ELenS Exp
         | EIndex Exp Exp
         | End Exp Exp
         | Comma Exp Exp
         | EAssignment String Exp
         deriving (Show,Eq)
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "D:/GitHub/haskell-platform/build/ghc-bindist/local/lib/include/ghcversion.h" #-}















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "F:/Users/randy/AppData/Local/Temp/ghc1900_0/ghc_2.h" #-}


























































































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates\\\\GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 75 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 84 "templates\\\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 147 "templates\\\\GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates\\\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates\\\\GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
