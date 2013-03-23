

char* syobobo(int n_syobo){
	char* syobo;
	int i;
	syobo = (char*)malloc(n_syobo*6*2*sizeof(char)+1);
	for( i=0; i<n_syobo; i++ )
		strcat( syobo, "(´・ω・`)" );
	return syobo;

}
