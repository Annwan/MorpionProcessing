class Game {
  private int[][] grid;

  private void grd() {
    int GRIDZONE = 400;
    stroke(0);
    strokeWeight(5);
    line(10, 10, GRIDZONE - 10, 10);
    line(10, 10 + ((GRIDZONE - 20) / 3), 
      GRIDZONE - 10, 10 + ((GRIDZONE - 20) / 3));
    line(10, 10 + 2 * ((GRIDZONE - 20) / 3), 
      GRIDZONE - 10, 10 + 2 * ((GRIDZONE - 20) / 3));
    line(10, GRIDZONE - 10, GRIDZONE - 10, GRIDZONE - 10);
    line(10, 10, 10, GRIDZONE - 10);
    line(10 + ((GRIDZONE - 20) / 3), 10, 
      10 + ((GRIDZONE - 20) / 3), GRIDZONE - 10);
    line(10 + 2 * ((GRIDZONE - 20) / 3), 10, 
      10 + 2 * ((GRIDZONE - 20) / 3), GRIDZONE - 10);
    line(GRIDZONE - 10, 10, GRIDZONE - 10, GRIDZONE - 10);
  }

  private void crx(int r, int c) {
    int GRIDZONE = 400;
    int xa1 = 20 + c * ((GRIDZONE - 20) / 3);
    int ya1 = 20 + r * ((GRIDZONE - 20) / 3);
    int xa2 = (((GRIDZONE - 20) / 3)) + c * ((GRIDZONE - 20) / 3);
    int ya2 = (((GRIDZONE - 20) / 3)) + r * ((GRIDZONE - 20) / 3);
    int xb1 = 20 + c * ((GRIDZONE - 20) / 3);
    int yb1 = (((GRIDZONE - 20) / 3)) + r * ((GRIDZONE - 20) / 3);
    int xb2 = (((GRIDZONE - 20) / 3)) + c * ((GRIDZONE - 20) / 3);
    int yb2 = 20 + r * ((GRIDZONE - 20) / 3);
    stroke(255, 0, 0);
    strokeWeight(5);
    line(xa1, ya1, xa2, ya2);
    line(xb1, yb1, xb2, yb2);
  }
  private void crc(int r, int c) {
    int GRIDZONE = 400;
    ellipseMode(CENTER);
    int cx = ((c * (GRIDZONE - 20)) / 3) + ((GRIDZONE - 20) / 6) + 10;
    int cy = ((r * (GRIDZONE - 20)) / 3) + ((GRIDZONE - 20) / 6) + 10;
    stroke(0, 0, 255);
    strokeWeight(5);
    ellipse(cx, cy, (GRIDZONE - 60) / 3, (GRIDZONE - 60) / 3);
  }
  public Game() {
    this.grid = new int[3][3];
  }
  public void disp() {
    this.grd();
    for (int r=0; r<3; r++) {
      for (int c=0; c<3; c++) {
        if (this.grid[r][c] == 1) {
          this.crx(r, c);
        } else if (this.grid[r][c] == 2) {
          this.crc(r, c);
        }
      }
    }
  }

  public int checkWin() {
    int A1 = this.grid[0][0];
    int A2 = this.grid[0][1];
    int A3 = this.grid[0][2];
    int B1 = this.grid[1][0];
    int B2 = this.grid[1][1];
    int B3 = this.grid[1][2];
    int C1 = this.grid[2][0];
    int C2 = this.grid[2][1];
    int C3 = this.grid[2][2];
    if (A1 == B1 && A1 == C1) {
      return A1;
    }
    if (A1 == A2 && A1 == A3) {
      return A1;
    }
   if (B1 == B2 && B1 == B3) {
      return B1;
    }
   if (A2 == B2 && A2 == C2) {
      return A2;
    }
   if (A1 == B2 && A1 == C3) {
      return A1;
    }
   if (C1 == C2 && C1 == C3) {
      return C1;
    }
   if (C1 == B2 && C1 == A3) {
      return C1;
    } else {
      boolean full = true;
      for (int[] row : this.grid) {
        for (int cell : row) {
          if (cell == 0) {
            full = false;
          }
        }
      }
      if (full) {
        return 3;
      } else {
        return 0;
      }
    }
  }
  public void reinit() {
    for (int r=0; r<3; r++) {
      for (int c=0; c<3; c++) {
        this.grid[r][c] = 0;
      }
    }
  }
  public int play(int row, int col, int player) {
    if (!(0 <= row && row < 3 && 0 <= col && col < 3)) {
      return 1;
    } else if (this.grid[row][col] != 0) {
      return 2;
    } else {
      this.grid[row][col] = player;
      return 0;
    }
  }
}
