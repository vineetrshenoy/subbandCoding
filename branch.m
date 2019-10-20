function output = branch(signal, H_num, H_den, F_num, F_den, r)

	X = filter(H_num, H_den, signal);
	v = decim(X, r);
	z = interpolat(v, r);
	Y = filter(F_num, F_den, z);
	output = Y;

