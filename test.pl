:- module(test, [my_blockify/3, my_flatten/2, sum/2,
	locate/3, locateAll/3, vecLine2BitLine/4, vecLineAll2BitLineAll/4,
	trans/2, isBitLineLegal/2, isBitLineLegalAll/2, solve/4]).

:- include('lib/crisp_includes').
:- include('ex6').

describe(my_blockify/3,
    [
      setof(X1, my_blockify([1,2,3,4,5,6,7,8], 3, X1),O1)
      , O1==[[[1, 2, 3], [4, 5, 6], [7, 8]]]
    , setof(X2, my_blockify([1,2,3], 1, X2),O2)
        , O2==[[[1],[2],[3]]]
    , setof(X3, my_blockify([7,6,5,4,3,2,1], 2, X3),O3)
        , O3==[[[7,6],[5,4],[3,2],[1]]]
    , setof(X4, my_blockify([1,2,3,4,5,6], 6, X4),O4)
        , O4==[[[1,2,3,4,5,6]]]
    , setof(X5, my_blockify([1,2,3,4,5,6], 5, X5),O5)
        , O5==[[[1,2,3,4,5],[6]]]
    ]).

describe(my_flatten/2,
    [
      setof(X1, my_flatten([[1], [[5, 7], [10], []], [[[3, 2]]]], X1),O1)
        , O1==[[1, 5, 7, 10, 3, 2]]
    , setof(X2, my_flatten([1], X2),O2)
        , O2==[[1]]
    , setof(X3, my_flatten([], X3), O3)
        , O3==[[]]
    , setof(X4, my_flatten([[[[[[[[1]]]]]]]], X4),O4)
        , O4==[[1]]
    , setof(X5, my_flatten([[[[[1]]]],[[2]],[[3],[4]],[[[5]]]], X5), O5)
        , O5==[[1,2,3,4,5]]
    , setof(X6, my_flatten([1,2,[[3],[4]],[[[[[[[5,6]],7]]]]]], X6),O6)
        , O6==[[1,2,3,4,5,6,7]]
    ]).

describe(sum/2,
    [
      setof(X1, sum([2,3,5,9], X1), O1), O1=[19]
    , setof(X2, sum([], X2), O2), O2=[0]
    , setof(X3, sum([1], X3), O3), O3=[1]
    , setof(X4, sum([1,2,3],X4),O4), O4=[6]
    , setof(X5, sum([0,1,2,3,4,5,6,7,8,9,10], X5), O5), O5=[55]
    ]).

describe(locate/3,
    [
      setof(X1, (locate([1],4,X1)), S1), S1==[[1],[2], [3], [4]]
    , setof(X2, (locate([2,2],6,X2)), S2), S2==[[1,4], [1,5], [2,5]]
    , setof(X3, (locate([3,1],7, X3)), S3), S3==[[1,5],[1,6],[1,7],[2,6],[2,7],[3,7]]
    , setof(X4, (locate([3],3, X4)), S4), S4==[[1]]
    , setof(X5, (locate([3],4, X5)), S5), S5==[[1], [2]]
    , setof(X6, (locate([2,1,1],6, X6)), S6), S6==[[1,4,6]]
    ]).


describe(locateAll/3,
    [
      setof(X1,locateAll([[2,2],[2,3]],X1,6),O1), O1==[[[1, 4], [1, 4]], [[1, 5], [1, 4]], [[2, 5], [1, 4]]]
    , setof(X2,locateAll([[1],[3]],X2,4),O2), O2==[[[1],[1]],[[1],[2]],[[2],[1]],[[2],[2]],[[3],[1]],[[3],[2]],[[4],[1]],[[4],[2]]]
    , setof(X3,locateAll([[1,1],[4]],X3,4),O3), O3==[[[1,3],[1]], [[1,4],[1]], [[2,4],[1]]]
    ]).

describe(vecLine2BitLine/4,
    [
      setof(X1,vecLine2BitLine([1,2,1],[2,5,9],12,X1),O1), O1==[[' ',*,' ',' ',*,*,' ',' ',*,' ',' ',' ']]
    , setof(X2,vecLine2BitLine([1,1],[3,5],5,X2),O2), O2==[[' ', ' ', *, ' ', *]]
    , setof(X3,vecLine2BitLine([1,1,1,1,1],[1,3,5,7,9],10, X3),O3), O3==[[*, ' ', *, ' ', *, ' ', *, ' ', *, ' ']]
    , setof(X4,vecLine2BitLine([2,1],[3,6],6, X4),O4), O4==[[' ', ' ', *, *, ' ', *]]
    , setof(X5,vecLine2BitLine([1],[1],1, X5),O5), O5==[[*]]
    ]).

