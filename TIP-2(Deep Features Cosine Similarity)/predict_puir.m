inp1 = double((imread(['syn.png'])));
inp2 = double((imread(['org.png'])));

% IETR dataset parameters
lam_1 = 5.4100;
lam_2 = 3.1100;
gam = 600;

 score = puir(inp1, inp2, lam_1, lam_2, gam)