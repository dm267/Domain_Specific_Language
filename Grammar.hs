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
happyExpList = Happy_Data_Array.listArray (0,275) ([63984,145,1026,0,0,0,0,0,65448,7,1024,0,0,0,0,0,0,0,2048,0,0,31746,9342,128,0,8192,0,0,8,0,512,0,32768,40704,2335,49184,18407,2050,63984,145,2,64128,383,0,0,0,65440,61447,37369,512,32380,32804,40704,2335,49184,18407,2050,0,0,31744,9342,128,8095,8201,59328,583,61448,37369,512,32380,32804,40704,2335,49184,18407,2050,63984,145,31746,9342,128,8095,8201,59328,583,61448,37369,512,32380,32804,40704,2335,49184,18407,2050,63984,145,31746,9342,128,32768,8190,0,7968,0,59392,135,0,8698,0,32384,14,40960,927,0,0,0,512,1,32768,64,0,7200,0,2048,7,0,498,0,0,0,0,0,0,0,0,64128,383,40960,24574,0,65448,23,59904,1535,32768,32762,1,65184,95,0,0,0,0,0,0,0,0,0,0,0,0,2,0,128,0,40704,2335,49184,18407,2050,0,65512,1,64129,127,8095,8201,0,65440,7,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exp","int","var","True","False","If","Then","Else","While","Print","incrementStream","reduceStream","getStream","Length","'!!'","'='","'=='","'!'","'&&'","'+'","'-'","'*'","'/'","'^'","'<'","'>'","'<='","'>='","'|'","';'","'('","')'","'['","']'","%eof"]
        bit_start = st * 38
        bit_end = (st + 1) * 38
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..37]
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
action_0 (34) = happyShift action_16
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
action_3 (38) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (19) = happyShift action_27
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_2

action_6 _ = happyReduce_3

action_7 (34) = happyShift action_26
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (34) = happyShift action_25
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (5) = happyShift action_2
action_9 (6) = happyShift action_4
action_9 (7) = happyShift action_5
action_9 (8) = happyShift action_6
action_9 (9) = happyShift action_7
action_9 (12) = happyShift action_8
action_9 (13) = happyShift action_9
action_9 (14) = happyShift action_10
action_9 (15) = happyShift action_11
action_9 (16) = happyShift action_12
action_9 (17) = happyShift action_13
action_9 (21) = happyShift action_14
action_9 (24) = happyShift action_15
action_9 (34) = happyShift action_16
action_9 (4) = happyGoto action_24
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (34) = happyShift action_23
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (34) = happyShift action_22
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (34) = happyShift action_21
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (34) = happyShift action_20
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
action_14 (34) = happyShift action_16
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
action_15 (34) = happyShift action_16
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
action_16 (34) = happyShift action_16
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
action_17 (35) = happyShift action_63
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (18) = happyShift action_28
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
action_20 (34) = happyShift action_16
action_20 (4) = happyGoto action_62
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
action_21 (34) = happyShift action_16
action_21 (4) = happyGoto action_61
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
action_22 (34) = happyShift action_16
action_22 (4) = happyGoto action_60
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
action_23 (34) = happyShift action_16
action_23 (4) = happyGoto action_59
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (18) = happyShift action_28
action_24 (20) = happyShift action_29
action_24 (22) = happyShift action_30
action_24 (23) = happyShift action_31
action_24 (24) = happyShift action_32
action_24 (25) = happyShift action_33
action_24 (26) = happyShift action_34
action_24 (27) = happyShift action_35
action_24 (28) = happyShift action_36
action_24 (29) = happyShift action_37
action_24 (30) = happyShift action_38
action_24 (31) = happyShift action_39
action_24 (32) = happyShift action_40
action_24 (33) = happyShift action_41
action_24 _ = happyReduce_19

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
action_25 (34) = happyShift action_16
action_25 (4) = happyGoto action_58
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
action_26 (34) = happyShift action_16
action_26 (4) = happyGoto action_57
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
action_27 (34) = happyShift action_16
action_27 (4) = happyGoto action_56
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
action_28 (34) = happyShift action_16
action_28 (4) = happyGoto action_55
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
action_29 (34) = happyShift action_16
action_29 (4) = happyGoto action_54
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
action_30 (34) = happyShift action_16
action_30 (4) = happyGoto action_53
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
action_31 (34) = happyShift action_16
action_31 (4) = happyGoto action_52
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
action_32 (34) = happyShift action_16
action_32 (4) = happyGoto action_51
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
action_33 (34) = happyShift action_16
action_33 (4) = happyGoto action_50
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
action_34 (34) = happyShift action_16
action_34 (4) = happyGoto action_49
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
action_35 (34) = happyShift action_16
action_35 (4) = happyGoto action_48
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
action_36 (34) = happyShift action_16
action_36 (4) = happyGoto action_47
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
action_37 (34) = happyShift action_16
action_37 (4) = happyGoto action_46
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
action_38 (34) = happyShift action_16
action_38 (4) = happyGoto action_45
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
action_39 (34) = happyShift action_16
action_39 (4) = happyGoto action_44
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
action_40 (34) = happyShift action_16
action_40 (4) = happyGoto action_43
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
action_41 (34) = happyShift action_16
action_41 (4) = happyGoto action_42
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (18) = happyShift action_28
action_42 (20) = happyShift action_29
action_42 (22) = happyShift action_30
action_42 (23) = happyShift action_31
action_42 (24) = happyShift action_32
action_42 (25) = happyShift action_33
action_42 (26) = happyShift action_34
action_42 (27) = happyShift action_35
action_42 (28) = happyShift action_36
action_42 (29) = happyShift action_37
action_42 (30) = happyShift action_38
action_42 (31) = happyShift action_39
action_42 (32) = happyShift action_40
action_42 (33) = happyShift action_41
action_42 _ = happyReduce_26

action_43 (18) = happyShift action_28
action_43 (20) = happyShift action_29
action_43 (23) = happyShift action_31
action_43 (24) = happyShift action_32
action_43 (25) = happyShift action_33
action_43 (26) = happyShift action_34
action_43 (27) = happyShift action_35
action_43 _ = happyReduce_17

action_44 (18) = happyShift action_28
action_44 (20) = happyShift action_29
action_44 (22) = happyShift action_30
action_44 (23) = happyShift action_31
action_44 (24) = happyShift action_32
action_44 (25) = happyShift action_33
action_44 (26) = happyShift action_34
action_44 (27) = happyShift action_35
action_44 (32) = happyShift action_40
action_44 _ = happyReduce_16

action_45 (18) = happyShift action_28
action_45 (20) = happyShift action_29
action_45 (22) = happyShift action_30
action_45 (23) = happyShift action_31
action_45 (24) = happyShift action_32
action_45 (25) = happyShift action_33
action_45 (26) = happyShift action_34
action_45 (27) = happyShift action_35
action_45 (32) = happyShift action_40
action_45 _ = happyReduce_15

action_46 (18) = happyShift action_28
action_46 (20) = happyShift action_29
action_46 (22) = happyShift action_30
action_46 (23) = happyShift action_31
action_46 (24) = happyShift action_32
action_46 (25) = happyShift action_33
action_46 (26) = happyShift action_34
action_46 (27) = happyShift action_35
action_46 (28) = happyFail []
action_46 (29) = happyFail []
action_46 (30) = happyShift action_38
action_46 (31) = happyShift action_39
action_46 (32) = happyShift action_40
action_46 _ = happyReduce_14

action_47 (18) = happyShift action_28
action_47 (20) = happyShift action_29
action_47 (22) = happyShift action_30
action_47 (23) = happyShift action_31
action_47 (24) = happyShift action_32
action_47 (25) = happyShift action_33
action_47 (26) = happyShift action_34
action_47 (27) = happyShift action_35
action_47 (28) = happyFail []
action_47 (29) = happyFail []
action_47 (30) = happyShift action_38
action_47 (31) = happyShift action_39
action_47 (32) = happyShift action_40
action_47 _ = happyReduce_13

action_48 (18) = happyShift action_28
action_48 _ = happyReduce_12

action_49 (18) = happyShift action_28
action_49 (20) = happyShift action_29
action_49 (27) = happyShift action_35
action_49 _ = happyReduce_11

action_50 (18) = happyShift action_28
action_50 (20) = happyShift action_29
action_50 (27) = happyShift action_35
action_50 _ = happyReduce_10

action_51 (18) = happyShift action_28
action_51 (20) = happyShift action_29
action_51 (25) = happyShift action_33
action_51 (26) = happyShift action_34
action_51 (27) = happyShift action_35
action_51 _ = happyReduce_9

action_52 (18) = happyShift action_28
action_52 (20) = happyShift action_29
action_52 (25) = happyShift action_33
action_52 (26) = happyShift action_34
action_52 (27) = happyShift action_35
action_52 _ = happyReduce_8

action_53 (18) = happyShift action_28
action_53 (20) = happyShift action_29
action_53 (23) = happyShift action_31
action_53 (24) = happyShift action_32
action_53 (25) = happyShift action_33
action_53 (26) = happyShift action_34
action_53 (27) = happyShift action_35
action_53 _ = happyReduce_6

action_54 (18) = happyShift action_28
action_54 _ = happyReduce_4

action_55 (18) = happyShift action_28
action_55 (20) = happyShift action_29
action_55 (22) = happyShift action_30
action_55 (23) = happyShift action_31
action_55 (24) = happyShift action_32
action_55 (25) = happyShift action_33
action_55 (26) = happyShift action_34
action_55 (27) = happyShift action_35
action_55 (28) = happyShift action_36
action_55 (29) = happyShift action_37
action_55 (30) = happyShift action_38
action_55 (31) = happyShift action_39
action_55 (32) = happyShift action_40
action_55 (33) = happyShift action_41
action_55 _ = happyReduce_25

action_56 (18) = happyShift action_28
action_56 (20) = happyShift action_29
action_56 (22) = happyShift action_30
action_56 (23) = happyShift action_31
action_56 (24) = happyShift action_32
action_56 (25) = happyShift action_33
action_56 (26) = happyShift action_34
action_56 (27) = happyShift action_35
action_56 (28) = happyShift action_36
action_56 (29) = happyShift action_37
action_56 (30) = happyShift action_38
action_56 (31) = happyShift action_39
action_56 (32) = happyShift action_40
action_56 (33) = happyShift action_41
action_56 _ = happyReduce_27

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
action_57 (35) = happyShift action_69
action_57 _ = happyFail (happyExpListPerState 57)

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
action_58 (35) = happyShift action_68
action_58 _ = happyFail (happyExpListPerState 58)

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
action_59 (35) = happyShift action_67
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
action_60 (35) = happyShift action_66
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
action_61 (35) = happyShift action_65
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
action_62 (35) = happyShift action_64
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_28

action_64 _ = happyReduce_24

action_65 _ = happyReduce_23

action_66 _ = happyReduce_22

action_67 _ = happyReduce_21

action_68 (10) = happyShift action_71
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (10) = happyShift action_70
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (5) = happyShift action_2
action_70 (6) = happyShift action_4
action_70 (7) = happyShift action_5
action_70 (8) = happyShift action_6
action_70 (9) = happyShift action_7
action_70 (12) = happyShift action_8
action_70 (13) = happyShift action_9
action_70 (14) = happyShift action_10
action_70 (15) = happyShift action_11
action_70 (16) = happyShift action_12
action_70 (17) = happyShift action_13
action_70 (21) = happyShift action_14
action_70 (24) = happyShift action_15
action_70 (34) = happyShift action_16
action_70 (4) = happyGoto action_73
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (5) = happyShift action_2
action_71 (6) = happyShift action_4
action_71 (7) = happyShift action_5
action_71 (8) = happyShift action_6
action_71 (9) = happyShift action_7
action_71 (12) = happyShift action_8
action_71 (13) = happyShift action_9
action_71 (14) = happyShift action_10
action_71 (15) = happyShift action_11
action_71 (16) = happyShift action_12
action_71 (17) = happyShift action_13
action_71 (21) = happyShift action_14
action_71 (24) = happyShift action_15
action_71 (34) = happyShift action_16
action_71 (4) = happyGoto action_72
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (18) = happyShift action_28
action_72 (20) = happyShift action_29
action_72 (22) = happyShift action_30
action_72 (23) = happyShift action_31
action_72 (24) = happyShift action_32
action_72 (25) = happyShift action_33
action_72 (26) = happyShift action_34
action_72 (27) = happyShift action_35
action_72 (28) = happyShift action_36
action_72 (29) = happyShift action_37
action_72 (30) = happyShift action_38
action_72 (31) = happyShift action_39
action_72 (32) = happyShift action_40
action_72 (33) = happyShift action_41
action_72 _ = happyReduce_20

action_73 (11) = happyShift action_74
action_73 (18) = happyShift action_28
action_73 (20) = happyShift action_29
action_73 (22) = happyShift action_30
action_73 (23) = happyShift action_31
action_73 (24) = happyShift action_32
action_73 (25) = happyShift action_33
action_73 (26) = happyShift action_34
action_73 (27) = happyShift action_35
action_73 (28) = happyShift action_36
action_73 (29) = happyShift action_37
action_73 (30) = happyShift action_38
action_73 (31) = happyShift action_39
action_73 (32) = happyShift action_40
action_73 (33) = happyShift action_41
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (5) = happyShift action_2
action_74 (6) = happyShift action_4
action_74 (7) = happyShift action_5
action_74 (8) = happyShift action_6
action_74 (9) = happyShift action_7
action_74 (12) = happyShift action_8
action_74 (13) = happyShift action_9
action_74 (14) = happyShift action_10
action_74 (15) = happyShift action_11
action_74 (16) = happyShift action_12
action_74 (17) = happyShift action_13
action_74 (21) = happyShift action_14
action_74 (24) = happyShift action_15
action_74 (34) = happyShift action_16
action_74 (4) = happyGoto action_75
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (18) = happyShift action_28
action_75 (20) = happyShift action_29
action_75 (22) = happyShift action_30
action_75 (23) = happyShift action_31
action_75 (24) = happyShift action_32
action_75 (25) = happyShift action_33
action_75 (26) = happyShift action_34
action_75 (27) = happyShift action_35
action_75 (28) = happyShift action_36
action_75 (29) = happyShift action_37
action_75 (30) = happyShift action_38
action_75 (31) = happyShift action_39
action_75 (32) = happyShift action_40
action_75 (33) = happyShift action_41
action_75 _ = happyReduce_18

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

happyReduce_18 = happyReduce 8 4 happyReduction_18
happyReduction_18 ((HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (EIf happy_var_3 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_2  4 happyReduction_19
happyReduction_19 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (EPrint happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

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

happyReduce_23 = happyReduce 4 4 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (EGetS happy_var_3
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 4 4 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ELen happy_var_3
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
		 (End happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  4 happyReduction_27
happyReduction_27 (HappyAbsSyn4  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn4
		 (EAssignment happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  4 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 38 38 notHappyAtAll (HappyState action) sts stk []

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
	TokenGetS _ -> cont 16;
	TokenLength _ -> cont 17;
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
	TokenEndExp _ -> cont 33;
	TokenLeftParen _ -> cont 34;
	TokenRightParen _ -> cont 35;
	TokenLeftBracket _ -> cont 36;
	TokenRightBracket _ -> cont 37;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 38 tk tks = happyError' (tks, explist)
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
         | EGetS Exp
         | ELen Exp
         | EIndex Exp Exp
         | End Exp Exp
         | EAssignment String Exp
         deriving (Show,Eq)

























































































































































































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
