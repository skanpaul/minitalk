/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ski <marvin@42lausanne.ch>                 +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/09 09:56:34 by ski               #+#    #+#             */
/*   Updated: 2022/02/09 09:56:36 by ski              ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include "client.h"

/* ************************************************************************** */
t_data	g_d;
/* ************************************************************************** */
void	handler_sig_usr(int sig_c);

/* ************************************************************************** */
int	main(int argc, char **argv)
{
	if (argc != 3)
	{
		ft_printf("Wrong ARGUMENT\n");
		return (1);
	}
	g_d.pid_server = ft_atoi(argv[1]);
	if (!g_d.pid_server)
	{
		ft_printf("It is not a PID number\n");
		return (1);
	}
	init_data_client(&g_d);
	sigaction(SIGUSR1, &g_d.sa, 0);
	g_d.size_stream = ft_strlen(argv[2]);
	stream_out_int(g_d.pid_client, &g_d);
	stream_out_int(g_d.size_stream, &g_d);
	stream_out_string(argv[2], g_d.pid_server, &g_d);
	ft_printf("Attentre réponse du Server [%d]\n", g_d.pid_server);
	while (1)
		pause();
	return (0);
}

/* ************************************************************************** */
void	handler_sig_usr(int sig_c)
{
	if (sig_c == SIGUSR1)
	{
		ft_printf("Message reçu du SERVER [%d]\n", g_d.pid_server);
		exit(1);
	}
	return ;
}

/* ************************************************************************** */
