"""Extract plain text from a .docx file using only the standard library.

Usage: python extract_text.py <file.docx>
"""
import re
import sys
import zipfile
from xml.etree import ElementTree

W = "{http://schemas.openxmlformats.org/wordprocessingml/2006/main}"


def docx_text(path):
    with zipfile.ZipFile(path) as z:
        root = ElementTree.fromstring(z.read("word/document.xml"))
    paragraphs = []
    for p in root.iter(W + "p"):
        text = "".join(node.text or "" for node in p.iter(W + "t"))
        if text.strip():
            paragraphs.append(text)
    return "\n\n".join(paragraphs)


if __name__ == "__main__":
    if len(sys.argv) != 2 or not re.search(r"\.docx$", sys.argv[1], re.I):
        sys.exit("Usage: python extract_text.py <file.docx>")
    sys.stdout.reconfigure(encoding="utf-8")
    print(docx_text(sys.argv[1]))
