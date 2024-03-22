/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/AdrianoSpinola/PE - 2024/pro/pe2024/counter.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0214451849_2193149556_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(27, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4240);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(28, ng0);
    t1 = xsi_get_transient_memory(3U);
    memset(t1, 0, 3U);
    t5 = t1;
    memset(t5, (unsigned char)2, 3U);
    t6 = (t0 + 4352);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 3U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 1992U);
    t5 = *((char **)t2);
    t2 = (t0 + 4352);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 3U);
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

}

static void work_a_0214451849_2193149556_p_1(char *t0)
{
    char t23[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:    t10 = (t0 + 2152U);
    t11 = *((char **)t10);
    t10 = (t0 + 1512U);
    t12 = *((char **)t10);
    t13 = 1;
    if (3U == 3U)
        goto LAB7;

LAB8:    t13 = 0;

LAB9:    if (t13 != 0)
        goto LAB5;

LAB6:
LAB13:    t24 = (t0 + 2152U);
    t25 = *((char **)t24);
    t24 = (t0 + 6664U);
    t26 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t23, t25, t24, 1);
    t27 = (t0 + 4416);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t26, 3U);
    xsi_driver_first_trans_fast(t27);

LAB2:    t32 = (t0 + 4256);
    *((int *)t32) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 2152U);
    t5 = *((char **)t1);
    t1 = (t0 + 4416);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 3U);
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB5:    t16 = xsi_get_transient_memory(3U);
    memset(t16, 0, 3U);
    t17 = t16;
    memset(t17, (unsigned char)2, 3U);
    t18 = (t0 + 4416);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t16, 3U);
    xsi_driver_first_trans_fast(t18);
    goto LAB2;

LAB7:    t14 = 0;

LAB10:    if (t14 < 3U)
        goto LAB11;
    else
        goto LAB9;

LAB11:    t10 = (t11 + t14);
    t15 = (t12 + t14);
    if (*((unsigned char *)t10) != *((unsigned char *)t15))
        goto LAB8;

LAB12:    t14 = (t14 + 1);
    goto LAB10;

LAB14:    goto LAB2;

}

static void work_a_0214451849_2193149556_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(39, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 4480);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 3U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4272);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0214451849_2193149556_init()
{
	static char *pe[] = {(void *)work_a_0214451849_2193149556_p_0,(void *)work_a_0214451849_2193149556_p_1,(void *)work_a_0214451849_2193149556_p_2};
	xsi_register_didat("work_a_0214451849_2193149556", "isim/tb_noise_suppressor_isim_beh.exe.sim/work/a_0214451849_2193149556.didat");
	xsi_register_executes(pe);
}
