package com.techelevator;

public class Elevator {

	private int currentFloor;
	private int numberOfFloors;
	private boolean doorOpen;
	
	public Elevator(int numberOfLevels) {
		numberOfFloors = numberOfLevels;
		currentFloor = 1;
	}
	
	// getters
	
	public int getCurrentFloor() {
		return currentFloor;
	}
	public int getNumberOfFloors() {
		return numberOfFloors;
	}
	public boolean isDoorOpen() {
		return doorOpen;
	}
	
	// methods
	
	public void openDoor() {
		doorOpen = true;
	}
	public void closeDoor() {
		doorOpen = false;
	}
	public void goUp(int desiredFloor) {
		if(!doorOpen && desiredFloor >= currentFloor && desiredFloor <= numberOfFloors) {
			currentFloor = desiredFloor;
		}
	}
	public void goDown(int desiredFloor) {
		if(!doorOpen && desiredFloor <= currentFloor && desiredFloor >= 1) {
			currentFloor = desiredFloor;
		}
	}
}
