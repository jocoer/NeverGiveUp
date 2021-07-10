//本地保存
//将每一关的最高成绩保存在本地的数据库

import QtQuick 2.15
import QtQuick.LocalStorage 2.0
import Felgo 3.0

Item {
    id: root

    property var db
    property int data

    //初始化数据库
    function init () {
        db = LocalStorage.openDatabaseSync("NeverGiveUp", "1.0", "A Score of every level", 1000);
        db.transaction( function(tx) {
            console.log ("init db")
            tx.executeSql('CREATE TABLE IF NOT EXISTS levelscore(level TEXT, score INT)');
        });
    }

    //读取数据库
    function read (level) {
        if(!db) { return; }
        db.transaction( function(tx) {
            var result = tx.executeSql('select * from levelscore where level=?', [level]);
            if(result.rows.length === 1) {
                root.data = result.rows[0].score
            }
        });
        return root.data
    }

    //读取数据库中数据的条目
    function readAll () {
        if(!db) { return; }
        var alldata
        db.transaction( function(tx) {
            var result = tx.executeSql('select * from levelscore');
            alldata = result
        });
        return alldata
    }

    //保存关卡成绩数据
    function store (level, score) {
        if(!db) { return; }
        console.log(level)
        db.transaction( function(tx) {
            console.log ("store data")
            var result = tx.executeSql('SELECT * from levelscore where level = ?', [level]);
            if(result.rows.length === 1) {// update
                if (result.rows[0].score < score)
                    result = tx.executeSql('UPDATE levelscore set score=? where level = ?', [score, level]);
            } else { // insert
                result = tx.executeSql('INSERT INTO levelscore VALUES (?,?)', [level, score]);
            }
        });
    }

    //删除数据库数据，用于测试和管理
    function deletedata (level)
    {
        if(!db) { return; }
        console.log(level)
        db.transaction( function(tx) {
            console.log ("delete data")
            console.log (level)
            tx.executeSql('DELETE FROM levelscore WHERE level = ?', [level]);
        });
    }
}
