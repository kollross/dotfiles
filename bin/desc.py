#!/usr/bin/env python3
import sys

def transform_quote(quote):
    return quote.upper().replace(" ", "_")

def main():
    if len(sys.argv) != 2:
        print("Usage: ./script.py \"your quote here\"")
        sys.exit(1)

    quote = sys.argv[1]
    transformed = transform_quote(quote)
    print(transformed)

if __name__ == "__main__":
    main()

