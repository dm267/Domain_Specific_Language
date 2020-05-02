{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,152) ([0,0,0,0,8320,0,0,0,32768,0,0,8192,18240,8210,18240,8210,0,0,0,0,0,0,0,0,0,8192,18240,8210,18240,8210,18240,8210,18240,8210,0,24573,18240,8210,18240,8210,18240,8210,18240,8210,18240,8210,18240,8210,18240,8210,18240,8210,18240,8210,18240,8210,18240,8210,18240,8210,2048,0,0,24573,0,0,0,8189,0,0,18240,8210,0,24573,0,0,8320,0,0,249,0,4349,0,4349,0,7421,0,7421,0,0,0,129,0,129,0,225,0,225,0,249,0,0,0,0,2048,0,8320,0,4096,0,8320,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exp2","Exp1","Exp","int","var","True","False","If","Then","Else","While","Print","'='","'=='","'!'","'&&'","'+'","'-'","'*'","'/'","'^'","'<'","'>'","'<='","'>='","'|'","'('","')'","%eof"]
        bit_start = st * 32
        bit_end = (st + 1) * 32
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..31]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (4) = happyGoto action_2
action_0 _ = happyReduce_1

action_1 _ = happyFail (happyExpListPerState 1)

action_2 (8) = happyShift action_4
action_2 (14) = happyShift action_5
action_2 (32) = happyAccept
action_2 (5) = happyGoto action_3
action_2 _ = happyFail (happyExpListPerState 2)

action_3 _ = happyReduce_2

action_4 (16) = happyShift action_7
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (30) = happyShift action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (7) = happyShift action_9
action_6 (9) = happyShift action_10
action_6 (10) = happyShift action_11
action_6 (11) = happyShift action_12
action_6 (15) = happyShift action_13
action_6 (18) = happyShift action_14
action_6 (21) = happyShift action_15
action_6 (30) = happyShift action_16
action_6 (6) = happyGoto action_17
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (7) = happyShift action_9
action_7 (9) = happyShift action_10
action_7 (10) = happyShift action_11
action_7 (11) = happyShift action_12
action_7 (15) = happyShift action_13
action_7 (18) = happyShift action_14
action_7 (21) = happyShift action_15
action_7 (30) = happyShift action_16
action_7 (6) = happyGoto action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (17) = happyShift action_18
action_8 (19) = happyShift action_19
action_8 (20) = happyShift action_20
action_8 (21) = happyShift action_21
action_8 (22) = happyShift action_22
action_8 (23) = happyShift action_23
action_8 (24) = happyShift action_24
action_8 (25) = happyShift action_25
action_8 (26) = happyShift action_26
action_8 (27) = happyShift action_27
action_8 (28) = happyShift action_28
action_8 (29) = happyShift action_29
action_8 _ = happyReduce_4

action_9 _ = happyReduce_5

action_10 _ = happyReduce_6

action_11 _ = happyReduce_7

action_12 (30) = happyShift action_35
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (7) = happyShift action_9
action_13 (9) = happyShift action_10
action_13 (10) = happyShift action_11
action_13 (11) = happyShift action_12
action_13 (15) = happyShift action_13
action_13 (18) = happyShift action_14
action_13 (21) = happyShift action_15
action_13 (30) = happyShift action_16
action_13 (6) = happyGoto action_34
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (7) = happyShift action_9
action_14 (9) = happyShift action_10
action_14 (10) = happyShift action_11
action_14 (11) = happyShift action_12
action_14 (15) = happyShift action_13
action_14 (18) = happyShift action_14
action_14 (21) = happyShift action_15
action_14 (30) = happyShift action_16
action_14 (6) = happyGoto action_33
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (7) = happyShift action_9
action_15 (9) = happyShift action_10
action_15 (10) = happyShift action_11
action_15 (11) = happyShift action_12
action_15 (15) = happyShift action_13
action_15 (18) = happyShift action_14
action_15 (21) = happyShift action_15
action_15 (30) = happyShift action_16
action_15 (6) = happyGoto action_32
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (7) = happyShift action_9
action_16 (9) = happyShift action_10
action_16 (10) = happyShift action_11
action_16 (11) = happyShift action_12
action_16 (15) = happyShift action_13
action_16 (18) = happyShift action_14
action_16 (21) = happyShift action_15
action_16 (30) = happyShift action_16
action_16 (6) = happyGoto action_31
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (17) = happyShift action_18
action_17 (19) = happyShift action_19
action_17 (20) = happyShift action_20
action_17 (21) = happyShift action_21
action_17 (22) = happyShift action_22
action_17 (23) = happyShift action_23
action_17 (24) = happyShift action_24
action_17 (25) = happyShift action_25
action_17 (26) = happyShift action_26
action_17 (27) = happyShift action_27
action_17 (28) = happyShift action_28
action_17 (29) = happyShift action_29
action_17 (31) = happyShift action_30
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (7) = happyShift action_9
action_18 (9) = happyShift action_10
action_18 (10) = happyShift action_11
action_18 (11) = happyShift action_12
action_18 (15) = happyShift action_13
action_18 (18) = happyShift action_14
action_18 (21) = happyShift action_15
action_18 (30) = happyShift action_16
action_18 (6) = happyGoto action_50
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (7) = happyShift action_9
action_19 (9) = happyShift action_10
action_19 (10) = happyShift action_11
action_19 (11) = happyShift action_12
action_19 (15) = happyShift action_13
action_19 (18) = happyShift action_14
action_19 (21) = happyShift action_15
action_19 (30) = happyShift action_16
action_19 (6) = happyGoto action_49
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (7) = happyShift action_9
action_20 (9) = happyShift action_10
action_20 (10) = happyShift action_11
action_20 (11) = happyShift action_12
action_20 (15) = happyShift action_13
action_20 (18) = happyShift action_14
action_20 (21) = happyShift action_15
action_20 (30) = happyShift action_16
action_20 (6) = happyGoto action_48
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (7) = happyShift action_9
action_21 (9) = happyShift action_10
action_21 (10) = happyShift action_11
action_21 (11) = happyShift action_12
action_21 (15) = happyShift action_13
action_21 (18) = happyShift action_14
action_21 (21) = happyShift action_15
action_21 (30) = happyShift action_16
action_21 (6) = happyGoto action_47
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (7) = happyShift action_9
action_22 (9) = happyShift action_10
action_22 (10) = happyShift action_11
action_22 (11) = happyShift action_12
action_22 (15) = happyShift action_13
action_22 (18) = happyShift action_14
action_22 (21) = happyShift action_15
action_22 (30) = happyShift action_16
action_22 (6) = happyGoto action_46
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (7) = happyShift action_9
action_23 (9) = happyShift action_10
action_23 (10) = happyShift action_11
action_23 (11) = happyShift action_12
action_23 (15) = happyShift action_13
action_23 (18) = happyShift action_14
action_23 (21) = happyShift action_15
action_23 (30) = happyShift action_16
action_23 (6) = happyGoto action_45
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (7) = happyShift action_9
action_24 (9) = happyShift action_10
action_24 (10) = happyShift action_11
action_24 (11) = happyShift action_12
action_24 (15) = happyShift action_13
action_24 (18) = happyShift action_14
action_24 (21) = happyShift action_15
action_24 (30) = happyShift action_16
action_24 (6) = happyGoto action_44
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (7) = happyShift action_9
action_25 (9) = happyShift action_10
action_25 (10) = happyShift action_11
action_25 (11) = happyShift action_12
action_25 (15) = happyShift action_13
action_25 (18) = happyShift action_14
action_25 (21) = happyShift action_15
action_25 (30) = happyShift action_16
action_25 (6) = happyGoto action_43
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (7) = happyShift action_9
action_26 (9) = happyShift action_10
action_26 (10) = happyShift action_11
action_26 (11) = happyShift action_12
action_26 (15) = happyShift action_13
action_26 (18) = happyShift action_14
action_26 (21) = happyShift action_15
action_26 (30) = happyShift action_16
action_26 (6) = happyGoto action_42
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (7) = happyShift action_9
action_27 (9) = happyShift action_10
action_27 (10) = happyShift action_11
action_27 (11) = happyShift action_12
action_27 (15) = happyShift action_13
action_27 (18) = happyShift action_14
action_27 (21) = happyShift action_15
action_27 (30) = happyShift action_16
action_27 (6) = happyGoto action_41
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (7) = happyShift action_9
action_28 (9) = happyShift action_10
action_28 (10) = happyShift action_11
action_28 (11) = happyShift action_12
action_28 (15) = happyShift action_13
action_28 (18) = happyShift action_14
action_28 (21) = happyShift action_15
action_28 (30) = happyShift action_16
action_28 (6) = happyGoto action_40
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (7) = happyShift action_9
action_29 (9) = happyShift action_10
action_29 (10) = happyShift action_11
action_29 (11) = happyShift action_12
action_29 (15) = happyShift action_13
action_29 (18) = happyShift action_14
action_29 (21) = happyShift action_15
action_29 (30) = happyShift action_16
action_29 (6) = happyGoto action_39
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (12) = happyShift action_38
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (17) = happyShift action_18
action_31 (19) = happyShift action_19
action_31 (20) = happyShift action_20
action_31 (21) = happyShift action_21
action_31 (22) = happyShift action_22
action_31 (23) = happyShift action_23
action_31 (24) = happyShift action_24
action_31 (25) = happyShift action_25
action_31 (26) = happyShift action_26
action_31 (27) = happyShift action_27
action_31 (28) = happyShift action_28
action_31 (29) = happyShift action_29
action_31 (31) = happyShift action_37
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_11

action_33 (17) = happyShift action_18
action_33 (19) = happyShift action_19
action_33 (20) = happyShift action_20
action_33 (21) = happyShift action_21
action_33 (22) = happyShift action_22
action_33 (23) = happyShift action_23
action_33 (24) = happyShift action_24
action_33 (25) = happyShift action_25
action_33 (26) = happyShift action_26
action_33 (27) = happyShift action_27
action_33 (28) = happyShift action_28
action_33 (29) = happyShift action_29
action_33 _ = happyReduce_9

action_34 (17) = happyShift action_18
action_34 (19) = happyShift action_19
action_34 (20) = happyShift action_20
action_34 (21) = happyShift action_21
action_34 (22) = happyShift action_22
action_34 (23) = happyShift action_23
action_34 (24) = happyShift action_24
action_34 (25) = happyShift action_25
action_34 (26) = happyShift action_26
action_34 (27) = happyShift action_27
action_34 (28) = happyShift action_28
action_34 (29) = happyShift action_29
action_34 _ = happyReduce_23

action_35 (7) = happyShift action_9
action_35 (9) = happyShift action_10
action_35 (10) = happyShift action_11
action_35 (11) = happyShift action_12
action_35 (15) = happyShift action_13
action_35 (18) = happyShift action_14
action_35 (21) = happyShift action_15
action_35 (30) = happyShift action_16
action_35 (6) = happyGoto action_36
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (17) = happyShift action_18
action_36 (19) = happyShift action_19
action_36 (20) = happyShift action_20
action_36 (21) = happyShift action_21
action_36 (22) = happyShift action_22
action_36 (23) = happyShift action_23
action_36 (24) = happyShift action_24
action_36 (25) = happyShift action_25
action_36 (26) = happyShift action_26
action_36 (27) = happyShift action_27
action_36 (28) = happyShift action_28
action_36 (29) = happyShift action_29
action_36 (31) = happyShift action_52
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_24

action_38 (8) = happyShift action_4
action_38 (14) = happyShift action_5
action_38 (5) = happyGoto action_51
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (17) = happyShift action_18
action_39 (20) = happyShift action_20
action_39 (21) = happyShift action_21
action_39 (22) = happyShift action_22
action_39 (23) = happyShift action_23
action_39 (24) = happyShift action_24
action_39 _ = happyReduce_21

action_40 (17) = happyShift action_18
action_40 (19) = happyShift action_19
action_40 (20) = happyShift action_20
action_40 (21) = happyShift action_21
action_40 (22) = happyShift action_22
action_40 (23) = happyShift action_23
action_40 (24) = happyShift action_24
action_40 (29) = happyShift action_29
action_40 _ = happyReduce_20

action_41 (17) = happyShift action_18
action_41 (19) = happyShift action_19
action_41 (20) = happyShift action_20
action_41 (21) = happyShift action_21
action_41 (22) = happyShift action_22
action_41 (23) = happyShift action_23
action_41 (24) = happyShift action_24
action_41 (29) = happyShift action_29
action_41 _ = happyReduce_19

action_42 (17) = happyShift action_18
action_42 (19) = happyShift action_19
action_42 (20) = happyShift action_20
action_42 (21) = happyShift action_21
action_42 (22) = happyShift action_22
action_42 (23) = happyShift action_23
action_42 (24) = happyShift action_24
action_42 (25) = happyFail []
action_42 (26) = happyFail []
action_42 (27) = happyShift action_27
action_42 (28) = happyShift action_28
action_42 (29) = happyShift action_29
action_42 _ = happyReduce_18

action_43 (17) = happyShift action_18
action_43 (19) = happyShift action_19
action_43 (20) = happyShift action_20
action_43 (21) = happyShift action_21
action_43 (22) = happyShift action_22
action_43 (23) = happyShift action_23
action_43 (24) = happyShift action_24
action_43 (25) = happyFail []
action_43 (26) = happyFail []
action_43 (27) = happyShift action_27
action_43 (28) = happyShift action_28
action_43 (29) = happyShift action_29
action_43 _ = happyReduce_17

action_44 _ = happyReduce_16

action_45 (17) = happyShift action_18
action_45 (24) = happyShift action_24
action_45 _ = happyReduce_15

action_46 (17) = happyShift action_18
action_46 (24) = happyShift action_24
action_46 _ = happyReduce_14

action_47 (17) = happyShift action_18
action_47 (22) = happyShift action_22
action_47 (23) = happyShift action_23
action_47 (24) = happyShift action_24
action_47 _ = happyReduce_13

action_48 (17) = happyShift action_18
action_48 (22) = happyShift action_22
action_48 (23) = happyShift action_23
action_48 (24) = happyShift action_24
action_48 _ = happyReduce_12

action_49 (17) = happyShift action_18
action_49 (20) = happyShift action_20
action_49 (21) = happyShift action_21
action_49 (22) = happyShift action_22
action_49 (23) = happyShift action_23
action_49 (24) = happyShift action_24
action_49 _ = happyReduce_10

action_50 _ = happyReduce_8

action_51 _ = happyReduce_3

action_52 (12) = happyShift action_53
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (8) = happyShift action_4
action_53 (14) = happyShift action_5
action_53 (5) = happyGoto action_54
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (13) = happyShift action_55
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (8) = happyShift action_4
action_55 (14) = happyShift action_5
action_55 (5) = happyGoto action_56
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_22

happyReduce_1 = happySpecReduce_0  4 happyReduction_1
happyReduction_1  =  HappyAbsSyn4
		 ([]
	)

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_2 : happy_var_1
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 6 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (EWhile happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn5
		 (EAssignment happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn6
		 (Int happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 _
	 =  HappyAbsSyn6
		 (EBool True
	)

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 _
	 =  HappyAbsSyn6
		 (EBool False
	)

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Equivalent happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  6 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Not happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (And happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  6 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Negative happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Add happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  6 happyReduction_13
happyReduction_13 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Minus happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  6 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Multiply happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Divide happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Exponential happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  6 happyReduction_17
happyReduction_17 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Lesser happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  6 happyReduction_18
happyReduction_18 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Greater happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  6 happyReduction_19
happyReduction_19 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (LesserEqual happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  6 happyReduction_20
happyReduction_20 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (GreaterEqual happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  6 happyReduction_21
happyReduction_21 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Or happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 8 6 happyReduction_22
happyReduction_22 ((HappyAbsSyn5  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (EIf happy_var_3 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_2  6 happyReduction_23
happyReduction_23 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (EPrint happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  6 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 32 32 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt _ happy_dollar_dollar -> cont 7;
	TokenVar _ happy_dollar_dollar -> cont 8;
	TokenTrue _ -> cont 9;
	TokenFalse _ -> cont 10;
	TokenIf _ -> cont 11;
	TokenThen _ -> cont 12;
	TokenElse _ -> cont 13;
	TokenWhile _ -> cont 14;
	TokenPrint _ -> cont 15;
	TokenEqual _ -> cont 16;
	TokenEquivalent _ -> cont 17;
	TokenNot _ -> cont 18;
	TokenAnd _ -> cont 19;
	TokenAdd _ -> cont 20;
	TokenMinus _ -> cont 21;
	TokenMultiply _ -> cont 22;
	TokenDivide _ -> cont 23;
	TokenExponential _ -> cont 24;
	TokenLesser _ -> cont 25;
	TokenGreater _ -> cont 26;
	TokenLesserEqual _ -> cont 27;
	TokenGreaterEqual  _ -> cont 28;
	TokenOr _ -> cont 29;
	TokenLeftParen _ -> cont 30;
	TokenRightParen _ -> cont 31;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 32 tk tks = happyError' (tks, explist)
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
         | EIf Exp Exp1 Exp1
         | EPrint Exp
         deriving (Show,Eq) 
		 
data Exp1 = EWhile Exp Exp1
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
