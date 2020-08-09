package com.mk.ukim.finki.wp.buildy.model.enumeration;

// TODO: Rename this -> ComputerComponentName
public enum ComputerComponentNames {
    CPU("Processor"),
    GPU("Graphics Card"),
    RAM("RAM"),
    Case("Case"),
    Cooling("Cooling Fan"),
    Motherboard("Motherboard"),
    PSU("Power supply"),
    Storage("Storage");


    public final String longName;

    ComputerComponentNames(String longName) {
        this.longName = longName;
    }
}
