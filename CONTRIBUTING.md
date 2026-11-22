# 기여

## 준비

- Python 3.11과 `pip install -r test/requirements.txt`(cocotb, pytest)
- Icarus Verilog
- lint는 Verilator, 합성 검사는 Yosys

## 명령

```bash
make test    # cocotb RTL 시뮬레이션 (test/)
make lint    # verilator --lint-only -Wall
make synth   # yosys 합성, 래치가 없는지 확인하고 셀 통계 출력
```

파형은 `test/tb.fst`에 남고, `test/`에서 `gtkwave tb.fst tb.gtkw`로 봅니다.

### 게이트 수준 시뮬레이션

GDS 워크플로가 만든 넷리스트를 `test/gate_level_netlist.v`로 두고 `PDK_ROOT`(sky130A가 있는 폴더)를 지정한 뒤 `test/`에서 돌립니다.

```bash
make -B GATES=yes
```

## 소스 파일

- Verilog 파일은 `src/`에 둡니다.
- 파일을 더하면 `info.yaml`의 `source_files`와 `test/Makefile`의 `PROJECT_SOURCES`를 함께 고칩니다.

## CI

push마다 GitHub Actions가 돕니다.

| 워크플로 | 하는 일 |
|---|---|
| `test` | RTL 시뮬레이션 |
| `gds` | GDS 생성, Tiny Tapeout precheck, 게이트 수준 테스트, 결과 뷰어 배포 |
| `docs` | 데이터시트 문서 빌드 |
| `fpga` | FPGA 빌드. push로는 돌지 않고 수동 실행만 |
