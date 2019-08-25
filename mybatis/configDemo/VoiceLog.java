package com.study.mybatis;

public class VoiceLog {
    private String id;
    private String name;
    private String context;
    private String logtime;
    public VoiceLog(String name, String context)
    {
    	this.name = name;
    	this.context = context;
    }
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.id + " " + this.name + " " + this.context + " " + this.logtime + "\n";
	}
}
