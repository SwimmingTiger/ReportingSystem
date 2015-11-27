using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Permission
{
    /// <summary>
    /// 权限异常类
    /// </summary>
    public class PermissionException : Exception
    {
        public PermissionException(string msg) : base(msg)
        {
            // 该类没有扩展 Exception 的功能。
            // 该类是为了区分不同类型的异常
        }
    }

    /// <summary>
    /// 用户权限常量
    /// </summary>
    public class UserPermission
    {
        /// <summary>
        /// 编辑报表（手工录入）
        /// </summary>
        public const int EDIT_REPORTS = 1;

        /// <summary>
        /// 核对报表（收款稽核）
        /// </summary>
        public const int CHECK_REPORTS = 1 << 1; // 1 << 1 = 00000001左移一位 = 00000010 = 2

        /// <summary>
        /// 阅读报表（数据归集）
        /// </summary>
        public const int READ_REPORTS = 1 << 2; // 1 << 2 = 00000001左移两位 = 00000100 = 4

        /// <summary>
        /// 编辑用户（权限管理）
        /// </summary>
        public const int EDIT_USER = 1 << 3;

        /// <summary>
        /// 编辑报表参数（参数管理）
        /// </summary>
        public const int EDIT_REPORT_PARAMS = 1 << 4;

        /// <summary>
        /// 阅读日志（日志管理）
        /// </summary>
        public const int READ_LOG = 1 << 5;

        public static string GetPermissionName(int permission)
        {
            string name = null;

            switch (permission)
            {
                case EDIT_REPORTS:
                    break;

                default:
                    throw new Exception("未知权限id“" + permission.ToString() + "”");
                    break;
            }

            return name;
        }
    }
}