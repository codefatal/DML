package kh.project.dml.calender.model.vo;

import lombok.Data;

@Data
public class FpCalenderVo {

	
//	CREATE TABLE "CALENDAR" (
//			"CALENDARNO"	NUMBER		NOT NULL,
//			"MEMBER_ID"	VARCHAR2(20)		NOT NULL,
//			"TITLE"	VARCHAR2(100)		NULL,
//			"STARTDATE"	VARCHAR2(20)		NULL,
//			"ENDDATE"	VARCHAR2(20)		NULL,
//			"CONTENT"	VARCHAR2(200)		NULL
//		);
	
	private int calendarno;
	private String memberId;
	private String title;
	private String startDate;
	private String endDate;
	private String content;
	
}
