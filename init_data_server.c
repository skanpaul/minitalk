/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init_data_server.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ski <marvin@42lausanne.ch>                 +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/13 10:31:16 by ski               #+#    #+#             */
/*   Updated: 2022/02/13 10:31:19 by ski              ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include "server.h"

/* ************************************************************************** */
void	init_data_server(t_data *d)
{
	init_basic(d);
	init_sigaction_structure(d);
	init_byte_counting(d);
	d->response_time_s = 0;
	d->response_time_us = 100000;
}

/* ************************************************************************** */
void	init_basic(t_data *d)
{
	d->pid_client = 0;
	d->size_stream = 0;
	d->str = NULL;
	d->i = 0;
}

/* ************************************************************************** */
void	init_response_time(char *str_time, t_data *d)
{
	d->response_time_s = (unsigned int)ft_atoi(str_time);
	d->response_time_us = d->response_time_s * 1000000;
	if (d->response_time_s == 0)
		d->response_time_us = 100000;
	if (d->response_time_s > 10)
		d->response_time_us = 9 * 1000000;
}

/* ************************************************************************** */
void	init_byte_counting(t_data *d)
{
	d->mask = MASK_BIT_7;
	d->byte = 0;
	d->bit_cnt = 0;
	d->byte_cnt = 0;
}

/* ************************************************************************** */
void	init_sigaction_structure(t_data *d)
{
	d->sa.sa_handler = &handler_sig_usr;
	d->sa.sa_flags = SA_RESTART;
	sigemptyset(&d->sa.sa_mask);
	sigaddset(&d->sa.sa_mask, SIGUSR1);
	sigaddset(&d->sa.sa_mask, SIGUSR2);
}