describe(vecLineAll2BitLineAll/4,
    [
      setof(X1,vecLineAll2BitLineAll([[1,1],[1,1]],[[1, 3],[2,4]],4,X1),O1), O1==[[[*, ' ', *, ' '], [' ', *, ' ', *]]]
    ,	setof(X2,vecLineAll2BitLineAll([[1,2],[3,1,1]],[[1, 4],[2, 6, 8]],8,X2),O2),
		O2==[[[*,' ',' ',*,*,' ',' ',' '],[' ',*,*,*,' ',*,' ',*]]]
    ]).

describe(trans/2,
    [
    	setof(X1, trans([[1,2,3],[4,5,6],[7,8,9]],X1), O1), O1==[[[1,4,7],[2,5,8],[3,6,9]]]
    , setof(X3, trans([[1]],X3), O3), O3==[[[1]]]
    , setof(X4, trans([[1,1,1,1],[2,2,2,2],[3,3,3,3],[4,4,4,4]],X4), O4), O4==[[[1,2,3,4],[1,2,3,4],[1,2,3,4],[1,2,3,4]]]
    ]).

describe(isBitLineLegal/2,
    [
			\+isBitLineLegal([' ',*,' '],[2])
	  ,	isBitLineLegal([*],[1])
	  ,	isBitLineLegal([' '],[])
	  ,	isBitLineLegal([' ', *,' '], [1])
	  ,	isBitLineLegal([*,' ',*,*,*,*,' ',*,' '], [1,4,1])
	  ,	\+isBitLineLegal([*,' ',*,*,*,*,' ',*,' '], [1,2,1])
	  ,	isBitLineLegal([*,*,*,*,*,*], [6])
    ]).


describe(isBitLineLegalAll/2,
    [
			isBitLineLegalAll([[' ',*,' '],[*]],[[1],[1]])
		,	isBitLineLegalAll([[' '],[*,*,*,' ',*]],[[],[3,1]])
		,	isBitLineLegalAll([[*,' ',*,' ',*,' ',*,' ',*],[*]],[[1,1,1,1,1],[1]])
    ]).


describe(solve/4,
    [
			setof(X1, solve([[3],[4],[2],[1,1],[1,1]],[[2,2],[2],[2],[2],[3]],5,X1),O1)
      , O1==[[[1], [1], [4], [1, 5], [1, 5]]]
		,	setof(X2, solve([[2,2],[7],[2,4],[7],[5],[3],[1]],[[3],[5],[2,3],[6],[6],[5],[3]],7,X2),O2)
      , O2==[[[2, 5], [1], [1, 4], [1], [2], [3], [4]]]
		,	setof(X3, solve([[1,3],[2,1],[1,1,1],[1,1],[5]], [[5],[1,1],[1,1,1],[1,2],[3,1]],5,X3),O3)
      , O3==[[[1,3],[1,5],[1,3,5],[1,4],[1]]]
		,	setof(X4, solve([[2,1],[1,3],[1,2],[3],[4],[1]],
				[[1],[5],[2],[5],[2,1],[2]],6,X4), O4)
			,	O4==[[[1, 6], [2, 4], [2, 4], [2], [2], [4]]]
		,	setof(X5,solve([[2],[3],[3],[3,1],[1]], [[2],[3],[4],[2],[2]],5,X5),O5)
			,	O5==[[[3], [2], [1], [1, 5], [5]]]
		,	setof(X6, solve([[5],[2,1],[1,2,1],[2],[4],[1,4]],
			[[4,1],[2,1],[1,1,2],[3,2],[1,2],[1,2]],6,X6),O6)
			,	O6==[[[1], [1, 4], [1, 3, 6], [1], [3], [1, 3]]]
		,	setof(X7, solve([[4,1],[3,1],[4],[4,3],[4,1],[1,1,1,2],[3,3],[3,1,2]],
                [[1,5],[2,2,2],[8],[1,3],[1,1,3],[2,1],[1,5],[1,1,1,1]],8,X7), O7)
			,	O7==[[[2, 7], [1, 8], [3], [1, 6], [1, 7], [1, 3, 5, 7], [1, 5], [1, 5, 7]],
                    [[2, 8], [1, 7], [3], [1, 6], [1, 7], [1, 3, 5, 7], [1, 5], [1, 5, 7]]]
		,	setof(X8, solve([[4,1],[2,2,1],[1,1,1],[1,1,2],[2,2],[3,1,1],[5]],
                [[4,2],[2,2],[1,3],[5,1],[1,2],[3],[2,3]],7,X8),O8)
			,	O8==[[[1, 7], [1, 4, 7], [1, 4, 6], [1, 4, 6], [3, 6], [1, 5, 7], [1]]]
		, setof(X9, solve([[5],[7],[1,1,4],[4,2],[3,2],[1,2],[1,2],[2]],[[2],[2,2,1],[6],[2,2],[4],[3,2],[7],[4]],8,X9),O9)
			, O9=[[[2],[1],[1,3,5],[2,7],[2,7],[3,7],[2,6],[6]]]
    ]).
