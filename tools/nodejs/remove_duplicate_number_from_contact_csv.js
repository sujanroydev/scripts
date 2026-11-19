import fs from "node:fs";
import { parse } from "csv-parse/sync";
import { stringify } from "csv-stringify/sync";

const inputFile = process.argv[2] || "input.csv";
const outputFile = process.argv[3] || "output.csv";

const csv = fs.readFileSync(inputFile, "utf8");

const records = parse(csv, {
  columns: true,
  skip_empty_lines: true,
  bom: true,
});

const seen = new Set();

const uniqueRecords = records.filter((row) => {
  const key = row["Phone 1 - Value"]?.trim();

  if (!key || seen.has(key)) return false;

  seen.add(key);
  return true;
});

const output = stringify(uniqueRecords, {
  header: true,
  columns: Object.keys(records[0] || {}),
});

fs.writeFileSync(outputFile, output);

console.log(`Total rows: ${records.length}`);
console.log(`Unique rows: ${uniqueRecords.length}`);
console.log(`Duplicates removed: ${records.length - uniqueRecords.length}`);
console.log(`Saved to: ${outputFile}`);
