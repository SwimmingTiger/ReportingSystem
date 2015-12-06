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
        public const int AUDIT_REPORTS = 1 << 1; // 1 << 1 = 00000001左移一位 = 00000010 = 2

        /// <summary>
        /// 阅读报表（数据归集）
        /// </summary>
        public const int READ_REPORTS = 1 << 2; // 1 << 2 = 00000001左移两位 = 00000100 = 4

        /// <summary>
        /// 编辑用户（权限管理）
        /// </summary>
        public const int EDIT_USER = 1 << 3; // 8

        /// <summary>
        /// 编辑报表参数（参数管理）
        /// </summary>
        public const int EDIT_REPORT_PARAMS = 1 << 4; // 16

        /// <summary>
        /// 阅读日志（日志管理）
        /// </summary>
        public const int READ_LOG = 1 << 5; // 32

        public static readonly Dictionary<int, string> PermissionNames = new Dictionary<int, string>
        {
            { EDIT_REPORTS, "编辑报表" },
            { AUDIT_REPORTS , "核对报表" },
            { READ_REPORTS , "阅读报表" },
            { EDIT_USER , "编辑用户" },
            { EDIT_REPORT_PARAMS , "编辑报表参数" },
            { READ_LOG , "阅读日志" },

        };

        public static string GetName(int permission)
        {
            return PermissionNames[permission];
        }
    }
}