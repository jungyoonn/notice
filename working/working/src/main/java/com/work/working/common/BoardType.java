package com.work.working.common;

public enum BoardType {
    FAQ ("질의응답"),
    INFO ("안내사항"),
    IMPORTANT ("중요공지");

    private final String name;
    BoardType(String name){
        this.name = name;
    }

    public String getName(){
        return this.name;
    }
    }
