"""Helper to add new entries to allocated-pids.txt.

0x8006 | LILYGO TTGO T8 ESP32-S2 - Arduino
0x8007 | LILYGO TTGO T8 ESP32-S2 - CircuitPython
0x8008 | LILYGO TTGO T8 ESP32-S2 - UF2 Bootloader

"""
import argparse
from ast import literal_eval

FILE_NAME = "allocated-pids.txt"
SUPPORT = [
    "Arduino",
    "CircuitPython",
    "UF2 Bootloader",
]


def get_last_pid():
    """Get the last present PID."""
    with open(FILE_NAME, "r") as file_pids:
        last_line = file_pids.readlines()[-1]
    last_pid = last_line.split("|")[0]
    return literal_eval(last_pid)


def write_new_pids(last_pid, device):
    """Add the new entries to the file."""
    with open(FILE_NAME, "a") as file_pids:
        for entry in range(1, 4):
            next_pid = last_pid + entry
            file_pids.write(f"0x{next_pid:X} | {device} - {SUPPORT[entry-1]}\n")


def main():
    """Main part of the script."""
    last_pid = get_last_pid()

    parser = argparse.ArgumentParser()
    parser.add_argument("device", help="Device name")
    args = parser.parse_args()

    write_new_pids(last_pid, args.device)
    print(f"Entries added. Please review {FILE_NAME} and create a Pull Request")


if __name__ == "__main__":
    main()
