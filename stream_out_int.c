/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   stream_out_int.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ski <marvin@42lausanne.ch>                 +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/13 15:34:51 by ski               #+#    #+#             */
/*   Updated: 2022/02/13 15:34:54 by ski              ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include "client.h"

/* ************************************************************************** */
void	stream_out_int(int int_value, t_data *data)
{
	int	temp;

	temp = int_value;
	temp >>= 24;
	temp = temp & 0x000000FF;
	stream_out_char(temp, data->pid_server, data);
	temp = int_value;
	temp >>= 16;
	temp = temp & 0x000000FF;
	stream_out_char(temp, data->pid_server, data);
	temp = int_value;
	temp >>= 8;
	temp = temp & 0x000000FF;
	stream_out_char(temp, data->pid_server, data);
	temp = int_value;
	temp >>= 0;
	temp = temp & 0x000000FF;
	stream_out_char(temp, data->pid_server, data);
	return ;
}
