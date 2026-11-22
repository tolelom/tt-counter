# tt-counter

> Tiny Tapeout 칩에 올리는 8비트 카운터

Verilog · Tiny Tapeout(sky130A) · cocotb

## 기능

- 클록 상승 에지마다 1씩 증가, 255 다음은 0
- `rst_n`이 low면 다음 클록 에지에서 0
- 카운트를 전용 출력 `uo_out`으로 출력
- 1x1 타일, 50 MHz 클록

| 핀 | 용도 |
|---|---|
| `uo[0]`~`uo[7]` | `count[0]`~`count[7]` |
| `ui`, `uio` | 미사용 |

외부 하드웨어는 필요 없습니다.

## 시작하기

칩에서는 `rst_n`을 몇 클록 동안 low로 두었다가 풉니다. `uo_out`이 0을 읽은 뒤 클록마다 1씩 늘어나면 정상입니다.

## 문서

| 문서 | 내용 |
|---|---|
| `info.yaml` | 프로젝트 정보, 최상위 모듈, 소스 파일, 핀 배치 |
| `docs/info.md` | 데이터시트 원문(동작, 시험 방법) |
| `test/README.md` | cocotb 테스트벤치 실행과 파형 보기 |

## 기여

시뮬레이션, lint, 합성 명령은 `CONTRIBUTING.md`에 있습니다.

## 라이선스

[Apache License 2.0](LICENSE)
