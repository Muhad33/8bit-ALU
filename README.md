# ⚙️ 8-bit ALU Design in Verilog

## 📌 Introduction
This project implements an **8-bit Arithmetic Logic Unit (ALU)** using **Verilog HDL**.  
The ALU performs **arithmetic** (Addition, Subtraction) and **logical** (AND, OR, XOR) operations.  
A **testbench** was created for functional verification, and the design was simulated on an FPGA workflow.

---

## 🛠️ Tools & Technologies
- 🔹 Verilog HDL  
- 🔹 ModelSim / Xilinx ISE / Cadence (based on environment used)  
- 🔹 FPGA Development Workflow  
- 🔹 Digital Design & Simulation  

---

## 📂 Repository Structure
```bash
8-bit-ALU-Verilog/
│── src/              # Verilog source files
│   ├── alu.v         # 8-bit ALU module
│   └── tb_alu.v      # Testbench
│
│── results/          # Simulation outputs
│   ├── alu_waveform.png
│   └── alu_test_results.txt
│
│── docs/             # Documentation & diagrams
│   └── alu_block_diagram.png
│
└── README.md         # Project documentation
```
## 🚀 How to Run

Clone the repository:
```bash
git clone https://github.com/Muhad33/8bit-ALU.git
cd 8bit-ALU/src
```

1.Open the files in your Verilog simulator (ModelSim / Xilinx / Cadence).

2.Compile the design:
```
alu.v → ALU design

tb_alu.v → Testbench
```
3.Run the simulation and observe the waveforms.

## 🧮 ALU Operations
### Opcode Table

| Opcode | Operation | Description     |
|--------|-----------|-----------------|
| `0000` | ADD       | `A + B`         |
| `0001` | SUBB      | `A - B - Cin`   |
| `0010` | AND       | `A & B`         |
| `0011` | OR        | `A \| B`        |
| `0100` | XOR       | `A ^ B`         |
| `0101` | NOT       | `~A`            |
| `0110` | NEG       | `-A`            |
| `0111` | SHL       | `A << 1`        |
| `1000` | SHR       | `A >> 1` (logical shift right) |
| `1001` | SAR       | `A >>> 1` (arithmetic shift right) |
| `1010` | INC       | `A + 1`         |
| `1011` | DEC       | `A - 1`         |
| `1100` | MUL       | `A * B`         |
| `1101` | CMP       | Compare A & B   |



✅ Verified addition, subtraction, and logical operations.

✅ Testbench validated outputs for multiple test cases.

✅ Waveforms confirm correct ALU functionality.

## 📷 Example Simulation Waveform:
![Image](https://github.com/user-attachments/assets/e9aafef8-e992-43ac-9a50-ddea350707a6)

 

## 🎯 Skills Learned

 - RTL design in Verilog HDL

 - Testbench creation & functional verification

 - FPGA workflow and debugging

 - Digital design methodology

## 📌 Future Work


- Integrate with larger CPU design for system-level testing.

## 👨‍💻 Author

Muhammed Muhad
📧 Contact: [muhadpsy@gmail.com]
🔗 LinkedIn: [https://www.linkedin.com/in/muhad-/]


---

