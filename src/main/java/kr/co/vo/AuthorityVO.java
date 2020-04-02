package kr.co.vo;

import java.util.Date;

public class AuthorityVO {
   private int GROUP_NO; 
   private String GROUP_NAME;
   private String GROUP_EXPLAIN; 
   private String FIRST_SCREEN;
   private int FIRST_SCREEN_CODE;
   private String AUTH_WRITER;
   private Date AUTH_REGDATE;
   private String AUTH_MFWRITER;
   private Date AUTH_MODIFYDATE;
   
	public int getGROUP_NO() {
		return GROUP_NO;
	}
	public void setGROUP_NO(int gROUP_NO) {
		GROUP_NO = gROUP_NO;
	}
	public String getGROUP_NAME() {
		return GROUP_NAME;
	}
	public void setGROUP_NAME(String gROUP_NAME) {
		GROUP_NAME = gROUP_NAME;
	}
	public String getGROUP_EXPLAIN() {
		return GROUP_EXPLAIN;
	}
	public void setGROUP_EXPLAIN(String gROUP_EXPLAIN) {
		GROUP_EXPLAIN = gROUP_EXPLAIN;
	}
	public String getFIRST_SCREEN() {
		return FIRST_SCREEN;
	}
	public void setFIRST_SCREEN(String fIRST_SCREEN) {
		FIRST_SCREEN = fIRST_SCREEN;
	}
	public String getAUTH_WRITER() {
		return AUTH_WRITER;
	}
	public void setAUTH_WRITER(String aUTH_WRITER) {
		AUTH_WRITER = aUTH_WRITER;
	}
	public Date getAUTH_REGDATE() {
		return AUTH_REGDATE;
	}
	public void setAUTH_REGDATE(Date aUTH_REGDATE) {
		AUTH_REGDATE = aUTH_REGDATE;
	}
	public int getFIRST_SCREEN_CODE() {
		return FIRST_SCREEN_CODE;
	}
	public void setFIRST_SCREEN_CODE(int fIRST_SCREEN_CODE) {
		FIRST_SCREEN_CODE = fIRST_SCREEN_CODE;
	}
	public String getAUTH_MFWRITER() {
		return AUTH_MFWRITER;
	}
	public void setAUTH_MFWRITER(String aUTH_MFWRITER) {
		AUTH_MFWRITER = aUTH_MFWRITER;
	}
	public Date getAUTH_MODIFYDATE() {
		return AUTH_MODIFYDATE;
	}
	public void setAUTH_MODIFYDATE(Date aUTH_MODIFYDATE) {
		AUTH_MODIFYDATE = aUTH_MODIFYDATE;
	}
   
   
}
