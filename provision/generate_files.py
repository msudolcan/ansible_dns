"""
This module will generate all of the network files needed by Ansible to
provision a DNS server in the Domain Controller
"""
from pathlib import Path


def main():
    host_file = Path('ansible/hosts.ini')
    host_file.write_text(
        'server.rcdt.net\n'
        'gitlab.rcdt.net\n'
        'wiki.rcdt.net\n'
    )


if __name__=="__main__":
    main()
