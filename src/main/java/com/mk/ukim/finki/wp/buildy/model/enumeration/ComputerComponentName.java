package com.mk.ukim.finki.wp.buildy.model.enumeration;

public enum ComputerComponentName {
    CPU("Processor"),
    GPU("Graphics card"),
    RAM("RAM"),
    Case("Case"),
    Cooling("Cooling Fan"),
    Motherboard("Motherboard"),
    PSU("Power supply"),
    Storage("Storage");

    public final String longName;

    ComputerComponentName(String longName) {
        this.longName = longName;
    }
}
