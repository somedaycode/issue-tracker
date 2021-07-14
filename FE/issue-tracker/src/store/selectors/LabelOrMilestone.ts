import { selectorFamily } from 'recoil';
import { baseURL } from '@const/var';
import { fetchWithAuth } from '@utils/fetchWithAuth';
import { urlErrorMsg, labelErrorMsg } from '@const/var';

export const LabelOrMilestone = selectorFamily({
  key: 'LabelOrMilestone',
  get: (path: string) => async () => {
    try {
      const url = `${baseURL}/${path}`;
      const res = await fetchWithAuth(url, labelErrorMsg);
      const jsonData = res.json();
      return jsonData;
    } catch (error) {
      if (typeof error === 'object') throw urlErrorMsg;
      throw error;
    }
  },
});
