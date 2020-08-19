package com.mk.ukim.finki.wp.buildy.model.request.computer;

import java.util.UUID;

public class SaveComputerRequest {

    public UUID userUid;

    public String computerName;

    public ComputerComponentRequest cpu;

    public ComputerComponentRequest gpu;

    public ComputerComponentRequest ram;

    public ComputerComponentRequest storage;

    public ComputerComponentRequest psu;

    public ComputerComponentRequest motherboard;

    public ComputerComponentRequest cooling;

    public ComputerComponentRequest pcCase;
}
