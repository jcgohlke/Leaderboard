//
//  Scores.swift
//  Leaderboard
//
//  Created by Joben Gohlke on 4/11/17.
//
//

import StORM
import SQLiteStORM
import PerfectLib

class Score: SQLiteStORM
{
  var id = 0
  var userName = ""
  var displayName = ""
  var score = 0
  
  // required by the db to name the table
  override open func table() -> String
  {
    return "Scores"
  }
  
  override func to(_ this: StORMRow)
  {
    id = this.data["id"] as? Int ?? 0
    userName = this.data["username"] as? String ?? ""
    displayName = this.data["displayname"] as? String ?? ""
    score = this.data["score"] as? Int ?? 0
  }

  func rows() -> [Score]
  {
    var scores = [Score]()
    for i in 0..<results.rows.count
    {
      let aScore = Score()
      aScore.to(results.rows[i])
      scores.append(aScore)
    }
    return scores
  }
  
  override public func setup()
  {
    do {
      try sqlExec("CREATE TABLE IF NOT EXISTS Scores (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, username TEXT, displayname TEXT, score INT) ")
    } catch
    {
      print(error)
    }
  }
}
