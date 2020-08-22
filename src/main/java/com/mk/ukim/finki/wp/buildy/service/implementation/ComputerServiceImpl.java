package com.mk.ukim.finki.wp.buildy.service.implementation;

import com.mk.ukim.finki.wp.buildy.mapper.ComputerMapper;
import com.mk.ukim.finki.wp.buildy.model.dto.ComputerComponentNameDto;
import com.mk.ukim.finki.wp.buildy.model.dto.ComputerDto;
import com.mk.ukim.finki.wp.buildy.model.entity.Computer;
import com.mk.ukim.finki.wp.buildy.model.entity.User;
import com.mk.ukim.finki.wp.buildy.model.entity.components.*;
import com.mk.ukim.finki.wp.buildy.model.enumeration.ComputerComponentName;
import com.mk.ukim.finki.wp.buildy.model.exception.BuildyNotFoundException;
import com.mk.ukim.finki.wp.buildy.model.exception.ErrorCodes;
import com.mk.ukim.finki.wp.buildy.model.request.computer.SaveComputerRequest;
import com.mk.ukim.finki.wp.buildy.persistance.*;
import com.mk.ukim.finki.wp.buildy.service.ComputerService;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class ComputerServiceImpl implements ComputerService {

    private final ComputerRepository computerRepository;

    private final UserRepository userRepository;

    private final CpuRepository cpuRepository;
    private final GpuRepository gpuRepository;
    private final StorageRepository storageRepository;
    private final RamRepository ramRepository;
    private final CaseRepository caseRepository;
    private final MotherboardRepository motherboardRepository;
    private final PsuRepository psuRepository;
    private final CoolingRepository coolingRepository;

    public ComputerServiceImpl(ComputerRepository computerRepository,
                               UserRepository userRepository,
                               CpuRepository cpuRepository,
                               GpuRepository gpuRepository,
                               StorageRepository storageRepository,
                               RamRepository ramRepository,
                               CaseRepository caseRepository,
                               MotherboardRepository motherboardRepository,
                               PsuRepository psuRepository,
                               CoolingRepository coolingRepository) {
        this.computerRepository = computerRepository;
        this.userRepository = userRepository;
        this.cpuRepository = cpuRepository;
        this.gpuRepository = gpuRepository;
        this.storageRepository = storageRepository;
        this.ramRepository = ramRepository;
        this.caseRepository = caseRepository;
        this.motherboardRepository = motherboardRepository;
        this.psuRepository = psuRepository;
        this.coolingRepository = coolingRepository;
    }

    @Override
    public List<ComputerComponentNameDto> getComputerComponentNames() {
        List<ComputerComponentNameDto> computerComponentNameDtos = new ArrayList<>();

        for (ComputerComponentName c : ComputerComponentName.values()) {
            computerComponentNameDtos.add(ComputerMapper.toComputerComponentNameDto(c));
        }

        return computerComponentNameDtos;
    }

    @Override
    public ComputerDto getOursComputerDto(Long id) {
        if (!Arrays.asList(computerRepository.ourComputerIds).contains(id)) {
            throw new BuildyNotFoundException(ErrorCodes.COMPUTER_NOT_FOUND);
        }

        Computer computer = computerRepository
                .findById(id)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.COMPUTER_NOT_FOUND));

        return ComputerMapper.toComputerDto(computer);
    }

    @Override
    public ComputerDto saveComputerToUser(SaveComputerRequest saveComputerRequest) {
        User user = userRepository
                .findUserByUid(saveComputerRequest.userUid)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.USER_NOT_FOUND));

        Cpu cpu = cpuRepository
                .findCpuByUid(saveComputerRequest.cpu.partUid)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.CPU_NOT_FOUND));

        Gpu gpu = gpuRepository
                .findGpuByUid(saveComputerRequest.gpu.partUid)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.GPU_NOT_FOUND));

        Ram ram = ramRepository
                .findRamByUid(saveComputerRequest.ram.partUid)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.RAM_NOT_FOUND));

        Storage storage = storageRepository
                .findStorageByUid(saveComputerRequest.storage.partUid)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.STORAGE_NOT_FOUND));

        Case pcCase = caseRepository
                .findCaseByUid(saveComputerRequest.pcCase.partUid)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.CASE_NOT_FOUND));

        Cooling cooling = coolingRepository
                .findCoolingByUid(saveComputerRequest.cooling.partUid)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.COOLING_NOT_FOUND));

        Motherboard motherboard = motherboardRepository
                .findMotherboardByUid(saveComputerRequest.motherboard.partUid)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.MOTHERBOARD_NOT_FOUND));

        Psu psu = psuRepository
                .findPsuByUid(saveComputerRequest.psu.partUid)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.PSU_NOT_FOUND));

        Computer computer = new Computer();

        double totalPrice = cpu.getPrice() + gpu.getPrice() + ram.getPrice() + storage.getPrice() + pcCase.getPrice() + cooling.getPrice() + motherboard.getPrice() + psu.getPrice();
        computer.setCpu(cpu);
        computer.setGpu(gpu);
        computer.setRam(ram);
        computer.setStorage(storage);
        computer.setPcCase(pcCase);
        computer.setCooling(cooling);
        computer.setMotherboard(motherboard);
        computer.setPsu(psu);
        computer.setFanCount(1);
        computer.setName(saveComputerRequest.computerName);
        computer.setPrice(totalPrice);
        computer.setRamAmount(ram.getSize());
        computer.setStorageAmount(storage.getCapacity());
        computer.setUsers(Collections.singletonList(user));

        computerRepository.save(computer);

        return ComputerMapper.toComputerDto(computer);
    }

    @Override
    public List<ComputerDto> getComputersForUser(UUID userUid) {
        User user = userRepository.findUserByUid(userUid)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.USER_NOT_FOUND));

        List<Computer> computers = computerRepository.findAll()
                .stream()
                .filter(c -> c.getUsers().contains(user))
                .collect(Collectors.toList());

        return ComputerMapper.toComputerDtos(computers);
    }
}
