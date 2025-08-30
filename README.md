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

## 📂 Project Structure
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
git clone https://github.com/your-username/8-bit-ALU-Verilog.git
cd 8-bit-ALU-Verilog/src
```

1.Open the files in your Verilog simulator (ModelSim / Xilinx / Cadence).

2.Compile the design:
```
alu.v → ALU design

tb_alu.v → Testbench
```
3.Run the simulation and observe the waveforms.

## 🧮 ALU Operations
| Opcode | Operation | Description |
| ------ | --------- | ----------- |
| `000`  | ADD       | `A + B`     |
| `001`  | SUB       | `A - B`     |
| `010`  | AND       | `A & B`     |
| `011`  | OR        | `A \| B`    |
| `100`  | XOR       | `A ^ B`     |
| `101`  | NOT       | `~A`        |
| `110`  | INC       | `A + 1`     |
| `111`  | DEC       | `A - 1`     |


✅ Verified addition, subtraction, and logical operations.

✅ Testbench validated outputs for multiple test cases.

✅ Waveforms confirm correct ALU functionality.

📷 Example Simulation Waveform:

## 🎯 Skills Learned

 - RTL design in Verilog HDL

 - Testbench creation & functional verification

 - FPGA workflow and debugging

 - Digital design methodology

## 📌 Future Work

- Extend ALU to support multiplication & division.

- Implement on FPGA board and verify hardware output.

- Integrate with larger CPU design for system-level testing.

## 👨‍💻 Author

Muhammed Muhad
📧 Contact: [muhadpsy@gmail.com]
🔗 LinkedIn: [https://www.linkedin.com/in/muhad-/]


---

