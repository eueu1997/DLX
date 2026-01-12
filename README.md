# DLX (VHDL)

This folder contains several *different* DLX-related code drops (student work, provided “prof” sources, and simulator outputs). The important part is that there are **multiple DLX entity variants** and **multiple testbenches**, so you must pick a consistent set of sources when compiling/simulating.

## Repository layout (what each folder is)

### Root of `DLX/`
- Small/standalone modules + their testbenches:
  - `ALU.vhd`, `ALU_tb.vhd`
  - `shifter.vhd`, `shifter_tb.vhd`
  - `_tb.vhd`, `prova_tb.vhdl` (misc benches)

### `datapath/` (our datapath project area)
- Contains a datapath implementation and “phase” subprojects used during incremental development.
- Key files:
  - `datapath/datapath.vhd`, `datapath/datapath_m.vhd`
  - `datapath/a.a-CU_HW.vhd`
  - `datapath/phases/` with `phase_1/` … `phase_4/`
  - `datapath/compile.bash` (ModelSim/Questa `vcom` compile list)
- Also contains simulator-generated artifacts (`work/`, `transcript`, `vsim.wlf`) and editor backups (`*.vhd~`).

### `DLX project/Files/DLX_vhd/` (provided “prof” sources)
- A self-contained DLX project drop.
- Contains the “simpler” DLX variant and its testbench:
  - `a-DLX.vhd` (entity `DLX` with only `Clk`/`Rst` ports)
  - `test_bench/TB_DLX.vhd` (entity `tb_dlx`), instantiates that `DLX`
- Also contains `000-globals.vhd` which defines `package myTypes`.

### `DLX project/Files/DLX_vhd_fully_synthesizable/`
- Another provided DLX variant meant to be more complete/synthesizable.
- Contains a different `a-DLX.vhd` (entity `DLX`) that exposes IRAM/DRAM interfaces (address/issue/ready/data).
- Contains the “full-system” testbench + memory/cache models under:
  - `test_bench_and_memory/`

### `istruction decode/`
- Instruction decode / register file related blocks (note the folder name is misspelled as `istruction`).
- Includes a `3.1.3_windowed_RF/` area with simulation VHDL.

## Top-level DUT and testbenches (what to run)

There are multiple top/testbenches; the two main ones are:

### 1) Full-system testbench (recommended entry point)
- Top testbench entity: **`DLX_TestBench`**
- File: `DLX project/Files/DLX_vhd_fully_synthesizable/test_bench_and_memory/TB_TOP_DLX.vhd`
- What it instantiates:
  - `ROMEM` (instruction memory model)
    - File: `DLX project/Files/DLX_vhd_fully_synthesizable/test_bench_and_memory/TB_romem/romem.vhd`
  - `RWMEM` (read/write memory model)
    - File: `DLX project/Files/DLX_vhd_fully_synthesizable/test_bench_and_memory/TB_rwmem/rwmem.vhd`
  - **DUT `DLX`** (the CPU core)
    - File: `DLX project/Files/DLX_vhd_fully_synthesizable/a-DLX.vhd`
- Packages used by this TB:
  - `ROCACHE_PKG`: `DLX project/Files/DLX_vhd_fully_synthesizable/test_bench_and_memory/TB_packages/rocache.vhd`
  - `RWCACHE_PKG`: `DLX project/Files/DLX_vhd_fully_synthesizable/test_bench_and_memory/TB_packages/rwcache.vhd`

### 2) Minimal DLX testbench (clock/reset only)
- Top testbench entity: **`tb_dlx`**
- File: `DLX project/Files/DLX_vhd/test_bench/TB_DLX.vhd`
- DUT instantiated: **`DLX`** from `DLX project/Files/DLX_vhd/a-DLX.vhd`
  - This is a different `DLX` entity signature than the “fully_synthesizable” version.

## Important notes about multiple `DLX` variants

There are at least **two distinct `entity DLX` definitions** in this repo:
- `DLX project/Files/DLX_vhd/a-DLX.vhd` → `DLX` with only `Clk`/`Rst` ports.
- `DLX project/Files/DLX_vhd_fully_synthesizable/a-DLX.vhd` → `DLX` with IRAM/DRAM ports.

So you cannot mix those testbenches/sources without reconciling the port list.

## Missing / inconsistent files (things to fix)

### Empty “DataPath” files in the provided project
Both of these files exist but are **empty**, which indicates the datapath source is missing from the provided set:
- `DLX project/Files/DLX_vhd/a.b-DataPath.vhd`
- `DLX project/Files/DLX_vhd_fully_synthesizable/a.b-DataPath.vhd`

If the DLX core is expected to instantiate a datapath, you’ll need to add the real datapath implementation here (or update the project to point to the datapath in `datapath/`).

### Phase 2 sources referenced by `compile.bash` do not exist
In `datapath/phases/phase_2/`:
- `decode.vhd` is missing, but `decode.vhd~` exists.
- `register.vhd` is missing, but `register.vhd~` exists.
- There is a `register_1.vhd` which might be the intended replacement, but scripts/components referencing `register.vhd` will fail.

Also, `datapath/compile.bash` references:
- `phase_2/register.vhd`
- `phase_2/decode.vhd`
…which are not present, so the script will error.

### Hardcoded absolute Linux paths (will fail on Windows)
- `datapath/compile.bash` uses absolute `/home/...` paths.
- `TB_TOP_DLX.vhd` passes absolute `/home/.../hex*.txt` paths as generics to `ROMEM` and `RWMEM`.

On this Windows workspace, those files/paths will not resolve until you:
- change generics to workspace-relative paths, and
- ensure the `.txt`/hex files exist in the repo.

## Simulator outputs / generated artifacts (not source)
You will see many generated files/folders such as:
- `work/` (compiled libraries)
- `transcript` and `vsim.wlf`
- `*.qdb`, `*.qpg`, `*.qtl`
These are simulator artifacts and not the authoritative source.

## Quick orientation / next steps
- If you want the full system simulation: compile the `DLX_vhd_fully_synthesizable` sources + `test_bench_and_memory` and run `DLX_TestBench` from `TB_TOP_DLX.vhd`.
- If you just want a basic DLX skeleton clock/reset: use `DLX_vhd` + `TB_DLX.vhd`.
- To get `datapath/compile.bash` working: remove absolute paths and fix phase_2 filenames (restore from `*.vhd~` or update references).
