module TestEnv :
  sig
    val countOk : int ref
    val countFail : int ref
    val countLatest : int ref
    val test : bool -> bool
    val checkComplainAndAdjustExpected : int -> bool
    val result : unit -> string
  end
