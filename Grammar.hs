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
happyExpList = Happy_Data_Array.listArray (0,182) ([39408,4100,8,0,0,0,59392,511,512,0,0,0,0,0,0,32,0,63504,588,31752,294,15876,147,40706,73,1,32762,1,0,32768,8190,0,0,19704,2050,9852,1025,37694,512,18847,33024,9423,49280,4711,57408,2355,61472,1177,63504,588,31752,294,15876,147,40706,73,53121,32804,26560,16402,13280,8201,39408,4100,40960,2047,36864,15,59392,135,62464,67,64000,57,64768,28,0,0,8256,0,4128,0,3600,0,1800,0,996,0,0,0,0,32768,24574,16384,12287,0,0,128,0,64,0,18847,33024,9423,128,64768,63,65160,61471,1177,16,65440,7,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exp","int","var","True","False","If","Then","Else","While","Print","'='","'=='","'!'","'&&'","'+'","'-'","'*'","'/'","'^'","'<'","'>'","'<='","'>='","'|'","';'","'('","')'","%eof"]
        bit_start = st * 31
        bit_end = (st + 1) * 31
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..30]
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
action_0 (16) = happyShift action_10
action_0 (19) = happyShift action_11
action_0 (29) = happyShift action_12
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (5) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (15) = happyShift action_20
action_3 (17) = happyShift action_21
action_3 (18) = happyShift action_22
action_3 (19) = happyShift action_23
action_3 (20) = happyShift action_24
action_3 (21) = happyShift action_25
action_3 (22) = happyShift action_26
action_3 (23) = happyShift action_27
action_3 (24) = happyShift action_28
action_3 (25) = happyShift action_29
action_3 (26) = happyShift action_30
action_3 (27) = happyShift action_31
action_3 (28) = happyShift action_32
action_3 (31) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (14) = happyShift action_19
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_2

action_6 _ = happyReduce_3

action_7 (29) = happyShift action_18
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (29) = happyShift action_17
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (5) = happyShift action_2
action_9 (6) = happyShift action_4
action_9 (7) = happyShift action_5
action_9 (8) = happyShift action_6
action_9 (9) = happyShift action_7
action_9 (12) = happyShift action_8
action_9 (13) = happyShift action_9
action_9 (16) = happyShift action_10
action_9 (19) = happyShift action_11
action_9 (29) = happyShift action_12
action_9 (4) = happyGoto action_16
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (5) = happyShift action_2
action_10 (6) = happyShift action_4
action_10 (7) = happyShift action_5
action_10 (8) = happyShift action_6
action_10 (9) = happyShift action_7
action_10 (12) = happyShift action_8
action_10 (13) = happyShift action_9
action_10 (16) = happyShift action_10
action_10 (19) = happyShift action_11
action_10 (29) = happyShift action_12
action_10 (4) = happyGoto action_15
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (5) = happyShift action_2
action_11 (6) = happyShift action_4
action_11 (7) = happyShift action_5
action_11 (8) = happyShift action_6
action_11 (9) = happyShift action_7
action_11 (12) = happyShift action_8
action_11 (13) = happyShift action_9
action_11 (16) = happyShift action_10
action_11 (19) = happyShift action_11
action_11 (29) = happyShift action_12
action_11 (4) = happyGoto action_14
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (5) = happyShift action_2
action_12 (6) = happyShift action_4
action_12 (7) = happyShift action_5
action_12 (8) = happyShift action_6
action_12 (9) = happyShift action_7
action_12 (12) = happyShift action_8
action_12 (13) = happyShift action_9
action_12 (16) = happyShift action_10
action_12 (19) = happyShift action_11
action_12 (29) = happyShift action_12
action_12 (4) = happyGoto action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (15) = happyShift action_20
action_13 (17) = happyShift action_21
action_13 (18) = happyShift action_22
action_13 (19) = happyShift action_23
action_13 (20) = happyShift action_24
action_13 (21) = happyShift action_25
action_13 (22) = happyShift action_26
action_13 (23) = happyShift action_27
action_13 (24) = happyShift action_28
action_13 (25) = happyShift action_29
action_13 (26) = happyShift action_30
action_13 (27) = happyShift action_31
action_13 (28) = happyShift action_32
action_13 (30) = happyShift action_49
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_7

action_15 (15) = happyShift action_20
action_15 (17) = happyShift action_21
action_15 (18) = happyShift action_22
action_15 (19) = happyShift action_23
action_15 (20) = happyShift action_24
action_15 (21) = happyShift action_25
action_15 (22) = happyShift action_26
action_15 (23) = happyShift action_27
action_15 (24) = happyShift action_28
action_15 (25) = happyShift action_29
action_15 (26) = happyShift action_30
action_15 (27) = happyShift action_31
action_15 (28) = happyShift action_32
action_15 _ = happyReduce_5

action_16 (15) = happyShift action_20
action_16 (17) = happyShift action_21
action_16 (18) = happyShift action_22
action_16 (19) = happyShift action_23
action_16 (20) = happyShift action_24
action_16 (21) = happyShift action_25
action_16 (22) = happyShift action_26
action_16 (23) = happyShift action_27
action_16 (24) = happyShift action_28
action_16 (25) = happyShift action_29
action_16 (26) = happyShift action_30
action_16 (27) = happyShift action_31
action_16 (28) = happyShift action_32
action_16 _ = happyReduce_19

action_17 (5) = happyShift action_2
action_17 (6) = happyShift action_4
action_17 (7) = happyShift action_5
action_17 (8) = happyShift action_6
action_17 (9) = happyShift action_7
action_17 (12) = happyShift action_8
action_17 (13) = happyShift action_9
action_17 (16) = happyShift action_10
action_17 (19) = happyShift action_11
action_17 (29) = happyShift action_12
action_17 (4) = happyGoto action_48
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (5) = happyShift action_2
action_18 (6) = happyShift action_4
action_18 (7) = happyShift action_5
action_18 (8) = happyShift action_6
action_18 (9) = happyShift action_7
action_18 (12) = happyShift action_8
action_18 (13) = happyShift action_9
action_18 (16) = happyShift action_10
action_18 (19) = happyShift action_11
action_18 (29) = happyShift action_12
action_18 (4) = happyGoto action_47
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (5) = happyShift action_2
action_19 (6) = happyShift action_4
action_19 (7) = happyShift action_5
action_19 (8) = happyShift action_6
action_19 (9) = happyShift action_7
action_19 (12) = happyShift action_8
action_19 (13) = happyShift action_9
action_19 (16) = happyShift action_10
action_19 (19) = happyShift action_11
action_19 (29) = happyShift action_12
action_19 (4) = happyGoto action_46
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (5) = happyShift action_2
action_20 (6) = happyShift action_4
action_20 (7) = happyShift action_5
action_20 (8) = happyShift action_6
action_20 (9) = happyShift action_7
action_20 (12) = happyShift action_8
action_20 (13) = happyShift action_9
action_20 (16) = happyShift action_10
action_20 (19) = happyShift action_11
action_20 (29) = happyShift action_12
action_20 (4) = happyGoto action_45
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (5) = happyShift action_2
action_21 (6) = happyShift action_4
action_21 (7) = happyShift action_5
action_21 (8) = happyShift action_6
action_21 (9) = happyShift action_7
action_21 (12) = happyShift action_8
action_21 (13) = happyShift action_9
action_21 (16) = happyShift action_10
action_21 (19) = happyShift action_11
action_21 (29) = happyShift action_12
action_21 (4) = happyGoto action_44
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (5) = happyShift action_2
action_22 (6) = happyShift action_4
action_22 (7) = happyShift action_5
action_22 (8) = happyShift action_6
action_22 (9) = happyShift action_7
action_22 (12) = happyShift action_8
action_22 (13) = happyShift action_9
action_22 (16) = happyShift action_10
action_22 (19) = happyShift action_11
action_22 (29) = happyShift action_12
action_22 (4) = happyGoto action_43
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (5) = happyShift action_2
action_23 (6) = happyShift action_4
action_23 (7) = happyShift action_5
action_23 (8) = happyShift action_6
action_23 (9) = happyShift action_7
action_23 (12) = happyShift action_8
action_23 (13) = happyShift action_9
action_23 (16) = happyShift action_10
action_23 (19) = happyShift action_11
action_23 (29) = happyShift action_12
action_23 (4) = happyGoto action_42
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (5) = happyShift action_2
action_24 (6) = happyShift action_4
action_24 (7) = happyShift action_5
action_24 (8) = happyShift action_6
action_24 (9) = happyShift action_7
action_24 (12) = happyShift action_8
action_24 (13) = happyShift action_9
action_24 (16) = happyShift action_10
action_24 (19) = happyShift action_11
action_24 (29) = happyShift action_12
action_24 (4) = happyGoto action_41
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (5) = happyShift action_2
action_25 (6) = happyShift action_4
action_25 (7) = happyShift action_5
action_25 (8) = happyShift action_6
action_25 (9) = happyShift action_7
action_25 (12) = happyShift action_8
action_25 (13) = happyShift action_9
action_25 (16) = happyShift action_10
action_25 (19) = happyShift action_11
action_25 (29) = happyShift action_12
action_25 (4) = happyGoto action_40
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (5) = happyShift action_2
action_26 (6) = happyShift action_4
action_26 (7) = happyShift action_5
action_26 (8) = happyShift action_6
action_26 (9) = happyShift action_7
action_26 (12) = happyShift action_8
action_26 (13) = happyShift action_9
action_26 (16) = happyShift action_10
action_26 (19) = happyShift action_11
action_26 (29) = happyShift action_12
action_26 (4) = happyGoto action_39
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (5) = happyShift action_2
action_27 (6) = happyShift action_4
action_27 (7) = happyShift action_5
action_27 (8) = happyShift action_6
action_27 (9) = happyShift action_7
action_27 (12) = happyShift action_8
action_27 (13) = happyShift action_9
action_27 (16) = happyShift action_10
action_27 (19) = happyShift action_11
action_27 (29) = happyShift action_12
action_27 (4) = happyGoto action_38
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (5) = happyShift action_2
action_28 (6) = happyShift action_4
action_28 (7) = happyShift action_5
action_28 (8) = happyShift action_6
action_28 (9) = happyShift action_7
action_28 (12) = happyShift action_8
action_28 (13) = happyShift action_9
action_28 (16) = happyShift action_10
action_28 (19) = happyShift action_11
action_28 (29) = happyShift action_12
action_28 (4) = happyGoto action_37
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (5) = happyShift action_2
action_29 (6) = happyShift action_4
action_29 (7) = happyShift action_5
action_29 (8) = happyShift action_6
action_29 (9) = happyShift action_7
action_29 (12) = happyShift action_8
action_29 (13) = happyShift action_9
action_29 (16) = happyShift action_10
action_29 (19) = happyShift action_11
action_29 (29) = happyShift action_12
action_29 (4) = happyGoto action_36
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (5) = happyShift action_2
action_30 (6) = happyShift action_4
action_30 (7) = happyShift action_5
action_30 (8) = happyShift action_6
action_30 (9) = happyShift action_7
action_30 (12) = happyShift action_8
action_30 (13) = happyShift action_9
action_30 (16) = happyShift action_10
action_30 (19) = happyShift action_11
action_30 (29) = happyShift action_12
action_30 (4) = happyGoto action_35
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (5) = happyShift action_2
action_31 (6) = happyShift action_4
action_31 (7) = happyShift action_5
action_31 (8) = happyShift action_6
action_31 (9) = happyShift action_7
action_31 (12) = happyShift action_8
action_31 (13) = happyShift action_9
action_31 (16) = happyShift action_10
action_31 (19) = happyShift action_11
action_31 (29) = happyShift action_12
action_31 (4) = happyGoto action_34
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (5) = happyShift action_2
action_32 (6) = happyShift action_4
action_32 (7) = happyShift action_5
action_32 (8) = happyShift action_6
action_32 (9) = happyShift action_7
action_32 (12) = happyShift action_8
action_32 (13) = happyShift action_9
action_32 (16) = happyShift action_10
action_32 (19) = happyShift action_11
action_32 (29) = happyShift action_12
action_32 (4) = happyGoto action_33
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (15) = happyShift action_20
action_33 (17) = happyShift action_21
action_33 (18) = happyShift action_22
action_33 (19) = happyShift action_23
action_33 (20) = happyShift action_24
action_33 (21) = happyShift action_25
action_33 (22) = happyShift action_26
action_33 (23) = happyShift action_27
action_33 (24) = happyShift action_28
action_33 (25) = happyShift action_29
action_33 (26) = happyShift action_30
action_33 (27) = happyShift action_31
action_33 (28) = happyShift action_32
action_33 _ = happyReduce_21

action_34 (15) = happyShift action_20
action_34 (18) = happyShift action_22
action_34 (19) = happyShift action_23
action_34 (20) = happyShift action_24
action_34 (21) = happyShift action_25
action_34 (22) = happyShift action_26
action_34 _ = happyReduce_17

action_35 (15) = happyShift action_20
action_35 (17) = happyShift action_21
action_35 (18) = happyShift action_22
action_35 (19) = happyShift action_23
action_35 (20) = happyShift action_24
action_35 (21) = happyShift action_25
action_35 (22) = happyShift action_26
action_35 (27) = happyShift action_31
action_35 _ = happyReduce_16

action_36 (15) = happyShift action_20
action_36 (17) = happyShift action_21
action_36 (18) = happyShift action_22
action_36 (19) = happyShift action_23
action_36 (20) = happyShift action_24
action_36 (21) = happyShift action_25
action_36 (22) = happyShift action_26
action_36 (27) = happyShift action_31
action_36 _ = happyReduce_15

action_37 (15) = happyShift action_20
action_37 (17) = happyShift action_21
action_37 (18) = happyShift action_22
action_37 (19) = happyShift action_23
action_37 (20) = happyShift action_24
action_37 (21) = happyShift action_25
action_37 (22) = happyShift action_26
action_37 (23) = happyFail []
action_37 (24) = happyFail []
action_37 (25) = happyShift action_29
action_37 (26) = happyShift action_30
action_37 (27) = happyShift action_31
action_37 _ = happyReduce_14

action_38 (15) = happyShift action_20
action_38 (17) = happyShift action_21
action_38 (18) = happyShift action_22
action_38 (19) = happyShift action_23
action_38 (20) = happyShift action_24
action_38 (21) = happyShift action_25
action_38 (22) = happyShift action_26
action_38 (23) = happyFail []
action_38 (24) = happyFail []
action_38 (25) = happyShift action_29
action_38 (26) = happyShift action_30
action_38 (27) = happyShift action_31
action_38 _ = happyReduce_13

action_39 _ = happyReduce_12

action_40 (15) = happyShift action_20
action_40 (22) = happyShift action_26
action_40 _ = happyReduce_11

action_41 (15) = happyShift action_20
action_41 (22) = happyShift action_26
action_41 _ = happyReduce_10

action_42 (15) = happyShift action_20
action_42 (20) = happyShift action_24
action_42 (21) = happyShift action_25
action_42 (22) = happyShift action_26
action_42 _ = happyReduce_9

action_43 (15) = happyShift action_20
action_43 (20) = happyShift action_24
action_43 (21) = happyShift action_25
action_43 (22) = happyShift action_26
action_43 _ = happyReduce_8

action_44 (15) = happyShift action_20
action_44 (18) = happyShift action_22
action_44 (19) = happyShift action_23
action_44 (20) = happyShift action_24
action_44 (21) = happyShift action_25
action_44 (22) = happyShift action_26
action_44 _ = happyReduce_6

action_45 _ = happyReduce_4

action_46 (15) = happyShift action_20
action_46 (17) = happyShift action_21
action_46 (18) = happyShift action_22
action_46 (19) = happyShift action_23
action_46 (20) = happyShift action_24
action_46 (21) = happyShift action_25
action_46 (22) = happyShift action_26
action_46 (23) = happyShift action_27
action_46 (24) = happyShift action_28
action_46 (25) = happyShift action_29
action_46 (26) = happyShift action_30
action_46 (27) = happyShift action_31
action_46 (28) = happyShift action_32
action_46 _ = happyReduce_22

action_47 (15) = happyShift action_20
action_47 (17) = happyShift action_21
action_47 (18) = happyShift action_22
action_47 (19) = happyShift action_23
action_47 (20) = happyShift action_24
action_47 (21) = happyShift action_25
action_47 (22) = happyShift action_26
action_47 (23) = happyShift action_27
action_47 (24) = happyShift action_28
action_47 (25) = happyShift action_29
action_47 (26) = happyShift action_30
action_47 (27) = happyShift action_31
action_47 (28) = happyShift action_32
action_47 (30) = happyShift action_51
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (15) = happyShift action_20
action_48 (17) = happyShift action_21
action_48 (18) = happyShift action_22
action_48 (19) = happyShift action_23
action_48 (20) = happyShift action_24
action_48 (21) = happyShift action_25
action_48 (22) = happyShift action_26
action_48 (23) = happyShift action_27
action_48 (24) = happyShift action_28
action_48 (25) = happyShift action_29
action_48 (26) = happyShift action_30
action_48 (27) = happyShift action_31
action_48 (28) = happyShift action_32
action_48 (30) = happyShift action_50
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_23

action_50 (10) = happyShift action_53
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (10) = happyShift action_52
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (5) = happyShift action_2
action_52 (6) = happyShift action_4
action_52 (7) = happyShift action_5
action_52 (8) = happyShift action_6
action_52 (9) = happyShift action_7
action_52 (12) = happyShift action_8
action_52 (13) = happyShift action_9
action_52 (16) = happyShift action_10
action_52 (19) = happyShift action_11
action_52 (29) = happyShift action_12
action_52 (4) = happyGoto action_55
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (5) = happyShift action_2
action_53 (6) = happyShift action_4
action_53 (7) = happyShift action_5
action_53 (8) = happyShift action_6
action_53 (9) = happyShift action_7
action_53 (12) = happyShift action_8
action_53 (13) = happyShift action_9
action_53 (16) = happyShift action_10
action_53 (19) = happyShift action_11
action_53 (29) = happyShift action_12
action_53 (4) = happyGoto action_54
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (15) = happyShift action_20
action_54 (17) = happyShift action_21
action_54 (18) = happyShift action_22
action_54 (19) = happyShift action_23
action_54 (20) = happyShift action_24
action_54 (21) = happyShift action_25
action_54 (22) = happyShift action_26
action_54 (23) = happyShift action_27
action_54 (24) = happyShift action_28
action_54 (25) = happyShift action_29
action_54 (26) = happyShift action_30
action_54 (27) = happyShift action_31
action_54 (28) = happyShift action_32
action_54 _ = happyReduce_20

action_55 (11) = happyShift action_56
action_55 (15) = happyShift action_20
action_55 (17) = happyShift action_21
action_55 (18) = happyShift action_22
action_55 (19) = happyShift action_23
action_55 (20) = happyShift action_24
action_55 (21) = happyShift action_25
action_55 (22) = happyShift action_26
action_55 (23) = happyShift action_27
action_55 (24) = happyShift action_28
action_55 (25) = happyShift action_29
action_55 (26) = happyShift action_30
action_55 (27) = happyShift action_31
action_55 (28) = happyShift action_32
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (5) = happyShift action_2
action_56 (6) = happyShift action_4
action_56 (7) = happyShift action_5
action_56 (8) = happyShift action_6
action_56 (9) = happyShift action_7
action_56 (12) = happyShift action_8
action_56 (13) = happyShift action_9
action_56 (16) = happyShift action_10
action_56 (19) = happyShift action_11
action_56 (29) = happyShift action_12
action_56 (4) = happyGoto action_57
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (15) = happyShift action_20
action_57 (17) = happyShift action_21
action_57 (18) = happyShift action_22
action_57 (19) = happyShift action_23
action_57 (20) = happyShift action_24
action_57 (21) = happyShift action_25
action_57 (22) = happyShift action_26
action_57 (23) = happyShift action_27
action_57 (24) = happyShift action_28
action_57 (25) = happyShift action_29
action_57 (26) = happyShift action_30
action_57 (27) = happyShift action_31
action_57 (28) = happyShift action_32
action_57 _ = happyReduce_18

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn4
		 (Int happy_var_1
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

happyReduce_21 = happySpecReduce_3  4 happyReduction_21
happyReduction_21 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (End happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  4 happyReduction_22
happyReduction_22 (HappyAbsSyn4  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn4
		 (EAssignment happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  4 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 31 31 notHappyAtAll (HappyState action) sts stk []

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
	TokenEqual _ -> cont 14;
	TokenEquivalent _ -> cont 15;
	TokenNot _ -> cont 16;
	TokenAnd _ -> cont 17;
	TokenAdd _ -> cont 18;
	TokenMinus _ -> cont 19;
	TokenMultiply _ -> cont 20;
	TokenDivide _ -> cont 21;
	TokenExponential _ -> cont 22;
	TokenLesser _ -> cont 23;
	TokenGreater _ -> cont 24;
	TokenLesserEqual _ -> cont 25;
	TokenGreaterEqual  _ -> cont 26;
	TokenOr _ -> cont 27;
	TokenEndExp _ -> cont 28;
	TokenLeftParen _ -> cont 29;
	TokenRightParen _ -> cont 30;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 31 tk tks = happyError' (tks, explist)
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


data Exp = Int Int
         | String
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
         | End Exp Exp
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
