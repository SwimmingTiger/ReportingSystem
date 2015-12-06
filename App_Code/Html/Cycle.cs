using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Html
{

    /// <summary>
    /// 轮转输出
    /// </summary>
    public class Cycle
    {
        int offset = 0;
        string[] texts;

        public Cycle(params string[] texts)
        {
            this.texts = texts;
        }

        override public string ToString() {
            if (offset >= texts.Count()) {
                offset = 0;
            }

            return texts[offset++];
        }
    }
}