{-# OPTIONS_GHC -fno-warn-unused-binds -fno-warn-missing-signatures #-}
{-# LANGUAGE CPP #-}
{-# LINE 3 "Tokens.x" #-}
 
module Tokens where 

#if __GLASGOW_HASKELL__ >= 603
#include "ghcconfig.h"
#elif defined(__GLASGOW_HASKELL__)
#include "config.h"
#endif
#if __GLASGOW_HASKELL__ >= 503
import Data.Array
import Data.Array.Base (unsafeAt)
#else
import Array
#endif
{-# LINE 1 "templates/wrappers.hs" #-}
-- -----------------------------------------------------------------------------
-- Alex wrapper code.
--
-- This code is in the PUBLIC DOMAIN; you may copy it freely and use
-- it for any purpose whatsoever.






import Data.Word (Word8)
















import Data.Char (ord)
import qualified Data.Bits

-- | Encode a Haskell String to a list of Word8 values, in UTF8 format.
utf8Encode :: Char -> [Word8]
utf8Encode = map fromIntegral . go . ord
 where
  go oc
   | oc <= 0x7f       = [oc]

   | oc <= 0x7ff      = [ 0xc0 + (oc `Data.Bits.shiftR` 6)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ]

   | oc <= 0xffff     = [ 0xe0 + (oc `Data.Bits.shiftR` 12)
                        , 0x80 + ((oc `Data.Bits.shiftR` 6) Data.Bits..&. 0x3f)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ]
   | otherwise        = [ 0xf0 + (oc `Data.Bits.shiftR` 18)
                        , 0x80 + ((oc `Data.Bits.shiftR` 12) Data.Bits..&. 0x3f)
                        , 0x80 + ((oc `Data.Bits.shiftR` 6) Data.Bits..&. 0x3f)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ]



type Byte = Word8

-- -----------------------------------------------------------------------------
-- The input type


type AlexInput = (AlexPosn,     -- current position,
                  Char,         -- previous char
                  [Byte],       -- pending bytes on current char
                  String)       -- current input string

ignorePendingBytes :: AlexInput -> AlexInput
ignorePendingBytes (p,c,_ps,s) = (p,c,[],s)

alexInputPrevChar :: AlexInput -> Char
alexInputPrevChar (_p,c,_bs,_s) = c

alexGetByte :: AlexInput -> Maybe (Byte,AlexInput)
alexGetByte (p,c,(b:bs),s) = Just (b,(p,c,bs,s))
alexGetByte (_,_,[],[]) = Nothing
alexGetByte (p,_,[],(c:s))  = let p' = alexMove p c
                                  (b:bs) = utf8Encode c
                              in p' `seq`  Just (b, (p', c, bs, s))





























































-- -----------------------------------------------------------------------------
-- Token positions

-- `Posn' records the location of a token in the input text.  It has three
-- fields: the address (number of chacaters preceding the token), line number
-- and column of a token within the file. `start_pos' gives the position of the
-- start of the file and `eof_pos' a standard encoding for the end of file.
-- `move_pos' calculates the new position after traversing a given character,
-- assuming the usual eight character tab stops.


data AlexPosn = AlexPn !Int !Int !Int
        deriving (Eq,Show)

alexStartPos :: AlexPosn
alexStartPos = AlexPn 0 1 1

alexMove :: AlexPosn -> Char -> AlexPosn
alexMove (AlexPn a l c) '\t' = AlexPn (a+1)  l     (((c+alex_tab_size-1) `div` alex_tab_size)*alex_tab_size+1)
alexMove (AlexPn a l _) '\n' = AlexPn (a+1) (l+1)   1
alexMove (AlexPn a l c) _    = AlexPn (a+1)  l     (c+1)


-- -----------------------------------------------------------------------------
-- Default monad
















































































































-- -----------------------------------------------------------------------------
-- Monad (with ByteString input)







































































































-- -----------------------------------------------------------------------------
-- Basic wrapper

























-- -----------------------------------------------------------------------------
-- Basic wrapper, ByteString version
































-- -----------------------------------------------------------------------------
-- Posn wrapper

-- Adds text positions to the basic model.


--alexScanTokens :: String -> [token]
alexScanTokens str0 = go (alexStartPos,'\n',[],str0)
  where go inp__@(pos,_,_,str) =
          case alexScan inp__ 0 of
                AlexEOF -> []
                AlexError ((AlexPn _ line column),_,_,_) -> error $ "lexical error at line " ++ (show line) ++ ", column " ++ (show column)
                AlexSkip  inp__' _ln     -> go inp__'
                AlexToken inp__' len act -> act pos (take len str) : go inp__'



-- -----------------------------------------------------------------------------
-- Posn wrapper, ByteString version














-- -----------------------------------------------------------------------------
-- GScan wrapper

-- For compatibility with previous versions of Alex, and because we can.














alex_tab_size :: Int
alex_tab_size = 8
alex_base :: Array Int Int
alex_base = listArray (0 :: Int, 38)
  [ -8
  , -73
  , 0
  , 40
  , 0
  , 168
  , 296
  , -32
  , 552
  , 488
  , 0
  , -1
  , 6
  , 734
  , 697
  , 707
  , 0
  , -54
  , 0
  , -20
  , 0
  , 0
  , -31
  , 0
  , 0
  , 0
  , -41
  , -40
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  ]

alex_table :: Array Int Int
alex_table = listArray (0 :: Int, 989)
  [ 0
  , 12
  , 11
  , 12
  , 12
  , 12
  , 20
  , 18
  , 12
  , 12
  , 12
  , 12
  , 12
  , 16
  , 13
  , 12
  , 12
  , 12
  , 12
  , 12
  , 28
  , 29
  , 0
  , 0
  , 12
  , 19
  , 0
  , 0
  , 0
  , 0
  , 7
  , 12
  , 33
  , 34
  , 23
  , 21
  , 31
  , 22
  , 12
  , 24
  , 14
  , 14
  , 14
  , 14
  , 14
  , 14
  , 14
  , 14
  , 14
  , 14
  , 0
  , 32
  , 26
  , 17
  , 27
  , 0
  , 0
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 37
  , 0
  , 38
  , 25
  , 0
  , 0
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 35
  , 30
  , 36
  , 9
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 6
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 8
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 14
  , 14
  , 14
  , 14
  , 14
  , 14
  , 14
  , 14
  , 14
  , 14
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 15
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 8
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 10
  , 9
  , 6
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 2
  , 1
  , 5
  , 4
  , 4
  , 4
  , 3
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  ]

alex_check :: Array Int Int
alex_check = listArray (0 :: Int, 989)
  [ -1
  , 9
  , 10
  , 11
  , 12
  , 13
  , 38
  , 61
  , 9
  , 10
  , 11
  , 12
  , 13
  , 33
  , 45
  , 9
  , 10
  , 11
  , 12
  , 13
  , 61
  , 61
  , -1
  , -1
  , 32
  , 33
  , -1
  , -1
  , -1
  , -1
  , 38
  , 32
  , 40
  , 41
  , 42
  , 43
  , 44
  , 45
  , 32
  , 47
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , 59
  , 60
  , 61
  , 62
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , 91
  , -1
  , 93
  , 94
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 123
  , 124
  , 125
  , 191
  , 192
  , 193
  , 194
  , 195
  , 196
  , 197
  , 198
  , 199
  , 200
  , 201
  , 202
  , 203
  , 204
  , 205
  , 206
  , 207
  , 208
  , 209
  , 210
  , 211
  , 212
  , 213
  , 214
  , 215
  , 216
  , 217
  , 218
  , 219
  , 220
  , 221
  , 222
  , 223
  , 224
  , 225
  , 226
  , 227
  , 228
  , 229
  , 230
  , 231
  , 232
  , 233
  , 234
  , 235
  , 236
  , 237
  , 238
  , 239
  , 240
  , 241
  , 242
  , 243
  , 244
  , 245
  , 246
  , 247
  , 248
  , 249
  , 250
  , 251
  , 252
  , 253
  , 254
  , 255
  , 143
  , 144
  , 145
  , 146
  , 147
  , 148
  , 149
  , 150
  , 151
  , 152
  , 153
  , 154
  , 155
  , 156
  , 157
  , 158
  , 159
  , 160
  , 161
  , 162
  , 163
  , 164
  , 165
  , 166
  , 167
  , 168
  , 169
  , 170
  , 171
  , 172
  , 173
  , 174
  , 175
  , 176
  , 177
  , 178
  , 179
  , 180
  , 181
  , 182
  , 183
  , 184
  , 185
  , 186
  , 187
  , 188
  , 189
  , 190
  , 191
  , 192
  , 193
  , 194
  , 195
  , 196
  , 197
  , 198
  , 199
  , 200
  , 201
  , 202
  , 203
  , 204
  , 205
  , 206
  , 207
  , 208
  , 209
  , 210
  , 211
  , 212
  , 213
  , 214
  , 215
  , 216
  , 217
  , 218
  , 219
  , 220
  , 221
  , 222
  , 223
  , 224
  , 225
  , 226
  , 227
  , 228
  , 229
  , 230
  , 231
  , 232
  , 233
  , 234
  , 235
  , 236
  , 237
  , 238
  , 239
  , 240
  , 241
  , 242
  , 243
  , 244
  , 245
  , 246
  , 247
  , 248
  , 249
  , 250
  , 251
  , 252
  , 253
  , 254
  , 255
  , 128
  , 129
  , 130
  , 131
  , 132
  , 133
  , 134
  , 135
  , 136
  , 137
  , 138
  , 139
  , 140
  , 141
  , 142
  , 143
  , 144
  , 145
  , 146
  , 147
  , 148
  , 149
  , 150
  , 151
  , 152
  , 153
  , 154
  , 155
  , 156
  , 157
  , 158
  , 159
  , 160
  , 161
  , 162
  , 163
  , 164
  , 165
  , 166
  , 167
  , 168
  , 169
  , 170
  , 171
  , 172
  , 173
  , 174
  , 175
  , 176
  , 177
  , 178
  , 179
  , 180
  , 181
  , 182
  , 183
  , 184
  , 185
  , 186
  , 187
  , 188
  , 189
  , 190
  , 191
  , 192
  , 193
  , 194
  , 195
  , 196
  , 197
  , 198
  , 199
  , 200
  , 201
  , 202
  , 203
  , 204
  , 205
  , 206
  , 207
  , 208
  , 209
  , 210
  , 211
  , 212
  , 213
  , 214
  , 215
  , 216
  , 217
  , 218
  , 219
  , 220
  , 221
  , 222
  , 223
  , 224
  , 225
  , 226
  , 227
  , 228
  , 229
  , 230
  , 231
  , 232
  , 233
  , 234
  , 235
  , 236
  , 237
  , 238
  , 239
  , 240
  , 241
  , 242
  , 243
  , 244
  , 245
  , 246
  , 247
  , 248
  , 249
  , 250
  , 251
  , 252
  , 253
  , 254
  , 255
  , 128
  , 129
  , 130
  , 131
  , 132
  , 133
  , 134
  , 135
  , 136
  , 137
  , 138
  , 139
  , 140
  , 141
  , 142
  , 143
  , 144
  , 145
  , 146
  , 147
  , 148
  , 149
  , 150
  , 151
  , 152
  , 153
  , 154
  , 155
  , 156
  , 157
  , 158
  , 159
  , 160
  , 161
  , 162
  , 163
  , 164
  , 165
  , 166
  , 167
  , 168
  , 169
  , 170
  , 171
  , 172
  , 173
  , 174
  , 175
  , 176
  , 177
  , 178
  , 179
  , 180
  , 181
  , 182
  , 183
  , 184
  , 185
  , 186
  , 187
  , 188
  , 189
  , 190
  , 191
  , 192
  , 193
  , 194
  , 195
  , 196
  , 197
  , 198
  , 199
  , 200
  , 201
  , 202
  , 203
  , 204
  , 205
  , 206
  , 207
  , 208
  , 209
  , 210
  , 211
  , 212
  , 213
  , 214
  , 215
  , 216
  , 217
  , 218
  , 219
  , 220
  , 221
  , 222
  , 223
  , 224
  , 225
  , 226
  , 227
  , 228
  , 229
  , 230
  , 231
  , 232
  , 233
  , 234
  , 235
  , 236
  , 237
  , 238
  , 239
  , 240
  , 241
  , 242
  , 243
  , 244
  , 245
  , 246
  , 247
  , 248
  , 249
  , 250
  , 251
  , 252
  , 253
  , 254
  , 255
  , 0
  , 1
  , 2
  , 3
  , 4
  , 5
  , 6
  , 7
  , 8
  , 9
  , 10
  , 11
  , 12
  , 13
  , 14
  , 15
  , 16
  , 17
  , 18
  , 19
  , 20
  , 21
  , 22
  , 23
  , 24
  , 25
  , 26
  , 27
  , 28
  , 29
  , 30
  , 31
  , 32
  , 33
  , 34
  , 35
  , 36
  , 37
  , 38
  , 39
  , 40
  , 41
  , 42
  , 43
  , 44
  , 45
  , 46
  , 47
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , 58
  , 59
  , 60
  , 61
  , 62
  , 63
  , 64
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , 91
  , 92
  , 93
  , 94
  , 95
  , 96
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 123
  , 124
  , 125
  , 126
  , 127
  , 192
  , 193
  , 194
  , 195
  , 196
  , 197
  , 198
  , 199
  , 200
  , 201
  , 202
  , 203
  , 204
  , 205
  , 206
  , 207
  , 208
  , 209
  , 210
  , 211
  , 212
  , 213
  , 214
  , 215
  , 216
  , 217
  , 218
  , 219
  , 220
  , 221
  , 222
  , 223
  , 224
  , 225
  , 226
  , 227
  , 228
  , 229
  , 230
  , 231
  , 232
  , 233
  , 234
  , 235
  , 236
  , 237
  , 238
  , 239
  , 240
  , 241
  , 242
  , 243
  , 244
  , 245
  , 246
  , 247
  , 248
  , 249
  , 250
  , 251
  , 252
  , 253
  , 254
  , 255
  , 10
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 128
  , 129
  , 130
  , 131
  , 132
  , 133
  , 134
  , 135
  , 136
  , 137
  , 138
  , 139
  , 140
  , 141
  , 142
  , 143
  , 144
  , 145
  , 146
  , 147
  , 148
  , 149
  , 150
  , 151
  , 152
  , 153
  , 154
  , 155
  , 156
  , 157
  , 158
  , 159
  , 160
  , 161
  , 162
  , 163
  , 164
  , 165
  , 166
  , 167
  , 168
  , 169
  , 170
  , 171
  , 172
  , 173
  , 174
  , 175
  , 176
  , 177
  , 178
  , 179
  , 180
  , 181
  , 182
  , 183
  , 184
  , 185
  , 186
  , 187
  , 188
  , 189
  , 190
  , 191
  , 192
  , 193
  , 194
  , 195
  , 196
  , 197
  , 198
  , 199
  , 200
  , 201
  , 202
  , 203
  , 204
  , 205
  , 206
  , 207
  , 208
  , 209
  , 210
  , 211
  , 212
  , 213
  , 214
  , 215
  , 216
  , 217
  , 218
  , 219
  , 220
  , 221
  , 222
  , 223
  , 224
  , 225
  , 226
  , 227
  , 228
  , 229
  , 230
  , 231
  , 232
  , 233
  , 234
  , 235
  , 236
  , 237
  , 238
  , 239
  , 240
  , 241
  , 242
  , 243
  , 244
  , 245
  , 246
  , 247
  , 248
  , 249
  , 250
  , 251
  , 252
  , 253
  , 254
  , 255
  ]

alex_deflt :: Array Int Int
alex_deflt = listArray (0 :: Int, 38)
  [ -1
  , 10
  , 10
  , 2
  , 2
  , -1
  , -1
  , -1
  , 13
  , 13
  , 13
  , -1
  , -1
  , 13
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  ]

alex_accept = listArray (0 :: Int, 38)
  [ AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccSkip
  , AlexAccSkip
  , AlexAccSkip
  , AlexAcc 24
  , AlexAcc 23
  , AlexAcc 22
  , AlexAcc 21
  , AlexAcc 20
  , AlexAcc 19
  , AlexAcc 18
  , AlexAcc 17
  , AlexAcc 16
  , AlexAcc 15
  , AlexAcc 14
  , AlexAcc 13
  , AlexAcc 12
  , AlexAcc 11
  , AlexAcc 10
  , AlexAcc 9
  , AlexAcc 8
  , AlexAcc 7
  , AlexAcc 6
  , AlexAcc 5
  , AlexAcc 4
  , AlexAcc 3
  , AlexAcc 2
  , AlexAcc 1
  , AlexAcc 0
  ]

alex_actions = array (0 :: Int, 25)
  [ (24,alex_action_3)
  , (23,alex_action_4)
  , (22,alex_action_16)
  , (21,alex_action_17)
  , (20,alex_action_18)
  , (19,alex_action_19)
  , (18,alex_action_20)
  , (17,alex_action_21)
  , (16,alex_action_22)
  , (15,alex_action_23)
  , (14,alex_action_24)
  , (13,alex_action_25)
  , (12,alex_action_26)
  , (11,alex_action_27)
  , (10,alex_action_28)
  , (9,alex_action_29)
  , (8,alex_action_30)
  , (7,alex_action_31)
  , (6,alex_action_32)
  , (5,alex_action_33)
  , (4,alex_action_34)
  , (3,alex_action_35)
  , (2,alex_action_36)
  , (1,alex_action_37)
  , (0,alex_action_38)
  ]

{-# LINE 70 "Tokens.x" #-}
 
-- Each action has type :: AlexPosn -> String -> Token 
-- Helper Function
tok f p s = f p s


-- Each action has type :: String -> Token
-- Token Type: 
data Token = 
  TokenInt AlexPosn Int        |
  TokenVar AlexPosn String     |
  TokenIncrementS AlexPosn     |
  TokenReduceS AlexPosn        |
  TokenGetS AlexPosn           |
  TokenLengthS AlexPosn        |
  TokenTrue AlexPosn           |
  TokenFalse AlexPosn          |
  TokenIf AlexPosn             |
  TokenThen AlexPosn           |
  TokenElse AlexPosn           |
  TokenWhile AlexPosn          |
  TokenPrint AlexPosn          |
  TokenIndex AlexPosn          |
  TokenEqual AlexPosn          |
  TokenEquivalent AlexPosn     |
  TokenNot AlexPosn            |
  TokenAnd AlexPosn            |
  TokenAdd AlexPosn            |
  TokenMinus AlexPosn          |
  TokenMultiply AlexPosn       |
  TokenDivide AlexPosn         |
  TokenExponential AlexPosn    |
  TokenLesser AlexPosn         |
  TokenGreater AlexPosn        |
  TokenLesserEqual AlexPosn    |
  TokenGreaterEqual AlexPosn   |
  TokenOr AlexPosn             |
  TokenComma AlexPosn          |
  TokenEndExp AlexPosn         |
  TokenLeftParen AlexPosn      |
  TokenRightParen AlexPosn     |
  TokenLeftBrace AlexPosn      |
  TokenRightBrace AlexPosn     |
  TokenLeftBracket AlexPosn    |
  TokenRightBracket AlexPosn
  deriving (Eq,Show) 


--Token Functions
tokenPosn :: Token -> String
tokenPosn (TokenInt (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenVar (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIncrementS (AlexPn a l c) ) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenReduceS (AlexPn a l c) ) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGetS (AlexPn a l c) ) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLengthS (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTrue (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIf (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenThen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenElse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenWhile (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPrint (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIndex (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEquivalent (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNot (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAnd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAdd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMinus (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMultiply (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDivide (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenExponential (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLesser (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreater (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLesserEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreaterEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOr (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenComma (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEndExp (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLeftParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRightParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLeftBrace (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRightBrace (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLeftBracket (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRightBracket (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

--skip :: Action
--skip _ _ = lexToken


alex_action_3 =  tok (\p s -> TokenInt p (read s)) 
alex_action_4 =  tok (\p s -> TokenVar p s) 
alex_action_5 =  tok (\p s -> TokenIncrementS p) 
alex_action_6 =  tok (\p s -> TokenReduceS p) 
alex_action_7 =  tok (\p s -> TokenGetS p) 
alex_action_8 =  tok (\p s -> TokenLengthS p) 
alex_action_9 =  tok (\p s -> TokenTrue p) 
alex_action_10 =  tok (\p s -> TokenFalse p) 
alex_action_11 =  tok (\p s -> TokenIf p) 
alex_action_12 =  tok (\p s -> TokenThen p) 
alex_action_13 =  tok (\p s -> TokenElse p) 
alex_action_14 =  tok (\p s -> TokenWhile p) 
alex_action_15 =  tok (\p s -> TokenPrint p) 
alex_action_16 =  tok (\p s -> TokenIndex p) 
alex_action_17 =  tok (\p s -> TokenEqual p) 
alex_action_18 =  tok (\p s -> TokenEquivalent p) 
alex_action_19 =  tok (\p s -> TokenNot p) 
alex_action_20 =  tok (\p s -> TokenAnd p) 
alex_action_21 =  tok (\p s -> TokenAdd p) 
alex_action_22 =  tok (\p s -> TokenMinus p) 
alex_action_23 =  tok (\p s -> TokenMultiply p) 
alex_action_24 =  tok (\p s -> TokenDivide p) 
alex_action_25 =  tok (\p s -> TokenExponential p) 
alex_action_26 =  tok (\p s -> TokenLesser p) 
alex_action_27 =  tok (\p s -> TokenGreater p) 
alex_action_28 =  tok (\p s -> TokenLesserEqual p) 
alex_action_29 =  tok (\p s -> TokenGreaterEqual p) 
alex_action_30 =  tok (\p s -> TokenOr p) 
alex_action_31 =  tok (\p s -> TokenComma p) 
alex_action_32 =  tok (\p s -> TokenEndExp p) 
alex_action_33 =  tok (\p s -> TokenLeftParen p) 
alex_action_34 =  tok (\p s -> TokenRightParen p) 
alex_action_35 =  tok (\p s -> TokenLeftBrace p) 
alex_action_36 =  tok (\p s -> TokenRightBrace p) 
alex_action_37 =  tok (\p s -> TokenLeftBracket p) 
alex_action_38 =  tok (\p s -> TokenRightBracket p) 
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- -----------------------------------------------------------------------------
-- ALEX TEMPLATE
--
-- This code is in the PUBLIC DOMAIN; you may copy it freely and use
-- it for any purpose whatsoever.

-- -----------------------------------------------------------------------------
-- INTERNALS and main scanner engine































































alexIndexInt16OffAddr arr off = arr ! off




















alexIndexInt32OffAddr arr off = arr ! off











quickIndex arr i = arr ! i


-- -----------------------------------------------------------------------------
-- Main lexing routines

data AlexReturn a
  = AlexEOF
  | AlexError  !AlexInput
  | AlexSkip   !AlexInput !Int
  | AlexToken  !AlexInput !Int a

-- alexScan :: AlexInput -> StartCode -> AlexReturn a
alexScan input__ (sc)
  = alexScanUser undefined input__ (sc)

alexScanUser user__ input__ (sc)
  = case alex_scan_tkn user__ input__ (0) input__ sc AlexNone of
  (AlexNone, input__') ->
    case alexGetByte input__ of
      Nothing ->



                                   AlexEOF
      Just _ ->



                                   AlexError input__'

  (AlexLastSkip input__'' len, _) ->



    AlexSkip input__'' len

  (AlexLastAcc k input__''' len, _) ->



    AlexToken input__''' len (alex_actions ! k)


-- Push the input through the DFA, remembering the most recent accepting
-- state it encountered.

alex_scan_tkn user__ orig_input len input__ s last_acc =
  input__ `seq` -- strict in the input
  let
  new_acc = (check_accs (alex_accept `quickIndex` (s)))
  in
  new_acc `seq`
  case alexGetByte input__ of
     Nothing -> (new_acc, input__)
     Just (c, new_input) ->



      case fromIntegral c of { (ord_c) ->
        let
                base   = alexIndexInt32OffAddr alex_base s
                offset = (base + ord_c)
                check  = alexIndexInt16OffAddr alex_check offset

                new_s = if (offset >= (0)) && (check == ord_c)
                          then alexIndexInt16OffAddr alex_table offset
                          else alexIndexInt16OffAddr alex_deflt s
        in
        case new_s of
            (-1) -> (new_acc, input__)
                -- on an error, we want to keep the input *before* the
                -- character that failed, not after.
            _ -> alex_scan_tkn user__ orig_input (if c < 0x80 || c >= 0xC0 then (len + (1)) else len)
                                                -- note that the length is increased ONLY if this is the 1st byte in a char encoding)
                        new_input new_s new_acc
      }
  where
        check_accs (AlexAccNone) = last_acc
        check_accs (AlexAcc a  ) = AlexLastAcc a input__ (len)
        check_accs (AlexAccSkip) = AlexLastSkip  input__ (len)

        check_accs (AlexAccPred a predx rest)
           | predx user__ orig_input (len) input__
           = AlexLastAcc a input__ (len)
           | otherwise
           = check_accs rest
        check_accs (AlexAccSkipPred predx rest)
           | predx user__ orig_input (len) input__
           = AlexLastSkip input__ (len)
           | otherwise
           = check_accs rest


data AlexLastAcc
  = AlexNone
  | AlexLastAcc !Int !AlexInput !Int
  | AlexLastSkip     !AlexInput !Int

data AlexAcc user
  = AlexAccNone
  | AlexAcc Int
  | AlexAccSkip

  | AlexAccPred Int (AlexAccPred user) (AlexAcc user)
  | AlexAccSkipPred (AlexAccPred user) (AlexAcc user)

type AlexAccPred user = user -> AlexInput -> Int -> AlexInput -> Bool

-- -----------------------------------------------------------------------------
-- Predicates on a rule

alexAndPred p1 p2 user__ in1 len in2
  = p1 user__ in1 len in2 && p2 user__ in1 len in2

--alexPrevCharIsPred :: Char -> AlexAccPred _
alexPrevCharIs c _ input__ _ _ = c == alexInputPrevChar input__

alexPrevCharMatches f _ input__ _ _ = f (alexInputPrevChar input__)

--alexPrevCharIsOneOfPred :: Array Char Bool -> AlexAccPred _
alexPrevCharIsOneOf arr _ input__ _ _ = arr ! alexInputPrevChar input__

--alexRightContext :: Int -> AlexAccPred _
alexRightContext (sc) user__ _ _ input__ =
     case alex_scan_tkn user__ input__ (0) input__ sc AlexNone of
          (AlexNone, _) -> False
          _ -> True
        -- TODO: there's no need to find the longest
        -- match when checking the right context, just
        -- the first match will do.

