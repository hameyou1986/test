import math

TABLE_SIZE = 1024

print("/** Ln Table for [1, 2), step = 1/1024 */")
print("const float LnTable[1024] = {")
for i in range(TABLE_SIZE):
    x = 1.0 + i / TABLE_SIZE
    ln_x = math.log(x)

    # 每 4 个一行，方便阅读
    if i % 4 == 0:
        print("    ", end="")

    print(f"{ln_x:.10f}f", end="")

    if i != TABLE_SIZE - 1:
        print(", ", end="")
    else:
        print("")

    if i % 4 == 3:
        print()

print("};")
