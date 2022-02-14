/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   stream_out_char.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ski <marvin@42lausanne.ch>                 +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/11 18:14:42 by ski               #+#    #+#             */
/*   Updated: 2022/02/11 18:14:44 by ski              ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include "client.h"

/* ************************************************************************** */
void	stream_out_char(int byte, int pid_server, t_data *data)
{
	int	mask;
	int	result;
	int	i;
	int	us;

	us = data->us;
	mask = MASK_BIT_7;
	i = 7;
	while (i >= 0)
	{
		result = byte & mask;
		if (!result)
			kill(pid_server, SIGUSR1);
		else
			kill(pid_server, SIGUSR2);
		usleep(us);
		mask >>= 1;
		i--;
	}
	return ;
}

/* ************************************************************************** */
