/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   stream_in_str.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ski <marvin@42lausanne.ch>                 +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/14 08:36:27 by ski               #+#    #+#             */
/*   Updated: 2022/02/14 08:36:29 by ski              ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include "server.h"

/* ************************************************************************** */
int	stream_in_str(unsigned int start, char *str, t_data *d)
{
	if (start <= d->byte_cnt)
	{
		if (d->byte_cnt < (d->size_stream + start))
		{
			d->str[d->i] = (char)d->byte;
			d->i++;
		}		
		if (d->byte_cnt == (d->size_stream + start - 1))
		{
			write(1, d->str, d->size_stream);
			write(1, "\n", 1);
			free (d->str);
			usleep(d->response_time_us);
			kill(d->pid_client, SIGUSR1);
			init_basic(d);
			init_byte_counting(d);
			return (1);
		}
	}
	return (0);
}

/* ************************************************************************** */
