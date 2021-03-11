package com.techelevator;

public class HomeworkAssignment {

	private int earnedMarks;
	private int possibleMarks;
	private String submitterName;
	
	public HomeworkAssignment(int possibleMarks, String submitterName) {
		this.possibleMarks = possibleMarks;
		this.submitterName = submitterName;
	}
	
	// getters
	
	public int getEarnedMarks() {
		return earnedMarks;
	}
	
	public int getPossibleMarks() {
		return possibleMarks;
	}
	public String getSubmitterName() {
		return submitterName;
	}
	public String getLetterGrade() {
		double percentageGrade = (double) earnedMarks / possibleMarks;
		if (percentageGrade >= 0.90) {
			return "A";
		} else if (percentageGrade >= 0.80) {
			return "B";
		} else if (percentageGrade >= 0.70) {
			return "C";
		} else if (percentageGrade >= 0.60) {
			return "D";
		} else {
			return "F";
		}
	}
	
	// setters
	
	public void setEarnedMarks(int earnedMarks) {
		this.earnedMarks = earnedMarks;
	}
}
