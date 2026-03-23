#!/usr/bin/env python3

import os
import subprocess
import argparse

# Constants
YT_DL = "/usr/local/bin/yt-dlp"

PLAYLISTS = {
    "mon": {
        "url": "https://www.youtube.com/playlist?list=PLGsktWFpRqNo62e29pI36Yc9ts5QVX0mC",
        "dir": "/Users/kollross/.Shared/bin/youtube/mondragon/full_vids/",
        "help": "Download Mondragon playlist",
    },
    "dl": {
        "url": "https://youtube.com/playlist?list=PLGsktWFpRqNp291MnlrfbmWd4P7CauHYH&si=ijQjYp-dqSNnGsBw",
        "dir": "/Users/kollross/.Shared/bin/youtube/dl/",
        "help": "Download DL playlist",
    },
    "nc": {
        "url": "https://www.youtube.com/playlist?list=PLAuRR8NlEBO0D84dYzYQXWWHs1vxNg2W3",
        "dir": "/Users/kollross/.Shared/bin/youtube/mondragon/non_client/",
        "help": "Mondragon Non Client",
    },
    "ls": {
        "url": "https://youtube.com/playlist?list=PLGsktWFpRqNrh6TNuxqJ8CTYjfUrRRXQp&si=r-gXW0hsAGdo20Qz",
        "dir": "/Users/kollross/.Shared/bin/youtube/laura_sarasua/",
        "help": "Laura Sarasura",
    },
    "bb": {
        "url": "https://youtube.com/playlist?list=PLGsktWFpRqNrh6TNuxqJ8CTYjfUrRRXQp&si=r-gXW0hsAGdo20Qz",
        "dir": "/Users/kollross/.Shared/bin/youtube/backpacking_bannanas/",
        "help": "Backpacking Bananas",
    },
    "kh": {
        "url": "https://youtube.com/playlist?list=PLGsktWFpRqNrvQxg0conCwuAKPrE3BS7u&si=TFqcxXq8RIbTLjsf",
        "dir": "/Users/kollross/.Shared/bin/youtube/kelly_hays/",
        "help": "Kelly Hays",
    },
    "nm": {
        "url": "https://youtube.com/playlist?list=PLGsktWFpRqNofPKiita3VSTfIG8VXXuCd&si=9w1p0X3qHC6pZP1I",
        "dir": "/Users/kollross/.Shared/bin/youtube/nomad/",
        "help": "Nomad",
    },
    "head": {
        "url": "https://youtube.com/playlist?list=PLGsktWFpRqNpAYDraXULreEbJx2ypfk7t&si=4RJolyhsnG0IgR99",
        "dir": "/Users/kollross/.Shared/bin/youtube/head/",
        "help": "Mad Head Massage",
    },
    "s2a": {
        "url": "https://youtube.com/playlist?list=PLGsktWFpRqNopP8m7sX4R-o7piiSnNSaM&si=q0eQs3o6-W2aPosW",
        "dir": "/Users/kollross/.Shared/bin/youtube/s2a/",
        "help": "Steps 2 Adventure",
    },
    "al": {
        "url": "https://youtube.com/playlist?list=PLGsktWFpRqNqVlQBe6vptDQZ-fJ8T1278&si=emYPR482J7M_dE5o",
        "dir": "/Users/kollross/.Shared/bin/youtube/al/",
        "help": "Annalee",
    },
    "asia": {
        "url": "https://youtube.com/playlist?list=PLGsktWFpRqNoNCyC5svStofA8iVtTaSAE&si=X4_AOitTIQcueguE",
        "dir": "/Users/kollross/.Shared/bin/youtube/asia/",
        "help": "asia",
    },
    "bee": {
        "url": "https://youtube.com/playlist?list=PLGsktWFpRqNrw_6hXC7bCIT1cz-HVsMsA&si=Mnmtoxjsi7fShrSj"
        "dir": "/Users/kollross/.Shared/bin/youtube/bee/",
        "help": "Bee",
    },
}

def download_playlist(target_dir, playlist_url, dry_run=False):
    cmd = [
        YT_DL,
        "-S", "res,ext:mp4:m4a",
        "--recode", "mp4",
	"--cookies", "yt_cookie",
        playlist_url
    ]

    if dry_run:
        print(f"[Dry Run] Directory: {target_dir}")
        print("Command:", " ".join(cmd))
    else:
        os.makedirs(target_dir, exist_ok=True)
        subprocess.run(cmd, cwd=target_dir, check=True)

# Argument parsing
parser = argparse.ArgumentParser(description="YT Downloader")

for key, data in PLAYLISTS.items():
    parser.add_argument(f"--{key}", action="store_true", help=data["help"])

parser.add_argument(
    "--all",
    action="store_true",
    help="Download ALL playlists"
)

parser.add_argument(
    "--dry-run",
    action="store_true",
    help="Print the command instead of executing it"
)

args = parser.parse_args()

# Determine what to download
selected = []

if args.all:
    selected = PLAYLISTS.values()
else:
    for key, data in PLAYLISTS.items():
        if getattr(args, key):
            selected.append(data)

if not selected:
    parser.error(
        "You must specify at least one playlist option or --all"
    )

# Execute downloads
for entry in selected:
    download_playlist(
        entry["dir"],
        entry["url"],
        dry_run=args.dry_run
    )
